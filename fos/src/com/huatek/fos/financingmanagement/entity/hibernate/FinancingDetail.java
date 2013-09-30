/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-21 下午02:04:59
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.financingmanagement.entity.hibernate;

import java.math.BigDecimal;
import java.util.Date;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.entity.FwGroup;

/**
 * 
 * @author: apple_liu
 * 
 * @version $Id: Financing.java, v 0.1 2013-5-21 下午02:04:59 $
 * 
 *          Comment: 请类用来管理融资的基本信息.
 */
public class FinancingDetail extends BaseEntity implements java.io.Serializable {

	/**
	 * 序列号.
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 信息类别.
	 */
	private String infoCategory;
	/**
	 * 合同编号.
	 */
	private String contactNumber;
	/**
	 * 机构种类.
	 */
	private String mecCategory;
	/**
	 * 机构名称.
	 */
	private String mecName;
	/**
	 * 融资种类.
	 */
	private String financingCategory;
	/**
	 * 融资金额.
	 */
	private BigDecimal financingMoney;
	/**
	 * 用途.
	 */
	private String use;
	/**
	 * 融资期限.
	 */
	private Long timeLimit;
	/**
	 * 起始日.
	 */
	private Date startDate;
	/**
	 * 截止日.
	 */
	private Date endDate;
	/**
	 * 结息方式.
	 */
	private String endIntMode;
	/**
	 * 结息日.
	 */
	private Long endIntDate;
	/**
	 * 是否变更利率.
	 */
	private String isChangeRate;
	/**
	 * 是否最新.
	 */
	private String isNewest;
	/**
	 * 原始Id.
	 */
	private Long originalId;
	/**
	 * 员工部门Id.
	 */
	private FwGroup group;
	/**
	 * 经办人.
	 */
	private String trasactUser;
	/**
	 * 备注.
	 */
	private String remark;
	/**
	 * 创建日期.
	 */
	private Date createDate;
	/**
	 * 利率.
	 */
	private String interestRate;
	/**
	 * 利率调整方式.
	 */
	private String rateAdjustMode;
	/**
	 * 是否提前还款.
	 */
	private String isAdvanceReply;
	/**
	 * 提前还款日期.
	 */
	private Date earlyReplyDate;
	/**
	 * 还款周期.
	 */
	private String replyPeriod;
	/**
	 * 抵押/担保方式.
	 */
	private String mortMode;
	/**
	 * 抵押物.
	 */
	private String guarantee;
	/**
	 * 实际截止日期.
	 */
	private Date realEndDate;
	/**
	 * 付息起止日期.
	 */
	private String payIntestDate;
	/**
	 * 融资总额.
	 */
	private String totalFinancingMoney;

	public String getTotalFinancingMoney() {
		return totalFinancingMoney;
	}

	public void setTotalFinancingMoney(String totalFinancingMoney) {
		this.totalFinancingMoney = totalFinancingMoney;
	}

	public String getPayIntestDate() {
		return payIntestDate;
	}

	public void setPayIntestDate(String payIntestDate) {
		this.payIntestDate = payIntestDate;
	}

	public BigDecimal getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(BigDecimal payAmount) {
		this.payAmount = payAmount;
	}

	/**
	 * 付息金额.
	 */
	private BigDecimal payAmount;

	public String getInfoCategory() {
		return infoCategory;
	}

	public void setInfoCategory(String infoCategory) {
		this.infoCategory = infoCategory;
	}

	public void setGroup(FwGroup group) {
		this.group = group;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getMecCategory() {
		return mecCategory;
	}

	public void setMecCategory(String mecCategory) {
		this.mecCategory = mecCategory;
	}

	public String getMecName() {
		return mecName;
	}

	public void setMecName(String mecName) {
		this.mecName = mecName;
	}

	public String getFinancingCategory() {
		return financingCategory;
	}

	public void setFinancingCategory(String financingCategory) {
		this.financingCategory = financingCategory;
	}

	public BigDecimal getFinancingMoney() {
		return financingMoney;
	}

	public void setFinancingMoney(BigDecimal financingMoney) {
		this.financingMoney = financingMoney;
	}

	public String getUse() {
		return use;
	}

	public void setUse(String use) {
		this.use = use;
	}

	public Long getTimeLimit() {
		return timeLimit;
	}

	public void setTimeLimit(Long timeLimit) {
		this.timeLimit = timeLimit;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getEndIntMode() {
		return endIntMode;
	}

	public void setEndIntMode(String endIntMode) {
		this.endIntMode = endIntMode;
	}

	public String getIsChangeRate() {
		return isChangeRate;
	}

	public void setIsChangeRate(String isChangeRate) {
		this.isChangeRate = isChangeRate;
	}

	public String getIsAdvanceReply() {
		return isAdvanceReply;
	}

	public void setIsAdvanceReply(String isAdvanceReply) {
		this.isAdvanceReply = isAdvanceReply;
	}

	public Date getEarlyReplyDate() {
		return earlyReplyDate;
	}

	public void setEarlyReplyDate(Date earlyReplyDate) {
		this.earlyReplyDate = earlyReplyDate;
	}

	public String getReplyPeriod() {
		return replyPeriod;
	}

	public void setReplyPeriod(String replyPeriod) {
		this.replyPeriod = replyPeriod;
	}

	public String getMortMode() {
		return mortMode;
	}

	public void setMortMode(String mortMode) {
		this.mortMode = mortMode;
	}

	public String getGuarantee() {
		return guarantee;
	}

	public void setGuarantee(String guarantee) {
		this.guarantee = guarantee;
	}

	public FwGroup getGroup() {
		return group;
	}

	public String getTrasactUser() {
		return trasactUser;
	}

	public void setTrasactUser(String trasactUser) {
		this.trasactUser = trasactUser;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getRateAdjustMode() {
		return rateAdjustMode;
	}

	public void setRateAdjustMode(String rateAdjustMode) {
		this.rateAdjustMode = rateAdjustMode;
	}

	public String getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(String interestRate) {
		this.interestRate = interestRate;
	}

	public Long getOriginalId() {
		return originalId;
	}

	public void setOriginalId(Long originalId) {
		this.originalId = originalId;
	}

	public Long getEndIntDate() {
		return endIntDate;
	}

	public void setEndIntDate(Long endIntDate) {
		this.endIntDate = endIntDate;
	}

	public String getIsNewest() {
		return isNewest;
	}

	public void setIsNewest(String isNewest) {
		this.isNewest = isNewest;
	}

	public Date getRealEndDate() {
		return realEndDate;
	}

	public void setRealEndDate(Date realEndDate) {
		this.realEndDate = realEndDate;
	}
}
