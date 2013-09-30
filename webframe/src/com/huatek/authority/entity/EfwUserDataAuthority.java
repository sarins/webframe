package com.huatek.authority.entity;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.entity.FwAccount;

public class EfwUserDataAuthority extends BaseEntity {
    /**
     *
     */
    private static final long serialVersionUID = -4977250779499112469L;
    private EfwDataRole  efwDataRole;
    private FwAccount	 fwAccount;




	public EfwDataRole getEfwDataRole() {
		return efwDataRole;
	}

	public void setEfwDataRole(EfwDataRole efwDataRole) {
		this.efwDataRole = efwDataRole;
	}

	public FwAccount getFwAccount() {
		return fwAccount;
	}

	public void setFwAccount(FwAccount fwAccount) {
		this.fwAccount = fwAccount;
	}

}
