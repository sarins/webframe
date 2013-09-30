package com.huatek.authority.factory;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.huatek.authority.entity.EfwApplyScope;
import com.huatek.base.entity.BaseEntity;
import com.huatek.base.tree.TreeEntity;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwSource;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.Util;


/****
 * 本类用于实现数据权限的校验.
 *
 * @author winner pan
 */
public final class DataAuthority {
	public static final String IS_APPLY_AUTHORITY = "IS_APPLY_AUTHORITY";

	public static final String FRESH_USER_DATA_AUTHORITY = "fresh_user_data_authority";
	/***
	 * 树节点层级.
	 */
	public static final String STYLE_LEVEL = "styleLevel";
	/***
	 * SQL 的 AND关键字.
	 */
	private static final String AND_KEY = " and ";
	/**
	 * SQL 的 WHERE关键字.
	 */
	private static final String WHERE_KEY = " where ";
	/***
	 * SQL 的 FROM关键字.
	 */
	private static final String FROM_KEY = " from ";
	/***
	 * 不列入数据权限控制的模块ID.
	 */
	//public static final String EXCEPTION_MODULE_IDS = "26713,33802";

	/**
	 * 日志常量.
	 * **/
	private static final Logger LOGGER = Logger.getLogger(DataAuthority.class);


	/***
	 * 默认的构造函数.
	 */
	private DataAuthority() {

	}

	/***
	 * 获取当前模块下的权限设置.
	 *
	 * @return 返回当前模块下的数据权限map
	 */
	public static ModuleAuthorityBean getModuleAuthorityBean() {
		if (ThreadLocalClient.get() == null) {
			return null;
		}
		if (ThreadLocalClient.get().getMenuId() == null) {
			return null;
		}
		FwAccount user = ThreadLocalClient.get().getOperator();
		Map<String, Map<String, Map<String, FieldAuthority>>> menuMap = user
				.getBaseUserAuthorityData();
		if (menuMap == null) {
			return null;
		}
		FwSource module = null;
		if (ThreadLocalClient.get().getSrcAction() != null) {
			module = ThreadLocalClient.get().getSrcAction().getFwSource();
		} else {
			module = ThreadLocalClient.get().getOperator().getUserMenuMap().get(ThreadLocalClient.get().getMenuId().toString());
		}
		if (module == null) {
			return null;
		}
		/*if (isContains(module.getId().toString(), EXCEPTION_MODULE_IDS)) {
			return null;
		}*/
		FwSource source = module;
		Map<String, Map<String, FieldAuthority>> returnMap = menuMap.get(source.getId()
				.toString());
		while (source.getParent() != null && returnMap == null) {
			source = (FwSource) source.getParent();
			returnMap = menuMap.get(source.getId().toString());
		}
		return new ModuleAuthorityBean(returnMap, source.getId().toString());
	}

	/***
	 * 判断当前CLASS的实例是否有权限.
	 *
	 * @param entityClass
	 *            属性类.
	 * @param sessionFactory
	 *            SessionFactory.
	 * @param instance
	 *            属性实例.
	 * @param moduleAuthorityBean
	 *            模块权限Bean.
	 * @return boolean 返回是否有权限
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 */
	private static boolean isAuthority(final SessionFactory sessionFactory,
			final ModuleAuthorityBean moduleAuthorityBean,
			final Class<BaseEntity> entityClass, final BaseEntity instance) {
		String className = EntityFactory.getShortName(entityClass.getName());
		if (moduleAuthorityBean == null
				|| moduleAuthorityBean.getClassAuthorityMap() == null) {
			return true;
		}
		Map<String, FieldAuthority> fieldMap = moduleAuthorityBean
				.getClassAuthorityMap().get(EntityFactory.getTargetAuthorityClassName(className));
		if (fieldMap == null) {
			return true;
		}
		BaseEntity tempInstance = instance;
		if (instance.getId() != null) {
			tempInstance = (BaseEntity) sessionFactory.getCurrentSession().get(
					entityClass, instance.getId());
		}
		for (Map.Entry<String, FieldAuthority> entry : fieldMap.entrySet()) {
			Method getFieldValue;
			try {
				getFieldValue = entityClass.getMethod(EntityFactory.getFieldMethod(entry
						.getKey()));
				String fieldValue = Util.getString(getFieldValue
						.invoke(tempInstance));
				if (isDisEnableAuthorityField(moduleAuthorityBean.getModuleId(),
						className, entry.getKey(), sessionFactory
								.getCurrentSession())) {
					continue;
				}
				//对品牌树级关系的处理
				if (TreeEntity.class.isAssignableFrom(entityClass)
						&& entry.getKey().equals("style")) {
					int count = fieldValue.length() / 2;
					for (int i = 1; i <= count; i++) {
						String prefix = fieldValue.substring(0, i * 2);
						if (!isContains(prefix, entry.getValue().getAuthorityDatas())) {
							return false;
						}
					}
				} else if (!isContains(fieldValue, entry.getValue().getAuthorityDatas())) {
					//临时解决方法
					if(entry.getValue().getQueryParam()!=null){
						continue;
					}else{
						return false;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				LOGGER.error(e.getMessage());
				throw new BusinessRuntimeException("错误：" + e.getMessage());
			}
		}
		return true;

	}

	/***
	 * 判断权限数据是否包含指定的ID数据.
	 *
	 * @param id
	 *            给定的ID.
	 * @param authorityIds
	 *            权限数据列表.
	 * @return 是否包含.
	 */
	public static boolean isContains(final String id, final String authorityIds) {
		String tempId = id;
		if(CommonUtil.isZeroLengthTrimString(id)){
			return true;
		}
		if (authorityIds.startsWith("'")) {
			tempId = "'" + tempId + "'";
		}
		if (authorityIds.startsWith(tempId + ",")
				|| authorityIds.indexOf("," + tempId) > 0
				|| authorityIds.endsWith("," + tempId)
				|| tempId.equals(authorityIds)) {
			return true;
		}
		return false;
	}

	/***
	 * 获取权限数据组成的SQL.
	 *
	 * @param entityAuthorityMap
	 *            Class权限Map.
	 * @param entityClass
	 *            给定的Class.
	 * @param aliasName
	 *            当前的SQL别名.
	 * @return String
	 */
	@SuppressWarnings("unchecked")
	public static String getAuthorityIdsSQL(
			final Map<String, Map<String, FieldAuthority>> entityAuthorityMap,
			final Class entityClass, final String aliasName) {
		if (entityClass == null) {
			return null;
		}
		String className = EntityFactory.getShortName(entityClass.getName());
		if (entityAuthorityMap.get(className) == null) {
			return null;
		}
		Map<String, FieldAuthority> fieldMap = entityAuthorityMap.get(EntityFactory.getTargetAuthorityClassName(className));
		if (fieldMap == null) {
			return null;
		}
		StringBuffer authorityIds = new StringBuffer("");
		for (Map.Entry<String, FieldAuthority> entry : fieldMap.entrySet()) {
			if (authorityIds.length() > 0) {
				authorityIds.append(" and ");
			}
			if (TreeEntity.class.isAssignableFrom(entityClass)
					&& entry.getKey().equals("style")) {
				String[] styles = entry.getValue().getAuthorityDatas().replaceAll("'", "").split(
						",");
				for (int i = 0; i < styles.length; i++) {
					if (i > 0) {
						authorityIds.append(" or ");
					} else {
						authorityIds.append("(");
					}
					authorityIds.append(aliasName).append(".").append(
							entry.getKey()).append(" like '").append(
							getLevelStyle(styles[i])).append("%'");
					if (i + 1 == styles.length) {
						authorityIds.append(")");
					}
				}
			} else {
				if(entry.getValue().getQueryParam()!=null){
					authorityIds.append(entry.getValue().getFieldAuthoritySql(aliasName));
				}else{
					authorityIds.append(entry.getValue().getAuthorityDatas(aliasName));
				}
			}
		}
		return authorityIds.toString();
	}

	/***
	 * 获取权限数据.
	 *
	 * @param entityAuthorityMap
	 *            Class权限Map.
	 * @param entityClass
	 *            给定的Class.
	 * @param fieldName
	 *            给定的字段名.
	 * @return String
	 */
	@SuppressWarnings("unchecked")
	public static String getAuthorityIds(
			final Map<String, Map<String, FieldAuthority>> entityAuthorityMap,
			final Class entityClass, final String fieldName) {
		if (entityAuthorityMap == null) {
			return null;
		}
		String className = EntityFactory.getShortName(entityClass.getName());
		if (entityAuthorityMap.get(className) == null) {
			return null;
		}
		Map<String, FieldAuthority> fieldMap = entityAuthorityMap.get(EntityFactory.getTargetAuthorityClassName(className));
		if (fieldMap == null) {
			return null;
		}

		for (Map.Entry<String, FieldAuthority> entry : fieldMap.entrySet()) {
			if (entry.getKey().equals(fieldName)) {
				return entry.getValue().getAuthorityDatas();
			}
		}
		return null;
	}

	/**
	 * 获取当前的树节点样式.
	 *
	 * @param style
	 *            节点样式.
	 * @return 返回样式节点.
	 */
	private static String getLevelStyle(final String style) {
		if (ThreadLocalClient.get().envParamMap.get(STYLE_LEVEL) == null) {
			return style;
		}
		int level = (Integer) ThreadLocalClient.get().envParamMap
				.get(STYLE_LEVEL) * 2;
		if (style.length() <= level) {
			return style;
		}
		return style.substring(0, level);
	}



	/***
	 * 判断一个实体是否有完整的数据权限.
	 *
	 * @param instanceValue
	 *            实体值
	 * @param sessionFactory
	 *            Hibernate SessionFactory
	 */
	@SuppressWarnings("unchecked")
	public static void checkAuthority(final Object instanceValue,
			final SessionFactory sessionFactory, boolean ischange) {
		if(ThreadLocalClient.get().envParamMap.get(DataAuthority.IS_APPLY_AUTHORITY)!=null&&
				ThreadLocalClient.get().envParamMap.get(DataAuthority.IS_APPLY_AUTHORITY).equals(false)){
			return ;
		}
		ModuleAuthorityBean moduleAuthorityBean = getModuleAuthorityBean();
		if (moduleAuthorityBean == null
				|| moduleAuthorityBean.getClassAuthorityMap() == null) {
			return;
		}
		String className = sessionFactory.getCurrentSession().getEntityName(
				instanceValue);
		className = EntityFactory.getShortName(className);
		Class instanceClass = EntityFactory.getEntityClass(sessionFactory, className);

		if (instanceValue instanceof BaseEntity &&
				!isAuthority(sessionFactory, moduleAuthorityBean, instanceClass,
				(BaseEntity) instanceValue)) {
			throw new BusinessRuntimeException("错误：没有数据操作权限！");
		}

		List<Method> methodList = EntityFactory.getEntityMethodList(sessionFactory, className);
		if (methodList == null || methodList.size() == 0) {
			return;
		}
		for (int i = 0; i < methodList.size(); i++) {
			Class propertyClass = methodList.get(i).getReturnType();
			String fieldName = methodList.get(i).getName().substring(3,4).toLowerCase()+methodList.get(i).getName().substring(4);
			BaseEntity propertyEntity = null;
			if (isDisEnableAuthorityField(moduleAuthorityBean.getModuleId(),
					className, fieldName, sessionFactory
							.getCurrentSession())) {
				continue;
			}
			try {

				propertyEntity = (BaseEntity) methodList.get(i).invoke(
						instanceValue);
				// 如果权限数据为空，设置该数据为默认值.
				/*
				 * if (propertyEntity == null &&
				 * isAuthorityClass(propertyClassName)) { propertyEntity =
				 * (BaseEntity) propertyClass.newInstance();
				 * propertyEntity.setId(Long.valueOf(1)); String getMethodName =
				 * methodList.get(i).getName(); String setMethodName = "set" +
				 * getMethodName.substring(3); Method setMethod =
				 * instanceClass.getMethod(setMethodName, new Class[] {
				 * propertyClass }); setMethod.invoke(instanceValue,
				 * propertyEntity); }
				 */
			} catch (Exception e) {
				e.printStackTrace();
				LOGGER.error(e.getMessage());
				throw new BusinessRuntimeException("错误：" + e.getMessage());
			}

			if (propertyEntity == null || // propertyEntity.getId().longValue()
					// == 1 ||
					isAuthority(sessionFactory, moduleAuthorityBean,
							propertyClass, propertyEntity)) {
				continue;
			} else {
				throw new BusinessRuntimeException("错误：没有数据操作权限！");
			}
		}
		/*
		if(ischange&&isAuthorityClass(className)&&ThreadLocalClient.get().envParamMap.get(FRESH_USER_DATA_AUTHORITY)==null&&
				!className.equals("WarehouseInventoryTotal")&&
				!className.equals("BusinessOrders")){
			BaseUser extendUser = (BaseUser)ThreadLocalClient.get().getOperator();
			DataAuthorityService dataAuthorityService =(DataAuthorityService)SpringContext.getBean("dataAuthorityService");
			extendUser.setBaseUserAuthorityData(dataAuthorityService.getUserDataAuthority(extendUser.getId()));
			ThreadLocalClient.get().envParamMap.put(FRESH_USER_DATA_AUTHORITY,true);
		}
		*/
	}



	/***
	 * 判断一个实体是否有完整的数据权限.
	 *
	 * @param instanceValue
	 *            实体值
	 * @param sessionFactory
	 *            Hibernate SessionFactory
	 */
	public static void checkDelete(final Object instanceValue,
			final SessionFactory sessionFactory) {
		/*
		 * BaseEntity propertyEntity = (BaseEntity) instanceValue; if
		 * (propertyEntity.getId().longValue() > 1) { return; } String className
		 * = sessionFactory.getCurrentSession().getEntityName( instanceValue);
		 * className = getShortName(className); if (isAuthorityClass(className))
		 * { throw new BusinessRuntimeException("错误：该数据为默认基础数据，不能删除！"); }
		 */
	}

	/**
	 * 获取实体别名权限.
	 * @param entityClass 当前实体Class.
	 * @param aliasName
	 *            实体别名
	 * @param fieldList
	 *            权限属性列表
	 * @param sessionFactory
	 *            Hibernate SessionFactory
	 * @return 返回实体权限HSQL
	 */
	@SuppressWarnings("unchecked")
	private static String getEntityAuthorityHsql(final Class entityClass,
			final String aliasName, final List<Field> fieldList,
			final SessionFactory sessionFactory) {
		StringBuffer hsql = new StringBuffer("");
		if (ThreadLocalClient.get() == null ||ThreadLocalClient.get().getOperator() == null) {
			return "";
		}
		ModuleAuthorityBean moduleAuthorityBean = getModuleAuthorityBean();
		if (moduleAuthorityBean == null
				|| moduleAuthorityBean.getClassAuthorityMap() == null) {
			return "";
		}
		String classAuthorityIds = getAuthorityIdsSQL(moduleAuthorityBean
				.getClassAuthorityMap(), entityClass, aliasName);
		if (classAuthorityIds != null) {
			hsql.append(classAuthorityIds);
		}
		String entityName = EntityFactory.getShortName(entityClass.getName());
		for (int i = 0; fieldList != null && i < fieldList.size(); i++) {
			Class propertyClass = fieldList.get(i).getType();
			try {
				String propertyName = fieldList.get(i).getName();
				if (isDisEnableAuthorityField(
						moduleAuthorityBean.getModuleId(), entityName,
						propertyName, sessionFactory.getCurrentSession())) {
					continue;
				}
				String propertyAuthority = getAuthorityIdsSQL(
						moduleAuthorityBean.getClassAuthorityMap(),
						propertyClass, aliasName + "." + propertyName);
				if (propertyAuthority != null) {
					if (hsql.length() > 0) {
						hsql.append(" and ");
					}
					hsql.append(propertyAuthority);
				}

			} catch (Exception e) {
				e.printStackTrace();
				LOGGER.error(e.getMessage());
				throw new BusinessRuntimeException("错误：" + e.getMessage());
			}

		}
		return hsql.toString();
	}

	/**
	 * 根据输入的SQL语句，解析该语句。 最后设置相应的数据过滤权限.
	 *
	 * @param hsql
	 *            输入HSQL
	 * @param sessionFactory
	 *            当前的SessionFactory
	 * @return 包含权限过滤的HSQL
	 */
	public static String getAuthorityString(final String hsql,
			final SessionFactory sessionFactory) {

		if(ThreadLocalClient.get().envParamMap.get(DataAuthority.IS_APPLY_AUTHORITY)!=null&&
				ThreadLocalClient.get().envParamMap.get(DataAuthority.IS_APPLY_AUTHORITY).equals(false)){
			return hsql;
		}
		if (ThreadLocalClient.get() == null || ThreadLocalClient.get().getOperator()==null) {
			return hsql;
		}
		String myHsql = " " + hsql;
		String tempSql = " " + hsql.toLowerCase();
		int i = 0;
		while (i < tempSql.length()) {
			int beginPosition = tempSql.indexOf(FROM_KEY, i);
			if (beginPosition < 0) {
				break;
			}
			beginPosition += FROM_KEY.length();
			int endPosition = tempSql.indexOf(WHERE_KEY, i);
			if (endPosition < 0) {
				endPosition = tempSql.length();
			}
			i = endPosition;
			String entityNames = myHsql.substring(beginPosition, endPosition)
					.trim();
			String[] entityNameArray = entityNames.split(",");
			StringBuffer authoritySql = new StringBuffer();
			for (int k = 0; k < entityNameArray.length; k++) {
				String[] entityHSql = entityNameArray[k].trim().split(" ");
				String className = entityHSql[0];
				//jake 2012-8-18
				String classAlias="";
				if(entityHSql.length==1){
					classAlias = entityHSql[0];
				}else{
					classAlias = entityHSql[1];
				}
				if (classAlias.equals(className)) {
					classAlias = "t_" + i + "_" + k;
					myHsql = myHsql.substring(0, myHsql.indexOf(className))
							+ className
							+ " "
							+ classAlias
							+ myHsql.substring(myHsql.indexOf(className)
									+ className.length());
					tempSql = myHsql.toLowerCase();
				}
				List<Field> fieldList = EntityFactory.getEntityFieldList(sessionFactory,
						className);
				/*
				 * if (fieldList == null || fieldList.size() == 0) { break; }
				 */
				Class<BaseEntity> entityClass = EntityFactory.getEntityClass(sessionFactory, className);
				String entityAuthoritySql = getEntityAuthorityHsql(entityClass,
						classAlias, fieldList, sessionFactory);
				if (entityAuthoritySql.length() > 0) {
					if (authoritySql.length() > 0) {
						authoritySql.append(AND_KEY);
					}
					authoritySql.append(entityAuthoritySql);
				}
			}
			if (authoritySql.length() > 0) {
				if (endPosition < tempSql.length()) {
					int startPosition = myHsql.indexOf(WHERE_KEY, i);
					myHsql = myHsql.substring(0, startPosition
							+ WHERE_KEY.length())
							+ authoritySql
							+ AND_KEY
							+ myHsql.substring(startPosition
									+ WHERE_KEY.length());
				} else {
					myHsql = myHsql + WHERE_KEY + authoritySql;
				}
				tempSql = myHsql.toLowerCase();
			}
			i += authoritySql.length() + 1;

		}
		return myHsql;
	}
	/**
	 * 判断是否是权限数据class.
	 * @param className 当前Class名.
	 * @return 是或否.
	 */
	public static boolean isAuthorityClass(final String className) {
		return EntityFactory.getAuthorityClassMap().get(className)!=null;

	}


	/***
	 * 判断是否字段应用权限.
	 * @param moduleId 模块ID.
	 * @param targetClassName 字段所在的Class.
	 * @param fieldName 字段名.
	 * @param session hibernate Session.
	 * @return 否或者是.
	 */
	public static boolean isDisEnableAuthorityField(final String moduleId,
			final String targetClassName, final String fieldName, final Session session) {

		EfwApplyScope efwApplyScopeMap = EntityFactory.getEfwApplyScopeMap(session).get(moduleId
				+ "_" + EntityFactory.getTargetAuthorityClassName(targetClassName) + "_" + fieldName);
		if (efwApplyScopeMap == null) {
			return false;
		}
		return efwApplyScopeMap.getIsEnabled() != null
				&& efwApplyScopeMap.getIsEnabled().intValue() == 0;
	}

}
