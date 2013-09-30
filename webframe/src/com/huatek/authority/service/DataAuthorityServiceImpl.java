package com.huatek.authority.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.huatek.authority.entity.EfwDataRoleAuthority;
import com.huatek.authority.factory.DataAuthority;
import com.huatek.authority.factory.FieldAuthority;
import com.huatek.base.service.BaseServiceImpl;
import com.huatek.framework.util.Constant;

/****
 * 本类用于获取用户的数据权限.
 *
 * @author winner pan
 */
public class DataAuthorityServiceImpl extends BaseServiceImpl implements
		DataAuthorityService {


	/**
	 * 日志常量.
	 * **/
	private static final Logger LOGGER = Logger
			.getLogger(DataAuthorityServiceImpl.class);

	/***
	 * 获取用户的数据权限.
	 *
	 * @param userId
	 *            登录用户ID.
	 * @return Map<Class<? extends BaseEntity>,String> 类和对应的权限列表.
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Map<String,Map<String,FieldAuthority>>> getUserDataAuthority(final long userId) {
		return (Map<String, Map<String,Map<String,FieldAuthority>>>) hibernateTemplate
				.execute(new HibernateCallback() {
					public Object doInHibernate(final Session session)
							throws SQLException {
						// 获取数据权限列表
						List dataAuthoritylist = null;
						Query query = session
								.createQuery("select r from EfwUserDataAuthority t,EfwDataRoleAuthority r where r.efwDataRole.id=t.efwDataRole.id and t.fwAccount.id=? and r.efwDataRole.status=?");
						query.setLong(0, userId);
						query.setString(1, Constant.STATUS_ACTIVE);
						dataAuthoritylist = query.list();
						// 获取数据权限的ID列表
						Map<String, Map<String,Map<String,FieldAuthority>>> moduleMap = new HashMap<String, Map<String,Map<String,FieldAuthority>>>();
						for (int i = 0; i < dataAuthoritylist.size(); i++) {
							EfwDataRoleAuthority dataRoleAuthority = (EfwDataRoleAuthority) dataAuthoritylist
									.get(i);
							String menuIds = dataRoleAuthority.getEfwBusinessModule().getMenuIds();
							if(menuIds!=null){
								String[] menuIdArray = menuIds.split(",");
								for(int k=0;k<menuIdArray.length;k++){
									String menuId = menuIdArray[k];
									Map<String,Map<String,FieldAuthority>> entityAuthorityMap = null;
									if(moduleMap.get(menuId)==null){
										moduleMap.put(menuId, new HashMap<String, Map<String,FieldAuthority>>());
									}
									entityAuthorityMap = moduleMap.get(menuId);
									String entityName = dataRoleAuthority.getEfwSourceEntity().getEntityClass();
									StringBuffer fieldValues = new StringBuffer("'"+dataRoleAuthority.getFieldValue()+"'");
									String fieldName = dataRoleAuthority.getEfwSourceEntity().getEntityField();
									Map<String,FieldAuthority> fieldAuthorityMap = null;

									if(entityAuthorityMap.get(entityName)==null){
										entityAuthorityMap.put(entityName, new HashMap<String,FieldAuthority>());
									}
									fieldAuthorityMap = entityAuthorityMap.get(entityName);

									if(fieldAuthorityMap.containsKey(fieldName)){
										if(DataAuthority.isContains(fieldValues.toString(), fieldAuthorityMap.get(fieldName).getAuthorityDatas())){
											continue;
										}
										fieldValues.append(",").append(fieldAuthorityMap.get(fieldName).getAuthorityDatas());
									}else{
										FieldAuthority fieldAuthority = new FieldAuthority();
										fieldAuthority.setEntityName(entityName);
										fieldAuthority.setFieldName(fieldName);
										fieldAuthority.setNotNull(dataRoleAuthority.getEfwSourceEntity().getNotNull());
										if(dataRoleAuthority.getEfwSourceEntity().isApplyQueryParam()){
											fieldAuthority.setQueryParam(dataRoleAuthority.getEfwSourceEntity().getQueryParam());
										}
										fieldAuthorityMap.put(fieldName, fieldAuthority);
									}

									//fieldAuthorityMap.put(fieldName, fieldValues.toString());
									fieldAuthorityMap.get(fieldName).setAuthorityDatas(fieldValues.toString());

								}

							}

						}

						//unlimitCustomer(moduleMap,session);
						return moduleMap;
					}

				});

	}

}
