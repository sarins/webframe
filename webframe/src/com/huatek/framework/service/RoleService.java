package com.huatek.framework.service;

import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.framework.entity.FwDuty;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

public interface RoleService extends BaseService {
	public void saveRole(FwDuty duty);
	public void assignOperation(Long roleId,Long[] operationIds);
	public List<FwDuty> getAvailableRoles();
	public FwDuty getRoleById(Long roleId);
	public CutPageBean getRolePageBean(CutPageBean pageBean,List<CommonBean> paramterList);
}
