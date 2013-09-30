package com.huatek.workflow.demo.entity;

import com.huatek.workflow.entity.WorkFlowInstance;

public class DemoEntity extends WorkFlowInstance {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private String orderStatus;

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
}
