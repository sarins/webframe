package com.huatek.framework.entity;

import com.huatek.base.tree.TreeEntity;

public class FwGroup extends TreeEntity implements java.io.Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1155807352468031510L;


	/** nullable persistent field */
	private String describe;

	private String groupType;


	public FwGroup(){

	}

	public FwGroup(Long id){
		super.setId(id);
	}

	public String getDescribe() {
		return this.describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

    public String getGroupType() {
        return groupType;
    }

    public void setGroupType(String groupType) {
        this.groupType = groupType;
    }

}
