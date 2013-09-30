package com.huatek.workflow.entity;

import java.util.ArrayList;
import java.util.List;

/***
 * 流程节点.
 *
 * @author winner_pan
 *
 */
public class NodeEntity {

	/**
	 * 节点ID.
	 */
	String id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	/**
	 * 节点名称.
	 */
	String name;
	/**
	 * 关联节点列表.
	 */
	List<TransferEntity> transferList = new ArrayList<TransferEntity>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<TransferEntity> getTransferList() {
		return transferList;
	}

	public void setTransferList(List<TransferEntity> transferList) {
		this.transferList = transferList;
	}

	public NodeEntity(final String id) {
		this.id = id;
	}

	public NodeEntity(final String id, final String name) {
		this.id = id;
		this.name = name;
	}

	public NodeEntity(final String name, final TransferEntity transferEntity) {
		this.name = name;
		this.transferList.add(transferEntity);
	}

	public void addTransferEntity(final TransferEntity transferEntity) {
		this.transferList.add(transferEntity);
	}

}
