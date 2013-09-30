package com.huatek.fos.fundsmanagement.entity.hibernate;

import java.util.Date;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.entity.FwGroup;

/**
 * 
 * 
 * @author: marvin_liu
 * 
 * @version $Id: AuditReportRecord.java, v 0.1 2013-5-29 下午01:17:16 $
 * 
 *          Comment: 请添加对类的描述
 */

public class AuditReportRecord extends BaseEntity implements
		java.io.Serializable {

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = -7594249891730083391L;
	private String reportsName;
	private String orgUserName;
	private String forState;
	private String depResUser;
	private String depAuditState;
	private String mgLeaderShip;
	private String leaderAuditState;
	private Date gatherDate;
	private Date foundDate;
	private FwGroup group;
	/**
	 * 分管领导
	 */
	private String mgLeaderUserName;
	/**
	 * 编制人（登录用户名）
	 */
	private String orgAcctName;

	public String getMgLeaderUserName() {
		return mgLeaderUserName;
	}

	public void setMgLeaderUserName(String mgLeaderUserName) {
		this.mgLeaderUserName = mgLeaderUserName;
	}

	public String getOrgAcctName() {
		return orgAcctName;
	}

	public void setOrgAcctName(String orgAcctName) {
		this.orgAcctName = orgAcctName;
	}

	public String getReportsName() {
		return reportsName;
	}

	public void setReportsName(String reportsName) {
		this.reportsName = reportsName;
	}

	public String getOrgUserName() {
		return orgUserName;
	}

	public void setOrgUserName(String orgUserName) {
		this.orgUserName = orgUserName;
	}

	public String getForState() {
		return forState;
	}

	public void setForState(String forState) {
		this.forState = forState;
	}

	public String getDepResUser() {
		return depResUser;
	}

	public void setDepResUser(String depResUser) {
		this.depResUser = depResUser;
	}

	public String getDepAuditState() {
		return depAuditState;
	}

	public void setDepAuditState(String depAuditState) {
		this.depAuditState = depAuditState;
	}

	public String getMgLeaderShip() {
		return mgLeaderShip;
	}

	public void setMgLeaderShip(String mgLeaderShip) {
		this.mgLeaderShip = mgLeaderShip;
	}

	public String getLeaderAuditState() {
		return leaderAuditState;
	}

	public void setLeaderAuditState(String leaderAuditState) {
		this.leaderAuditState = leaderAuditState;
	}

	public Date getGatherDate() {
		return gatherDate;
	}

	public void setGatherDate(Date gatherDate) {
		this.gatherDate = gatherDate;
	}

	public Date getFoundDate() {
		return foundDate;
	}

	public void setFoundDate(Date foundDate) {
		this.foundDate = foundDate;
	}

	public FwGroup getGroup() {
		return group;
	}

	public void setGroup(FwGroup group) {
		this.group = group;
	}

}