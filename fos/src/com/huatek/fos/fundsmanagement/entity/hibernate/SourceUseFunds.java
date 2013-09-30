package com.huatek.fos.fundsmanagement.entity.hibernate;

import java.math.BigDecimal;
import java.util.Date;

import com.huatek.base.entity.BaseEntity;
import com.huatek.fos.categorymanagement.entity.hibernate.BaseProjectCategories;
import com.huatek.framework.entity.FwGroup;

/**
 * 
 * 
 * @author: marvin_liu
 * 
 * @version $Id: SourceUseFunds.java, v 0.1 2013-5-29 下午01:16:14 $
 * 
 *          Comment: 请添加对类的描述
 */

public class SourceUseFunds extends BaseEntity implements java.io.Serializable {

	/**
	 * serialVersionUID.
	 */
	private static final long serialVersionUID = -7594249891730083391L;
	private String projectName;
	private BaseProjectCategories firstCategory;
	private BaseProjectCategories sencondCategory;
	private BigDecimal tenDaysMoney;
	private BigDecimal tenDaysMoneySummarySecond;
	private BigDecimal tenDaysMoneySummaryFirst;
	private Date tenDaysDate;
	private BigDecimal aMonthMoney;
	private BigDecimal aMonthMoneySummarySecond;
	private BigDecimal aMonthMoneySummaryFirst;
	private Date aMonthDate;
	private BigDecimal twoMonthsMoney;
	private BigDecimal twoMonthsMoneySummarySecond;
	private BigDecimal twoMonthsMoneySummaryFirst;
	private BigDecimal threeMonthsMoney;
	private BigDecimal threeMonthsMoneySummarySecond;
	private BigDecimal threeMonthsMoneySummaryFirst;
	private BigDecimal sixMonthsMoney;
	private BigDecimal sixMonthsMoneySummarySecond;
	private BigDecimal sixMonthsMoneySummaryFirst;
	private BigDecimal moreSixMonthsMoney;
	private BigDecimal moreSixMonthsMoneySummarySecond;
	private BigDecimal moreSixMonthsMoneySummaryFirst;
	private String dataSources;
	private String isModify;
	private String organizationUserName;
	private String remarks;
	private Date gatherDate;
	private Date foundDate;
	private FwGroup group;
	private BigDecimal summaryMoney;

	private Integer secondProjectCount;
	private Integer firstProjectCount;

	private Integer secondCountUnderFirst;

	private BigDecimal firstProjectMoneySummary;
	private BigDecimal secondProjectMoneySummary;

	private String isCopy;

	public BigDecimal getSummaryMoney() {
		if (tenDaysMoney == null) {
			tenDaysMoney = new BigDecimal("0");
		}
		return tenDaysMoney.add(aMonthMoney).add(twoMonthsMoney)
				.add(threeMonthsMoney).add(moreSixMonthsMoney)
				.add(sixMonthsMoney);
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public BigDecimal getTenDaysMoney() {
		return tenDaysMoney;
	}

	public void setTenDaysMoney(BigDecimal tenDaysMoney) {
		this.tenDaysMoney = tenDaysMoney;
	}

	public Date getTenDaysDate() {
		return tenDaysDate;
	}

	public void setTenDaysDate(Date tenDaysDate) {
		this.tenDaysDate = tenDaysDate;
	}

	public BigDecimal getaMonthMoney() {
		return aMonthMoney;
	}

	public void setaMonthMoney(BigDecimal aMonthMoney) {
		this.aMonthMoney = aMonthMoney;
	}

	public Date getaMonthDate() {
		return aMonthDate;
	}

	public void setaMonthDate(Date aMonthDate) {
		this.aMonthDate = aMonthDate;
	}

	public BigDecimal getTwoMonthsMoney() {
		return twoMonthsMoney;
	}

	public void setTwoMonthsMoney(BigDecimal twoMonthsMoney) {
		this.twoMonthsMoney = twoMonthsMoney;
	}

	public BigDecimal getThreeMonthsMoney() {
		return threeMonthsMoney;
	}

	public void setThreeMonthsMoney(BigDecimal threeMonthsMoney) {
		this.threeMonthsMoney = threeMonthsMoney;
	}

	public BigDecimal getMoreSixMonthsMoney() {
		return moreSixMonthsMoney;
	}

	public void setMoreSixMonthsMoney(BigDecimal moreSixMonthsMoney) {
		this.moreSixMonthsMoney = moreSixMonthsMoney;
	}

	public String getDataSources() {
		return dataSources;
	}

	public void setDataSources(String dataSources) {
		this.dataSources = dataSources;
	}

	public String getIsModify() {
		return isModify;
	}

	public void setIsModify(String isModify) {
		this.isModify = isModify;
	}

	public String getOrganizationUserName() {
		return organizationUserName;
	}

	public void setOrganizationUserName(String organizationUserName) {
		this.organizationUserName = organizationUserName;
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

	public BigDecimal getSixMonthsMoney() {
		return sixMonthsMoney;
	}

	public void setSixMonthsMoney(BigDecimal sixMonthsMoney) {
		this.sixMonthsMoney = sixMonthsMoney;
	}

	public BaseProjectCategories getFirstCategory() {
		return firstCategory;
	}

	public void setFirstCategory(BaseProjectCategories firstCategory) {
		this.firstCategory = firstCategory;
	}

	public BaseProjectCategories getSencondCategory() {
		return sencondCategory;
	}

	public void setSencondCategory(BaseProjectCategories sencondCategory) {
		this.sencondCategory = sencondCategory;
	}

	public BigDecimal getTenDaysMoneySummarySecond() {
		return tenDaysMoneySummarySecond;
	}

	public void setTenDaysMoneySummarySecond(
			BigDecimal tenDaysMoneySummarySecond) {
		this.tenDaysMoneySummarySecond = tenDaysMoneySummarySecond;
	}

	public BigDecimal getTenDaysMoneySummaryFirst() {
		return tenDaysMoneySummaryFirst;
	}

	public void setTenDaysMoneySummaryFirst(BigDecimal tenDaysMoneySummaryFirst) {
		this.tenDaysMoneySummaryFirst = tenDaysMoneySummaryFirst;
	}

	public BigDecimal getaMonthMoneySummarySecond() {
		return aMonthMoneySummarySecond;
	}

	public void setaMonthMoneySummarySecond(BigDecimal aMonthMoneySummarySecond) {
		this.aMonthMoneySummarySecond = aMonthMoneySummarySecond;
	}

	public BigDecimal getaMonthMoneySummaryFirst() {
		return aMonthMoneySummaryFirst;
	}

	public void setaMonthMoneySummaryFirst(BigDecimal aMonthMoneySummaryFirst) {
		this.aMonthMoneySummaryFirst = aMonthMoneySummaryFirst;
	}

	public BigDecimal getTwoMonthsMoneySummarySecond() {
		return twoMonthsMoneySummarySecond;
	}

	public void setTwoMonthsMoneySummarySecond(
			BigDecimal twoMonthsMoneySummarySecond) {
		this.twoMonthsMoneySummarySecond = twoMonthsMoneySummarySecond;
	}

	public BigDecimal getTwoMonthsMoneySummaryFirst() {
		return twoMonthsMoneySummaryFirst;
	}

	public void setTwoMonthsMoneySummaryFirst(
			BigDecimal twoMonthsMoneySummaryFirst) {
		this.twoMonthsMoneySummaryFirst = twoMonthsMoneySummaryFirst;
	}

	public BigDecimal getThreeMonthsMoneySummarySecond() {
		return threeMonthsMoneySummarySecond;
	}

	public void setThreeMonthsMoneySummarySecond(
			BigDecimal threeMonthsMoneySummarySecond) {
		this.threeMonthsMoneySummarySecond = threeMonthsMoneySummarySecond;
	}

	public BigDecimal getThreeMonthsMoneySummaryFirst() {
		return threeMonthsMoneySummaryFirst;
	}

	public void setThreeMonthsMoneySummaryFirst(
			BigDecimal threeMonthsMoneySummaryFirst) {
		this.threeMonthsMoneySummaryFirst = threeMonthsMoneySummaryFirst;
	}

	public BigDecimal getSixMonthsMoneySummarySecond() {
		return sixMonthsMoneySummarySecond;
	}

	public void setSixMonthsMoneySummarySecond(
			BigDecimal sixMonthsMoneySummarySecond) {
		this.sixMonthsMoneySummarySecond = sixMonthsMoneySummarySecond;
	}

	public BigDecimal getSixMonthsMoneySummaryFirst() {
		return sixMonthsMoneySummaryFirst;
	}

	public void setSixMonthsMoneySummaryFirst(
			BigDecimal sixMonthsMoneySummaryFirst) {
		this.sixMonthsMoneySummaryFirst = sixMonthsMoneySummaryFirst;
	}

	public BigDecimal getMoreSixMonthsMoneySummarySecond() {
		return moreSixMonthsMoneySummarySecond;
	}

	public void setMoreSixMonthsMoneySummarySecond(
			BigDecimal moreSixMonthsMoneySummarySecond) {
		this.moreSixMonthsMoneySummarySecond = moreSixMonthsMoneySummarySecond;
	}

	public BigDecimal getMoreSixMonthsMoneySummaryFirst() {
		return moreSixMonthsMoneySummaryFirst;
	}

	public void setMoreSixMonthsMoneySummaryFirst(
			BigDecimal moreSixMonthsMoneySummaryFirst) {
		this.moreSixMonthsMoneySummaryFirst = moreSixMonthsMoneySummaryFirst;
	}

	public Integer getSecondProjectCount() {
		return secondProjectCount;
	}

	public void setSecondProjectCount(Integer secondProjectCount) {
		this.secondProjectCount = secondProjectCount;
	}

	public Integer getFirstProjectCount() {
		return firstProjectCount;
	}

	public void setFirstProjectCount(Integer firstProjectCount) {
		this.firstProjectCount = firstProjectCount;
	}

	public BigDecimal getFirstProjectMoneySummary() {
		return firstProjectMoneySummary;
	}

	public void setFirstProjectMoneySummary(BigDecimal firstProjectMoneySummary) {
		this.firstProjectMoneySummary = firstProjectMoneySummary;
	}

	public BigDecimal getSecondProjectMoneySummary() {
		return secondProjectMoneySummary;
	}

	public void setSecondProjectMoneySummary(
			BigDecimal secondProjectMoneySummary) {
		this.secondProjectMoneySummary = secondProjectMoneySummary;
	}

	public Integer getSecondCountUnderFirst() {
		return secondCountUnderFirst;
	}

	public void setSecondCountUnderFirst(Integer secondCountUnderFirst) {
		this.secondCountUnderFirst = secondCountUnderFirst;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getIsCopy() {
		return isCopy;
	}

	public void setIsCopy(String isCopy) {
		this.isCopy = isCopy;
	}
}