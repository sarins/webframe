package com.huatek.framework.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.framework.entity.FwSource;
import com.huatek.framework.entity.FwSrcAction;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.Constant;

public class OperationServiceImpl extends BaseServiceImpl implements
		OperationService {
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		super.hibernateTemplate = hibernateTemplate;
	}
	public synchronized boolean saveSourceAction(FwSrcAction action){
		if (!isDuplicate(
				"from FwSrcAction t where t.name=? and t.fwSource.id=?",
				new Object[] { action.getName(),action.getFwSource().getId() }, action.getId())) {
			if (action.getId() == null) {
				save(action);
			} else {
				merge(action);
			}
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public List<FwSrcAction> getAllAction() {
		return hibernateTemplate.find("from FwSrcAction t ");
	}

	public CutPageBean getOperationPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList,Long sourceId) {
		String queryCondition = " 1=1 ";
		String totalRowsHsql = " select count(t) from FwSrcAction t where t.fwSource.id=? and "+queryCondition;
		String resultSql = "from FwSrcAction t where t.fwSource.id=? and "+queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql, resultSql,"order by t.actionOrder asc",new Object[]{sourceId}, pageBean,paramterList);
	}

	
	/**
	 * 取得所有菜单信息.
	 *
	 * @return 菜单信息
	 */

	@Override
	public List<FwSource> getAllSource() {
	
		// 菜单
		List<FwSource> fwSourceList = null;
		// 取得所有菜单信息
		fwSourceList =hibernateTemplate.find("from FwSource t where t.status='Constant.STATUS_ACTIVE'");
		return fwSourceList;
	
	}

}
