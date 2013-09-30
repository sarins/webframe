package com.huatek.framework.entity;

import com.huatek.base.entity.BaseEntity;


public class FwDutyAction extends BaseEntity implements java.io.Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -4612188363497692194L;


	/** persistent field */
	private FwSrcAction fwSrcAction;

	/** persistent field */
	private FwDuty fwDuty;

	/** default constructor */
	public FwDutyAction() {
	}


	public FwSrcAction getFwSrcAction() {
		return this.fwSrcAction;
	}

	public void setFwSrcAction(FwSrcAction fwSrcAction) {
		this.fwSrcAction = fwSrcAction;
	}

	public FwDuty getFwDuty() {
		return this.fwDuty;
	}

	public void setFwDuty(FwDuty fwDuty) {
		this.fwDuty = fwDuty;
	}


}
