package com.huatek.framework.entity;

import java.util.Set;

import com.huatek.base.entity.NamedEntity;

public class FwSrcAction extends NamedEntity implements java.io.Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 3200145438216401849L;



	/** persistent field */
	private String actionMethods;
	/** persistent field */
	private Integer logLevel;
	/** persistent field */
	private String methodName;

	/** persistent field */
	private Double actionOrder;

	/** persistent field */
	private FwSource fwSource;

	private String actionPath;

	/** persistent field */
	private Set<FwDutyAction> fwDutyActions;

	/** persistent field */
	private Set<FwActionLog> fwActionLogs;
	public FwSrcAction(){

	}

	public FwSource getFwSource() {
		return this.fwSource;
	}

	public void setFwSource(FwSource fwSource) {
		this.fwSource = fwSource;
	}

	public Set<FwDutyAction> getFwDutyActions() {
		return this.fwDutyActions;
	}

	public void setFwDutyActions(Set<FwDutyAction> fwDutyActions) {
		this.fwDutyActions = fwDutyActions;
	}

	public Set<FwActionLog> getFwActionLogs() {
		return this.fwActionLogs;
	}

	public void setFwActionLogs(Set<FwActionLog> fwActionLogs) {
		this.fwActionLogs = fwActionLogs;
	}



	public String getActionMethods() {
		return actionMethods;
	}

	public void setActionMethods(String actionPath) {
		this.actionMethods = actionPath;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String logClass) {
		this.methodName = logClass;
	}

	public Integer getLogLevel() {
		return logLevel;
	}

	public void setLogLevel(Integer logLevel) {
		this.logLevel = logLevel;
	}

	public Double getActionOrder() {
		return actionOrder;
	}

	public void setActionOrder(Double actionOrder) {
		this.actionOrder = actionOrder;
	}

	public String getActionPath() {
		return actionPath;
	}

	public void setActionPath(String actionPath) {
		this.actionPath = actionPath;
	}
}
