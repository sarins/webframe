package com.huatek.framework.service;

import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.framework.entity.FwSource;
import com.huatek.framework.entity.FwSrcAction;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;


public interface OperationService extends BaseService {
	public boolean saveSourceAction(FwSrcAction action);
	public List<FwSrcAction> getAllAction();
	public CutPageBean getOperationPageBean(CutPageBean pageBean,List<CommonBean> paramterList,Long sourceId);
	public List<FwSource> getAllSource();
	
}
