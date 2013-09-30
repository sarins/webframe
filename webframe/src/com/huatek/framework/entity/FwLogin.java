package com.huatek.framework.entity;

import java.util.Date;

import com.huatek.base.entity.BaseEntity;

public class FwLogin extends BaseEntity implements java.io.Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -2297445333018450643L;

	/** persistent field */
	private java.util.Date lastLoginTime;
	/** persistent field */
	private Integer errorNum;
	/** persistent field */
	private Integer isLocked;
	/** persistent field */
	private String sessionId;
	/** persistent field */
	private Date lockedTime;

	private String lastLoginIp;

	public FwLogin(){

	}

	public java.util.Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(java.util.Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public Integer getErrorNum() {
		return errorNum;
	}

	public void setErrorNum(Integer errorNum) {
		this.errorNum = errorNum;
	}

	public Integer getIsLocked() {
		return isLocked;
	}

	public void setIsLocked(Integer isLocked) {
		this.isLocked = isLocked;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Date getLockedTime() {
		return lockedTime;
	}

	public void setLockedTime(Date lockedTime) {
		this.lockedTime = lockedTime;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
}
