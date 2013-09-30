package com.huatek.framework.entity;

import java.util.Set;

import com.huatek.base.tree.TreeEntity;

public class FwSource extends TreeEntity implements java.io.Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = -5175246456181078279L;

	/** persistent field */
	private String sourceCode;

	/** persistent field */
	private Set<FwSrcAction> fwSrcActions;

	private int position;

	/** persistent field */
	private FwSystem fwSystem;

	/** persistent field */
	private int isMenu;
	
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	private String description;


	public int getIsMenu() {
		return isMenu;
	}

	public void setIsMenu(int isMenu) {
		this.isMenu = isMenu;
	}


	public int getPosition() {
		return position;
	}

	public void setPosition(int position) {
		this.position = position;
	}

	/** default constructor */
	public FwSource() {
	}

	public String getSourceCode() {
		return this.sourceCode;
	}

	public void setSourceCode(String sourceCode) {
		this.sourceCode = sourceCode;
	}


	public Set<FwSrcAction> getFwSrcActions() {
		return this.fwSrcActions;
	}

	public void setFwSrcActions(Set<FwSrcAction> fwSrcActions) {
		this.fwSrcActions = fwSrcActions;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public FwSystem getFwSystem() {
		return fwSystem;
	}

	public void setFwSystem(FwSystem fwSystem) {
		this.fwSystem = fwSystem;
	}

}
