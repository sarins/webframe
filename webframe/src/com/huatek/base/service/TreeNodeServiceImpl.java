package com.huatek.base.service;

import java.util.List;

import com.huatek.base.tree.TreeEntity;

public class TreeNodeServiceImpl extends BaseServiceImpl implements
		TreeNodeService {
	public void updateTreeStyle(List<? extends TreeEntity> nodeList,Class<? extends TreeEntity> className) {
		if (nodeList == null || nodeList.size() == 0) {
			return;
		}
		/*String HSQL = "update "+ className.getName()
				+ " t set t.style=:style, t.parent.id=:parentId, "
				+ " t.level=:level  where t.id=:id";*/
		//Query query = super.hibernateTemplate.getSessionFactory().getCurrentSession().createQuery(HSQL);
		for (int i = 0; i < nodeList.size(); i++) {

			TreeEntity treeNode = (TreeEntity) nodeList.get(i);
			TreeEntity treeNodeOld = (TreeEntity)super.hibernateTemplate.load(className, treeNode.getId());
			treeNodeOld.setStyle(treeNode.getStyle());

			//query.setParameter("style", treeNode.getStyle());
			Long parentId = null;
			if (treeNode.getParent() != null
					&& treeNode.getParent().getId() != null
					&& treeNode.getParent().getId().longValue() > 0) {
				parentId = treeNode.getParent().getId();
				treeNodeOld.setParent((TreeEntity)super.hibernateTemplate.load(className, parentId));
			}
			treeNodeOld.setLevel(treeNode.getLevel());
			/*query.setParameter("parentId", parentId);
			query.setInteger("level", treeNode.getLevel());
			query.setParameter("id", treeNode.getId());
			query.executeUpdate();*/
			super.hibernateTemplate.update(treeNodeOld);

		}
	}

}
