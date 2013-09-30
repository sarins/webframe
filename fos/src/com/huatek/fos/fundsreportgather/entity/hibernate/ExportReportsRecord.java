package com.huatek.fos.fundsreportgather.entity.hibernate;

import java.util.Date;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.entity.FwGroup;

/**
 * 报表导出记录实体
 * 
 * @author: alan_zhang
 */

public class ExportReportsRecord extends BaseEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = 2050321073981945974L;

	/**
	 * 员工部门实体对象
	 */
	private FwGroup group;
	/**
	 * 报表名称
	 */
	private String reportsName;
	/**
	 * 编制部门（部门名称）
	 */
	private String groupName;
	/**
	 * 编制人
	 */
	private String orgUserName;
	/**
	 * 编制人（登录用户名）
	 */
	private String orgAcctName;
	/**
	 * 部门领导
	 */
	private String depResUser;
	/**
	 * 分管领导（登录用户名）
	 */
	private String mgLeaderShip;
	/**
	 * 分管领导
	 */
	private String mgLeaderUserName;
	/**
	 * 算法文档版本号
	 */
	private String algVsnNumber;
	/**
	 * 报表所属类型（1代表单部门，2代表5个部门总和）
	 */
	private String reportsUseType;
	/**
	 * 统计日期
	 */
	private Date gatherDate;
	/**
	 * 创建日期
	 */
	private Date foundDate;

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

	public String getDepResUser() {
		return depResUser;
	}

	public void setDepResUser(String depResUser) {
		this.depResUser = depResUser;
	}

	public String getMgLeaderShip() {
		return mgLeaderShip;
	}

	public void setMgLeaderShip(String mgLeaderShip) {
		this.mgLeaderShip = mgLeaderShip;
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

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getAlgVsnNumber() {
		return algVsnNumber;
	}

	public void setAlgVsnNumber(String algVsnNumber) {
		this.algVsnNumber = algVsnNumber;
	}

	public String getReportsUseType() {
		return reportsUseType;
	}

	public void setReportsUseType(String reportsUseType) {
		this.reportsUseType = reportsUseType;
	}

	public String getOrgAcctName() {
		return orgAcctName;
	}

	public void setOrgAcctName(String orgAcctName) {
		this.orgAcctName = orgAcctName;
	}

	public String getMgLeaderUserName() {
		return mgLeaderUserName;
	}

	public void setMgLeaderUserName(String mgLeaderUserName) {
		this.mgLeaderUserName = mgLeaderUserName;
	}
}