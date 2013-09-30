package com.huatek.fos.orginnermanagement.entity.hibernate;

import java.util.Date;

import com.huatek.base.entity.BaseEntity;

/**
 * 委贷集团内部驳回原因实体类
 * 
 * @author Allen_Huang
 * 
 */

public class LoanReasonRecord extends BaseEntity implements
		java.io.Serializable {

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = -9200247654922461622L;

	private String rejReason;
	private String rejUserName;
	private Date rejDate;
	private String useType;
	private Long ownId;
	private Date foundDate;

	public String getRejReason() {
		return rejReason;
	}

	public void setRejReason(String rejReason) {
		this.rejReason = rejReason;
	}

	public String getRejUserName() {
		return rejUserName;
	}

	public void setRejUserName(String rejUserName) {
		this.rejUserName = rejUserName;
	}

	public Date getRejDate() {
		return rejDate;
	}

	public void setRejDate(Date rejDate) {
		this.rejDate = rejDate;
	}

	public Date getFoundDate() {
		return foundDate;
	}

	public void setFoundDate(Date foundDate) {
		this.foundDate = foundDate;
	}

	public String getUseType() {
		return useType;
	}

	public void setUseType(String useType) {
		this.useType = useType;
	}

	public Long getOwnId() {
		return ownId;
	}

	public void setOwnId(Long ownId) {
		this.ownId = ownId;
	}

}