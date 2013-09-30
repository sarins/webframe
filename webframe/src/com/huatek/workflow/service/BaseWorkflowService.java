package com.huatek.workflow.service;

import java.sql.SQLException;

import com.huatek.workflow.entity.NodeEntity;


/***
 * 基本的流程服务接口.
 *
 * @author winner_pan
 *
 */
public interface BaseWorkflowService<V> {

	/***
	 * 提交到下一步.
	 * @param currentNode 当前的节点.
	 * @param flowInstance 业务流实体.
	 * @throws SQLException
	 */
	void transfer(final NodeEntity currentNode, final V flowInstance) throws SQLException;


}
