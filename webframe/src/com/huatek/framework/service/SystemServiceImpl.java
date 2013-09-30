package com.huatek.framework.service;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.framework.entity.FwSystem;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;

public class SystemServiceImpl extends BaseServiceImpl implements SystemService {

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		super.hibernateTemplate = hibernateTemplate;
	}
	public  void saveFwSystem(FwSystem fwSystem) {
		this.saveOrupdate(fwSystem);
	}


	@SuppressWarnings("unchecked")
	public List<FwSystem> getAvailableFwSystem() {
		return hibernateTemplate.find("from FwSystem t where t.status='A' order by t.id asc");
	}

	public FwSystem getFwSystemById(Long fwSystemId) {
	    FwSystem fwSystem = (FwSystem)hibernateTemplate.get(FwSystem.class, fwSystemId);
		if(fwSystem==null){
            throw new BusinessRuntimeException("error.data.deleted");
         }
		return fwSystem;
	}

	public CutPageBean getRolePageBean(CutPageBean pageBean,
			List<CommonBean> paramterList) {
		String queryCondition = " 1=1 ";
		String totalRowsHsql = " select count(t) from FwSystem t where"+queryCondition;
		String resultSql = "from FwSystem t where "+queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql, resultSql,"order by t.id asc", pageBean,paramterList);
	}
	@Override
	public FwSystem getFwSystemBySysCode(String systemCode) {
		List<FwSystem> systemList = hibernateTemplate.find("from FwSystem t where t.status='A' and t.sysCode=?", systemCode);
		if(systemList.size()==1){
			return systemList.get(0);
		}else{
			throw new BusinessRuntimeException("Not found the FwSystem sysCode "+systemCode);
		}
	}

}
