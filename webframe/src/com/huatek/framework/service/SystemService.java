package com.huatek.framework.service;

import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.framework.entity.FwSystem;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

public interface SystemService extends BaseService {
	public void saveFwSystem(FwSystem fwSystem);
	public List<FwSystem> getAvailableFwSystem();
	public FwSystem getFwSystemById(Long systemId);
	public FwSystem getFwSystemBySysCode(String systemCode);
	public CutPageBean getRolePageBean(CutPageBean pageBean,List<CommonBean> paramterList);
}
