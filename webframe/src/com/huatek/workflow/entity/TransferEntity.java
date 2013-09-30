package com.huatek.workflow.entity;

import com.huatek.workflow.service.TransferExpressService;

/***
 * 流程节点连接.
 *
 * @author winner_pan
 *
 */
public class TransferEntity {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 转移名称.
	 */
	String name;
	/***
	 * 转移条件.
	 */
	String transferExpress;
	/***
	 * 转移条件判断.
	 */
	TransferExpressService transferExpressService;

	public TransferExpressService getTransferExpressService() {
		return transferExpressService;
	}

	public void setTransferExpressService(
			TransferExpressService transferExpressService) {
		this.transferExpressService = transferExpressService;
	}

	/**
	 * 目标节点.
	 */
	NodeEntity targetNode;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTransferExpress() {
		return transferExpress;
	}

	public void setTransferExpress(String transferExpress) {
		this.transferExpress = transferExpress;
	}

	public NodeEntity getTargetNode() {
		return targetNode;
	}

	public void setTargetNode(NodeEntity targetNode) {
		this.targetNode = targetNode;
	}

	public TransferEntity(final String name, final String transferExpress,
			final NodeEntity targetNode) {
		this.name = name;
		this.transferExpress = transferExpress;
		this.targetNode = targetNode;
	}

	public TransferEntity(final String name,
			final NodeEntity targetNode,final TransferExpressService transferExpressService) {
		this.name = name;
		this.transferExpressService = transferExpressService;
		this.targetNode = targetNode;
	}

	public TransferEntity(final String name, final NodeEntity targetNode) {
		this.name = name;
		this.targetNode = targetNode;
	}

	public TransferEntity(
			final NodeEntity targetNode,final TransferExpressService transferExpressService) {
		this.transferExpressService = transferExpressService;
		this.targetNode = targetNode;
	}

	public TransferEntity(final NodeEntity targetNode) {
		this.targetNode = targetNode;
	}



}
