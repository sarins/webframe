package com.huatek.framework.service;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.framework.entity.FwDuty;
import com.huatek.framework.entity.FwDutyAction;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.entity.FwSrcAction;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.GlobalFilterManagement;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;

public class RoleServiceImpl extends BaseServiceImpl implements RoleService {

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		super.hibernateTemplate = hibernateTemplate;
	}
	public void saveRole(FwDuty duty) {
				this.saveOrupdate(duty);
	}
	 /**
     * 分配保存方法.
     *
     * @param roleId 角色id
     * @param operationIds 操作动作数组
     */
    public void assignOperation(final Long roleId, final Long[] operationIds) {
        FwDuty duty = (FwDuty) super.getHibernateTemplate().get(FwDuty.class, roleId);
        super.getHibernateTemplate().bulkUpdate("delete from FwDutyAction t where t.fwDuty.id=?",roleId);
        for (int i = 0; i < operationIds.length; i++) {
            if(operationIds[i]==null){
                continue;
            }
            FwDutyAction dutyAction = new FwDutyAction();
            dutyAction.setFwDuty(duty);
            FwSrcAction fwSrcAction = new FwSrcAction();
            fwSrcAction.setId(operationIds[i]);
            dutyAction.setFwSrcAction(fwSrcAction);
            this.save(dutyAction);
        }
    }


	@SuppressWarnings("unchecked")
	public List<FwDuty> getAvailableRoles() {
		return hibernateTemplate.find("from FwDuty t where t.status='A' and "+ GlobalFilterManagement.getSystemGroupFilter("t") +" order by t.id asc");
	}

	public FwDuty getRoleById(Long roleId) {
	    FwDuty fwDuty = (FwDuty)hibernateTemplate.get(FwDuty.class, roleId);
	    if(fwDuty==null){
	        throw new BusinessRuntimeException("error.data.deleted");
	     }
	    return fwDuty;
	}

	public CutPageBean getRolePageBean(CutPageBean pageBean,
			List<CommonBean> paramterList) {
		String queryCondition = GlobalFilterManagement.getSystemGroupFilter("t");
		String totalRowsHsql = " select count(t) from FwDuty t where "+queryCondition;
		String resultSql = "from FwDuty t where "+queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql, resultSql,"order by t.id asc", pageBean,paramterList);
	}

}
