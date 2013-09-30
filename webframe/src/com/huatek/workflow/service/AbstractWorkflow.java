package com.huatek.workflow.service;

import java.util.HashMap;
import java.util.Map;

import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.workflow.entity.NodeEntity;
import com.huatek.workflow.entity.WorkFlowInstance;

/***
 * 初始化流程节点.
 *
 * @author winner_pan
 *
 */
public abstract class AbstractWorkflow  {
	public  final Map<String, NodeEntity> NODE_MAP = new HashMap<String, NodeEntity>();
	public  static final String START_NODE_ID = "START";
	public  static final String END_NODE_ID = "END";


	/**
	 * 初始化构建流程节点.
	 *
	 * @return Map<String,NodeEntity> 流程节点Map.
	 */
	public AbstractWorkflow() {

	}

	public NodeEntity getNextNode(final WorkFlowInstance flowInstance,final String inputNodeId) {
		String nodeId = inputNodeId;
		if (nodeId == null) {
			nodeId = START_NODE_ID;
		}
		NodeEntity currentNode = NODE_MAP.get(nodeId);
		if (currentNode == null) {
			throw new BusinessRuntimeException("流程流转错误：当前节点：" + nodeId
					+ "在流程中不存在。");
		}
		NodeEntity nexNode = null;
		if (currentNode.getTransferList().size() == 1) {
			nexNode = currentNode.getTransferList().get(0).getTargetNode();
		} else {
			for (int i = 0; i < currentNode.getTransferList().size(); i++) {
				if (currentNode.getTransferList().get(i)
						.getTransferExpressService().isMatch(
								flowInstance.variableMap)) {
					nexNode = currentNode.getTransferList().get(i)
							.getTargetNode();
				}
			}
		}
		if (nexNode == null) {
			throw new BusinessRuntimeException("流程流转错误：当前节点："
					+ currentNode.getId() + "没有可以到达的下一个节点。");
		}
		return nexNode;
	}
}
