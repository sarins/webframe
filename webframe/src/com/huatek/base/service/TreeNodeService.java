package com.huatek.base.service;

import java.util.List;

import com.huatek.base.tree.TreeEntity;

public interface TreeNodeService extends BaseService {
	public void updateTreeStyle(List<? extends TreeEntity> nodeList,Class<?extends TreeEntity> className);
}
