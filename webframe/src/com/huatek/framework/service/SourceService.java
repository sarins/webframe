package com.huatek.framework.service;

import java.util.List;

import com.huatek.base.service.TreeNodeService;
import com.huatek.framework.entity.FwSource;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

public interface SourceService extends TreeNodeService {
	public void saveSource(FwSource source);
	public List<FwSource> getMenuSources();
	public CutPageBean getSourcePageBean(CutPageBean pageBean,List<CommonBean> paramterList);
	public List<FwSource> getAllSourceDataAsTree();
}
