package com.huatek.fos.fundsmanagement.entity.hibernate;

import java.util.Date;

import com.huatek.base.entity.BaseEntity;

/**
 * 
 * 
 * @author: marvin_liu
 * 
 * @version $Id: RejectReasonRecord.java, v 0.1 2013-5-29 下午01:16:37 $
 * 
 *          Comment: 请添加对类的描述
 */
public class RejectReasonRecord extends BaseEntity implements
		java.io.Serializable {

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = -7594249891730083391L;
	private String rejReason;
	private String rejUserName;
	private Date rejDate;
	private Date foundDate;
	private AuditReportRecord auditReportRecord;

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

	public AuditReportRecord getAuditReportRecord() {
		return auditReportRecord;
	}

	public void setAuditReportRecord(AuditReportRecord auditReportRecord) {
		this.auditReportRecord = auditReportRecord;
	}

}