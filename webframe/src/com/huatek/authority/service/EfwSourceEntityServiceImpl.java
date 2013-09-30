package com.huatek.authority.service;

import java.util.List;

import com.huatek.authority.entity.EfwSourceEntity;
import com.huatek.base.service.BaseServiceImpl;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;

public class EfwSourceEntityServiceImpl extends BaseServiceImpl implements
		EfwSourceEntityService {

	public CutPageBean getEfwSourseEntityPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList) {
		String totalRowsHsql = " select count(t) from EfwSourceEntity t ";
		String resultSql = "from EfwSourceEntity t ";
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.id desc ", pageBean, paramterList);
	}

	public EfwSourceEntity getEfwSourceEntity(Long id) {
		return (EfwSourceEntity) super.getObjectById(EfwSourceEntity.class, id);
	}

	public synchronized boolean saveOrUpdateEfwSourceEntity(
			final EfwSourceEntity efwSourceEntity) {
		/*
		 * // 如果名称重复 if (isDuplicate("from EfwSourceEntity t where t.name=?",
		 * new Object[] { efwSourceEntity.getEntityName() },
		 * efwSourceEntity.getId())) { return false; }
		 */
		if (efwSourceEntity.isNew()) {
			save(efwSourceEntity);
		} else {
			merge(efwSourceEntity);
		}
		return true;
	}

	@SuppressWarnings("unchecked")
	public List<EfwSourceEntity> findDatasByIds(Long[] ids) {
		String param = CommonUtil.getIdSQLParam(ids);
		if (param != null) {
			return (List<EfwSourceEntity>) hibernateTemplate
					.find("from EfwSourceEntity" + " t where t.id in (" + param
							+ ")", ids);
		}
		return null;
	}

	@Override
	public List<EfwSourceEntity> getAllBusinessData() {
		// TODO Auto-generated method stub
		return (List<EfwSourceEntity>) hibernateTemplate
				.find("from EfwSourceEntity t order by t.entityName asc");
	}

}
