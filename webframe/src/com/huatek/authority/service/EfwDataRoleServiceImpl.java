package com.huatek.authority.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.huatek.authority.entity.EfwBusinessModule;
import com.huatek.authority.entity.EfwBusinessModuleMap;
import com.huatek.authority.entity.EfwDataRole;
import com.huatek.authority.entity.EfwDataRoleAuthority;
import com.huatek.authority.entity.EfwSourceEntity;
import com.huatek.authority.entity.EfwUserDataAuthority;
import com.huatek.authority.factory.EntityFactory;
import com.huatek.base.service.BaseServiceImpl;
import com.huatek.base.tree.TreeConfig;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.Util;

/**
 *本类完成数据角色的管理.
 *
 * @author winner pan
 *
 */
public class EfwDataRoleServiceImpl extends BaseServiceImpl implements
		EfwDataRoleService {
	/**
	 * 日志常量.
	 * **/
	private static final Logger LOGGER = Logger
			.getLogger(EfwDataRoleServiceImpl.class);

	/**
	 * 根据参数查询分页数据.
	 *
	 * @param pageBean
	 *            分页对象
	 * @param paramterList
	 *            参数列表
	 * @return 分页结果对象
	 */
	public CutPageBean getPageBean(final CutPageBean pageBean,
			final List<CommonBean> paramterList, String dataName) {
		String queryCondition = " 1=1 ";
		if (dataName != null && dataName.trim().length() > 0) {
			queryCondition += " and t.id in (select e.efwDataRole.id from EfwDataRoleAuthority e where e.efwBusinessModule.name like '%"
					+ dataName
					+ "%' or e.efwBusinessModule.description like '%"
					+ dataName + "%')";
		}

		String totalRowsHsql = " select count(distinct t) from EfwDataRole t where"
				+ queryCondition;
		String resultSql = "select distinct t from EfwDataRole t where "
				+ queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.id desc", pageBean, paramterList);
	}

	/**
	 * 保存数据角色.
	 *
	 * @param efwDataRole
	 *            数据角色
	 * @return 返回保存是否成功
	 */
	public synchronized boolean saveOrUpdateEfwDataRole(
			final EfwDataRole efwDataRole) {
		// 如果名称重复
		if (isDuplicate("from EfwDataRole t where t.daName=?",
				new Object[] { efwDataRole.getDaName() }, efwDataRole.getId())) {
			return false;
		}
		if (efwDataRole.isNew()) {
			save(efwDataRole);
		} else {
			merge(efwDataRole);
		}
		return true;
	}

	/**
	 * @param ids
	 *            承运商Id
	 * @param statuss
	 *            状态
	 *
	 */
	public void conditionAll(final Long[] ids, final String statuss) {
		super.hibernateTemplate.bulkUpdate(
				"update EfwDataRole t set t.status=? where t.id in("
						+ Util.getStringFromArray(ids) + ")", statuss);
	}

	/***
	 * 保存选择的业务数据.
	 */
	public void assignModuleData(final Long dataRoleId, final String dataId,
			final Long moduleId, final Long entityId, final String fieldValue,
			boolean isAdd) {
		if (isAdd) {
			EfwDataRoleAuthority efwDataRoleAuthority = new EfwDataRoleAuthority();
			efwDataRoleAuthority.setEfwBusinessModule(new EfwBusinessModule(
					moduleId));
			efwDataRoleAuthority.setDataId(dataId);
			EfwSourceEntity efwSourceEntity = new EfwSourceEntity();
			efwSourceEntity.setId(entityId);
			efwDataRoleAuthority.setEfwSourceEntity(efwSourceEntity);
			efwDataRoleAuthority.setFieldValue(fieldValue);
			EfwDataRole efwDataRole = new EfwDataRole();
			efwDataRole.setId(dataRoleId);
			efwDataRoleAuthority.setEfwDataRole(efwDataRole);
			this.save(efwDataRoleAuthority);
		} else {
			super.hibernateTemplate
					.bulkUpdate(
							"delete from EfwDataRoleAuthority t "
									+ "where t.efwDataRole.id=? and t.efwBusinessModule.id=? and t.efwSourceEntity.id=? and t.dataId=?",
							new Object[] { dataRoleId, moduleId, entityId,
									dataId });
		}

	}

	@SuppressWarnings("unchecked")
	public List<EfwBusinessModule> getAllEfwBusinessModule() {
		return hibernateTemplate
				.find("from EfwBusinessModule t where t.status='A' order by t.id asc");
	}

	public CutPageBean getModulePageBean(final CutPageBean pageBean,
			final List<CommonBean> paramterList,
			final EfwSourceEntity sourceEntity, boolean queryChecked,
			final String[] parameter) {

		String condition = " where 1=1";

		if (queryChecked) {
			condition += " and exists (select 1 from EfwDataRoleAuthority a where a.efwSourceEntity.id='"
					+ parameter[0]
					+ "' and a.efwBusinessModule.id="
					+ parameter[1]
					+ " and a.efwDataRole.id="
					+ parameter[2]
					+ " and a.dataId=t.id)";
		}
		if(sourceEntity.getQueryParam()!=null){
			condition += " and "+sourceEntity.getQueryParam().replaceAll("_prefix", "t");
		}
		String selectDataSql = "select new FwDictionary(t.id"+",t."
				+ sourceEntity.getOutputValue()+"||'',t."
				+ sourceEntity.getOutputKey() + ")";
		String orderBy = "order by t.id desc";
		if (sourceEntity.getOutputValue().equalsIgnoreCase("style")) {
			orderBy = "order by t.style asc";
			selectDataSql = "select new FwDictionary(t.id,"
					+ TreeConfig.getInstance().getSubStringMethod() + "(t."
					+ sourceEntity.getOutputValue() + ",0,t.level*2),"
					+ sourceEntity.getOutputKey() + ")";
		}
		String totalRowsHsql = " select count(t) from "
				+ sourceEntity.getOutputClass() + " t " + condition;
		String resultSql = selectDataSql + " from "
				+ sourceEntity.getOutputClass() + " t " + condition;
		CutPageBean queryPageBean = QueryPageBean.getQueryPageBean(
				hibernateTemplate, totalRowsHsql, resultSql, orderBy, pageBean,
				paramterList);
		return queryPageBean;
	}

	@SuppressWarnings("unchecked")
	public List<EfwDataRoleAuthority> getEfwDataRoleAuthorityList(
			final Long dataRoleId, final Long moduleId, final Long entityId) {
		return hibernateTemplate
				.find(
						"from EfwDataRoleAuthority t "
								+ "where t.efwDataRole.id=? and t.efwBusinessModule.id=? and t.efwSourceEntity.id=?",
						new Object[] { dataRoleId, moduleId, entityId });
	}

	/**
	 * 用户分配权限的保存.
	 *
	 * @param acctId
	 *            用户对象的ID
	 * @param dataIds
	 *            权限对象的ID
	 */
	@SuppressWarnings("unchecked")
	public void doAssignDataRole(final Long acctId, final Long[] dataIds) {
		FwAccount baseUser = (FwAccount) this.hibernateTemplate.get(
				FwAccount.class, acctId);
		// 删除该用户已分配的数据权限组
		List<EfwUserDataAuthority> baseUserDaList = this.hibernateTemplate
				.find("from EfwUserDataAuthority t where t.fwAccount.id=? ",
						acctId);
		this.hibernateTemplate.deleteAll(baseUserDaList);
		// 重新绑定用户和数据权限组
		for (int i = 0; i < dataIds.length; i++) {
			if (dataIds[i] == null) {
				continue;
			}
			EfwDataRole dataAuthority = (EfwDataRole) super
					.getHibernateTemplate().get(EfwDataRole.class, dataIds[i]);
			EfwUserDataAuthority userData = new EfwUserDataAuthority();
			userData.setEfwDataRole(dataAuthority);
			userData.setFwAccount(baseUser);
			this.hibernateTemplate.save(userData);
		}
	}

	/**
	 * 根据id获取用户.
	 *
	 * @param acctId
	 *            用户Id
	 */
	@SuppressWarnings("unchecked")
	public List<EfwUserDataAuthority> getUserDaByUserId(final Long acctId) {
		return this.hibernateTemplate.find(
				"from EfwUserDataAuthority t where t.fwAccount.id=? ", acctId);
	}

	/**
	 * 获取数据权限列表.
	 *
	 * @return 返回权限列表
	 */
	@SuppressWarnings("unchecked")
	public List<EfwDataRole> getAvailableDataRole(String daName) {
		if (CommonUtil.isNotZeroLengthTrimString(daName)) {
			return hibernateTemplate
					.find("from EfwDataRole t where t.status='A'and t.daName like '%"
							+ daName + "%' order by t.id desc");
		} else {
			return hibernateTemplate
					.find("from EfwDataRole t where t.status='A' order by t.id desc");
		}
	}

	/***
	 * 获取模块下的实体配置.
	 *
	 * @param moduleId
	 *            模块ID.
	 * @param entityId
	 *            实体ID.
	 * @return 模块实体配置.
	 */
	@SuppressWarnings("unchecked")
	public EfwBusinessModuleMap getEfwBusinessModuleMap(Long moduleId,
			Long entityId) {
		List<EfwBusinessModuleMap> efwBusinessModuleMapList = hibernateTemplate
				.find(
						"from EfwBusinessModuleMap t where t.efwSourceEntity.id=? and t.baseBusinessModule.id=?",
						new Object[] { entityId, moduleId });
		if (efwBusinessModuleMapList.size() > 0) {
			return efwBusinessModuleMapList.get(0);
		}
		return null;
	}

	public List<EfwBusinessModule> getUefwDataRoleService() {
		List<EfwBusinessModule> efwBusinessModuleList = hibernateTemplate
				.find("from EfwBusinessModule t order by t.id asc");
		return efwBusinessModuleList;
	}

	public void assignDataRole(Long acctId, Long dataId, boolean checked) {
		if (checked) {
			FwAccount fwAccount = (FwAccount) this.hibernateTemplate.get(
					FwAccount.class, acctId);
			EfwUserDataAuthority baseUserDa = new EfwUserDataAuthority();
			baseUserDa.setFwAccount(fwAccount);
			EfwDataRole efwDataRole = (EfwDataRole) super
					.getHibernateTemplate().get(EfwDataRole.class, dataId);
			baseUserDa.setEfwDataRole(efwDataRole);
			this.save(baseUserDa);
		} else {
			super.hibernateTemplate.bulkUpdate("delete from BaseUserDa t "
					+ "where t.efwDataRole.id=? and t.vbaseUser.id=?",
					new Object[] { dataId, acctId });
		}
	}

	/***
	 * 获取所有资源实体.
	 *
	 * @return Map<String, Class>.
	 */
	public Map<String, Class> getAuthorityClassMap() {
		List<EfwSourceEntity> efwSourceEntityList = this.hibernateTemplate
				.find("from EfwSourceEntity");
		Map<String, Class> authorityClassMap = new HashMap<String, Class>();
		for (EfwSourceEntity efwSourceEntity : efwSourceEntityList) {
			// 查找hibernate entity Class
			Class entityClass = EntityFactory.getEntityClass(super
					.getSessionFactory(), efwSourceEntity.getEntityClass());
			if (entityClass == null) {
				LOGGER.error("数据权限中的实体资源名称:" + efwSourceEntity.getEntityClass()
						+ " 找不到对应的hibernate实体类。");
				continue;
			}
			authorityClassMap
					.put(efwSourceEntity.getEntityClass(), entityClass);
			if (efwSourceEntity.getEntityAlias() != null) {
				String[] entityAlias = efwSourceEntity.getEntityAlias().split(
						";");
				for (String alias : entityAlias) {
					authorityClassMap.put(alias, entityClass);
				}
			}
		}
		return authorityClassMap;
	}

}
