package com.huatek.framework.service;

import java.util.List;
import com.huatek.base.service.TreeNodeService;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

public interface GroupService extends TreeNodeService {
	public boolean saveGroup(FwGroup group);
	public FwGroup getGroupById(Long groupId);
	public CutPageBean getGroupPageBean(CutPageBean pageBean,List<CommonBean> paramterList);
	public List<FwGroup> getGroupParents(Long sourceId);
	public List<FwGroup> getFilterGroupList();
}
