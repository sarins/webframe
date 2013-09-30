package com.huatek.framework.entity;

import java.util.Set;

import com.huatek.base.entity.NamedEntity;

public class FwDuty extends NamedEntity implements java.io.Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = -8474025844522178714L;


	/** nullable persistent field */
	private String describe;

	private String dutyType;


	private FwGroup fwGroup;


	/** persistent field */
	private Set<FwDutyAction> fwDutyActions;

	/** persistent field */
	private Set<FwAccountDuty> accountDuties;

	public FwDuty(){

	}
	public FwDuty(Long id){
		super.setId(id);
	}

	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public Set<FwDutyAction> getFwDutyActions() {
		return this.fwDutyActions;
	}

	public void setFwDutyActions(Set<FwDutyAction> fwDutyActions) {
		this.fwDutyActions = fwDutyActions;
	}

	public Set<FwAccountDuty> getAccountDuties() {
		return this.accountDuties;
	}

	public void setAccountDuties(Set<FwAccountDuty> fwAccountDuties) {
		this.accountDuties = fwAccountDuties;
	}

	public String getDutyType() {
		return dutyType;
	}

	public void setDutyType(String dutyType) {
		this.dutyType = dutyType;
	}
	public FwGroup getFwGroup() {
		return fwGroup;
	}
	public void setFwGroup(FwGroup fwGroup) {
		this.fwGroup = fwGroup;
	}

}
