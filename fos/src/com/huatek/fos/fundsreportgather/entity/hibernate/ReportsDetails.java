package com.huatek.fos.fundsreportgather.entity.hibernate;

import java.util.Date;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.entity.FwGroup;

/**
 * 导出报表明细实体类
 * 
 * @author: alan_zhang
 */

public class ReportsDetails extends BaseEntity implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7101580009017568267L;
	/**
	 * 员工部门对象
	 */
	private FwGroup group;
	/**
	 * 报表所属类型（1代表单部门，2代表5个部门总和）
	 */
	private String reportsUseType;
	/**
	 * 报表名称1
	 */
	private String oneReportsName;
	/**
	 * 报表名称2
	 */
	private String towReportsName;
	/**
	 * 报表名称3
	 */
	private String threeReportsName;
	/**
	 * 统计日期
	 */
	private Date gatherDate;
	/**
	 * 创建时间
	 */
	private Date foundDate;

	public String getReportsUseType() {
		return reportsUseType;
	}

	public void setReportsUseType(String reportsUseType) {
		this.reportsUseType = reportsUseType;
	}

	public String getOneReportsName() {
		return oneReportsName;
	}

	public void setOneReportsName(String oneReportsName) {
		this.oneReportsName = oneReportsName;
	}

	public String getTowReportsName() {
		return towReportsName;
	}

	public void setTowReportsName(String towReportsName) {
		this.towReportsName = towReportsName;
	}

	public String getThreeReportsName() {
		return threeReportsName;
	}

	public void setThreeReportsName(String threeReportsName) {
		this.threeReportsName = threeReportsName;
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