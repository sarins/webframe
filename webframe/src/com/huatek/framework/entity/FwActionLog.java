package com.huatek.framework.entity;

import java.util.Date;
import java.util.Set;

import com.huatek.base.entity.BaseEntity;

public class FwActionLog extends BaseEntity implements java.io.Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;


	/** persistent field */
	private Date actionTime;

	/** persistent field */
	private String clientIp;

	/** persistent field */
	private Long clientPort;

	/** persistent field */
	private FwSrcAction fwSrcAction;

	/** persistent field */
	private FwAccount fwAccount;

	/** persistent field */
	private Set<FwActionCnt> fwActionCnts;

	/** default constructor */
	public FwActionLog() {
	}


	public Date getActionTime() {
		return this.actionTime;
	}

	public void setActionTime(Date actionTime) {
		this.actionTime = actionTime;
	}

	public String getClientIp() {
		return this.clientIp;
	}

	public void setClientIp(String clientIp) {
		this.clientIp = clientIp;
	}

	public Long getClientPort() {
		return this.clientPort;
	}

	public void setClientPort(Long clientPort) {
		this.clientPort = clientPort;
	}

	public FwSrcAction getFwSrcAction() {
		return this.fwSrcAction;
	}

	public void setFwSrcAction(FwSrcAction fwSrcAction) {
		this.fwSrcAction = fwSrcAction;
	}

	public FwAccount getFwAccount() {
		return this.fwAccount;
	}

	public void setFwAccount(FwAccount fwAccount) {
		this.fwAccount = fwAccount;
	}

	public Set<FwActionCnt> getFwActionCnts() {
		return this.fwActionCnts;
	}

	public void setFwActionCnts(Set<FwActionCnt> fwActionCnts) {
		this.fwActionCnts = fwActionCnts;
	}

	public void addFwActionCnt(FwActionCnt fwActionCnt) {
		fwActionCnts.add(fwActionCnt);
	}

}
