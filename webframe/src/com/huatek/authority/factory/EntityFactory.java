package com.huatek.authority.factory;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.persister.entity.AbstractEntityPersister;

import com.huatek.authority.entity.EfwApplyScope;
import com.huatek.authority.service.EfwDataRoleService;
import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.util.SpringContext;

public final class EntityFactory {
	/**
	 * 日志常量.
	 * **/
	private static final Logger LOGGER = Logger.getLogger(EntityFactory.class);

	/***
	 * 实体映射表.
	 */
	private static Map<String, Object[]> entityMap = new HashMap<String, Object[]>();

	/***
	 * 获取实体的权限属性列表.
	 *
	 * @param sessionFactory
	 *            当前的Hibernate SessionFactory
	 * @param className
	 *            实体名称
	 * @return 返回权限属性列表
	 */
	@SuppressWarnings("unchecked")
	public static List<Field> getEntityFieldList(
			final SessionFactory sessionFactory, final String className) {

		Object[] objs = getEntityMap(className, sessionFactory);

		if (objs == null) {
			return null;
		} else {
			return (List<Field>) objs[0];
		}
	}

	/***
	 * 获取实体权限方法列表 .
	 *
	 * @param sessionFactory
	 *            当前hibernate SessionFactory
	 * @param className
	 *            当前实体名称.
	 * @return 权限方法列表
	 */
	@SuppressWarnings("unchecked")
	public static List<Method> getEntityMethodList(
			final SessionFactory sessionFactory, final String className) {
		Object[] objs = getEntityMap(className, sessionFactory);

		if (objs == null) {
			return null;
		} else {
			return (List<Method>) objs[1];
		}
	}

	/***
	 * 获取实体Class.
	 *
	 * @param sessionFactory
	 *            当前Hibernate SessionFactory
	 * @param className
	 *            当前实体名称.
	 * @return 权限方法列表
	 */
	@SuppressWarnings("unchecked")
	public static Class<BaseEntity> getEntityClass(final SessionFactory sessionFactory,
			final String className) {

		Object[] objs = getEntityMap(className, sessionFactory);
		if (objs == null) {
			return null;
		} else {
			return (Class) objs[2];
		}
	}

	/****
	 * 初始化实体映射的权限列表.
	 * @param className 给定的Class名.
	 * @param sessionFactory
	 *            当前Hibernate SessionFactory
	 * @return 返回class的映射数据.
	 */
	private static Object[] getEntityMap(final String className,
			final SessionFactory sessionFactory) {
		String myClassName = className;
		if (className.indexOf(".") > 0) {
			myClassName = className.substring(className.lastIndexOf(".") + 1);
		}
		if (entityMap.get(myClassName) != null) {
			return entityMap.get(myClassName);
		}
		initEntityMap(myClassName, sessionFactory);
		return entityMap.get(myClassName);
	}
	/***
	 * 初始化实体MAP.
	 * @param queryClassName 查询的class名.
	 * @param sessionFactory  SessionFactory.
	 */
	@SuppressWarnings("unchecked")
	private static synchronized void initEntityMap(final String queryClassName,
			final SessionFactory sessionFactory) {
		if (entityMap.get(queryClassName) != null) {
			return;
		}
		Map metaMap = sessionFactory.getAllClassMetadata();
		Iterator<AbstractEntityPersister> abstractEntityPersisterIt = metaMap.values().iterator();
		while(abstractEntityPersisterIt.hasNext()){
			AbstractEntityPersister classMetadata = abstractEntityPersisterIt.next();
			String className = classMetadata.getEntityMetamodel().getName();
			List<Field> authorityFieldList = new ArrayList<Field>();
			List<Method> authorityMethodList = new ArrayList<Method>();
			try {
				Class entityClass = Class
						.forName(classMetadata.getEntityName());
				Field[] fields = entityClass.getDeclaredFields();
				for (int i = 0; i < fields.length; i++) {
					Class propertyClass = fields[i].getType();
					try {
						if (BaseEntity.class.isAssignableFrom(propertyClass)
								&& classMetadata.getPropertyType(fields[i]
										.getName()) != null) {
							if (entityClass.getName().equals(
									propertyClass.getName())) {
								continue;
							}
							authorityFieldList.add(fields[i]);

							Method propertMethod = entityClass
									.getMethod(getFieldMethod(fields[i]
											.getName()));
							authorityMethodList.add(propertMethod);
						}
					} catch (Exception e) {
						LOGGER.warn(e.getMessage());
					}
				}
				entityMap.put(className
						.substring(className.lastIndexOf(".") + 1),
						new Object[] { authorityFieldList, authorityMethodList,
								entityClass });

			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				LOGGER.error(e.getMessage());
				throw new BusinessRuntimeException("错误：" + e.getMessage());
			}

		}
	}
	/***
	 * 权限实体Map.
	 * key=entityClassShorName
	 */
	private static Map<String, Class> authorityClassMap = null;

	/***
	 * 字段映射MAP.
	 */
	private static Map<String, EfwApplyScope> fieldAuthorityMap = null;
	/***
	 * 初始化字段映射MAP.
	 * @param session hibernate Session.
	 */
	@SuppressWarnings("unchecked")
	private static synchronized void initFieldAuthorityMap(final Session session) {
		if (fieldAuthorityMap != null) {
			return;
		}
		fieldAuthorityMap = new HashMap<String, EfwApplyScope>();
		Query query = session.createQuery("from EfwApplyScope");
		List<EfwApplyScope> efwApplyScopeMapList = query.list();
		for (EfwApplyScope efwApplyScopeMap : efwApplyScopeMapList) {
			String[] moduleIds = efwApplyScopeMap.getEfwBusinessModuleMap().getEfwBusinessModule()
					.getMenuIds().split(",");
			for (String id : moduleIds) {
				fieldAuthorityMap
						.put(id + "_" + efwApplyScopeMap.getTargetClass()
								+ "_" + efwApplyScopeMap.getTargetField(),
								efwApplyScopeMap);
			}
		}

	}

	public static Map<String, Class> getAuthorityClassMap(){
		if(authorityClassMap==null){
			initAuthorityClassMap();
		}
		return authorityClassMap;

	}

	private static synchronized  void initAuthorityClassMap(){
		if(authorityClassMap!=null){
			return ;
		}
		EfwDataRoleService efwDataRoleService = (EfwDataRoleService)SpringContext.getBean("efwDataRoleService");
		authorityClassMap = efwDataRoleService.getAuthorityClassMap();

	}
	/***
	 * 根据当前的Class获取目标权限Class.
	 *
	 * @param className
	 *            当前Class名称.
	 * @return 返回目标权限Class.
	 */
	public static String getTargetAuthorityClassName(final String className) {
		Class entityClass = getAuthorityClassMap().get(className);
		if(entityClass==null){
			return null;
		}
		return getShortName(entityClass.getName());
	}




	/***
	 * 获取当前权限class名.
	 *
	 * @param className
	 *            当前Class名.
	 * @return 返回当前的Class.
	 */
	@SuppressWarnings("unchecked")
	public static Class<BaseEntity> getAuthorityClass(final String className) {
		return getAuthorityClassMap().get(className);
	}

	/***
	 * 获取Class的简短名,不含包名.
	 *
	 * @param className
	 *            class名含包名.
	 * @return 返回当前的权限Class名.
	 */
	public static String getShortName(final String className) {
		return className.substring(className.lastIndexOf(".") + 1);

	}

	/***
	 * 获取属性的Get方法名.
	 *
	 * @param fieldName
	 *            字段名.
	 * @return 返回方法名.
	 */
	public static String getFieldMethod(final String fieldName) {
		return "get" + fieldName.substring(0, 1).toUpperCase()
				+ fieldName.substring(1);
	}

	private EntityFactory(){

	}

	public static Map<String, EfwApplyScope> getEfwApplyScopeMap( final Session session){
		if (fieldAuthorityMap == null) {
			initFieldAuthorityMap(session);
		}
		return fieldAuthorityMap;
	}


}
