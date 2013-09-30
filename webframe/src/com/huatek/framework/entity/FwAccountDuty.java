package com.huatek.framework.entity;

import com.huatek.base.entity.BaseEntity;


public class FwAccountDuty extends BaseEntity implements java.io.Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 56432278631030039L;


	/** persistent field */
	private FwDuty fwDuty;

	/** persistent field */
	private FwAccount fwAccount;
	/** persistent field */


	public FwAccountDuty(){

	}

	/** full constructor */
	public FwAccountDuty(FwDuty fwDuty,
			FwAccount fwAccount) {
		this.fwDuty = fwDuty;
		this.fwAccount = fwAccount;
	}


	public FwDuty getFwDuty() {
		return this.fwDuty;
	}

	public void setFwDuty(FwDuty fwDuty) {
		this.fwDuty = fwDuty;
	}

	public FwAccount getFwAccount() {
		return this.fwAccount;
	}

	public void setFwAccount(FwAccount fwAccount) {
		this.fwAccount = fwAccount;
	}

}
