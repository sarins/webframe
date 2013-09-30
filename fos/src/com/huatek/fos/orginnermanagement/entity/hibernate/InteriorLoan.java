/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-27 下午03:40:00
 * Author: allen_huang
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.orginnermanagement.entity.hibernate;

import java.math.BigDecimal;
import java.util.Date;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.entity.FwGroup;

/**
 * 
 * @author: allen_huang
 * 
 * @version $Id: Financing.java, v 0.1 2013-5-21 下午02:04:59 $
 * 
 *          Comment: 集团内部借款实体类.
 */
public class InteriorLoan extends BaseEntity implements java.io.Serializable {

	/**
	 * 序列号.
	 */
	private static final long serialVersionUID = -9050387091076862322L;
	/**
	 * 借款人.
	 */
	private String loanUser;
	/**
	 * 借款金额.
	 */
	private BigDecimal loanMoney;
	/**
	 * 贷款银行.
	 */
	private String loanBank;
	/**
	 * 合同利率.
	 */
	private BigDecimal contractRates;
	/**
	 * 实际利率.
	 */
	private String realRates;
	/**
	 * 财务顾问费.
	 */
	private BigDecimal adviserCost;
	/**
	 * 起息日.
	 */
	private Date startRateDate;
	/**
	 * 到期日.
	 */
	private Date endRateDate;
	/**
	 * 期限.
	 */
	private Long timeLimit;
	/**
	 * 计数天数.
	 */
	private Long provisionDays;
	/**
	 * 利息收入.
	 */
	private BigDecimal interestIncome;
	/**
	 * 结息日.
	 */
	private Long endInterestDate;
	/**
	 * 付息方式.
	 */
	private String endInterestMode;
	/**
	 * 借款状态.
	 */
	private String loanStatus;
	/**
	 * 是否延期.
	 */
	private String isDelay;
	/**
	 * 延期起始日期.
	 */
	private Date delayStartDate;
	/**
	 * 延期截至日期.
	 */
	private Date delayEndDate;
	/**
	 * 员工部门Id.
	 */
	private FwGroup group;
	/**
	 * 经办人.
	 */
	private String transactUser;
	private String transactAcctName;
	/**
	 * 创建日期.
	 */
	private Date foundDate;
	/**
	 * 备注
	 */
	private String remarks;
	/**
	 * 编制状态
	 */
	private String forState;
	/**
	 * 部门负责人
	 */
	private String resUser;
	/**
	 * 部门审核状态
	 */
	private String auditState;
	/**
	 * 分管领导
	 */
	private String leaderShip;
	private String mgLeaderUserName;

	/**
	 * 分管领导审核状态
	 */
	private String leaderAuditState;
	/**
	 * 是否可修改
	 */
	private String isModify;
	/**
	 * 付息起止日期.
	 */
	private String payIntestDate;
	/**
	 * 还款周期.
	 */
	private String repayPeriod;

	private String payPeriod;

	public String getPayPeriod() {
		return payPeriod;
	}

	public void setPayPeriod(String payPeriod) {
		this.payPeriod = payPeriod;
	}

	private BigDecimal payAmount;

	public String getLoanUser() {
		return loanUser;
	}

	public void setLoanUser(String loanUser) {
		this.loanUser = loanUser;
	}

	public BigDecimal getLoanMoney() {
		return loanMoney;
	}

	public void setLoanMoney(BigDecimal loanMoney) {
		this.loanMoney = loanMoney;
	}

	public String getLoanBank() {
		return loanBank;
	}

	public void setLoanBank(String loanBank) {
		this.loanBank = loanBank;
	}

	public BigDecimal getContractRates() {
		return contractRates;
	}

	public void setContractRates(BigDecimal contractRates) {
		this.contractRates = contractRates;
	}

	public String getRealRates() {
		return realRates;
	}

	public void setRealRates(String realRates) {
		this.realRates = realRates;
	}

	public BigDecimal getAdviserCost() {
		return adviserCost;
	}

	public void setAdviserCost(BigDecimal adviserCost) {
		this.adviserCost = adviserCost;
	}

	public Date getStartRateDate() {
		return startRateDate;
	}

	public void setStartRateDate(Date startRateDate) {
		this.startRateDate = startRateDate;
	}

	public Date getEndRateDate() {
		return endRateDate;
	}

	public void setEndRateDate(Date endRateDate) {
		this.endRateDate = endRateDate;
	}

	public Long getTimeLimit() {
		return timeLimit;
	}

	public void setTimeLimit(Long timeLimit) {
		this.timeLimit = timeLimit;
	}

	public Long getProvisionDays() {
		return provisionDays;
	}

	public void setProvisionDays(Long provisionDays) {
		this.provisionDays = provisionDays;
	}

	public BigDecimal getInterestIncome() {
		return interestIncome;
	}

	public void setInterestIncome(BigDecimal interestIncome) {
		this.interestIncome = interestIncome;
	}

	public Long getEndInterestDate() {
		return endInterestDate;
	}

	public void setEndInterestDate(Long endInterestDate) {
		this.endInterestDate = endInterestDate;
	}

	public String getEndInterestMode() {
		return endInterestMode;
	}

	public void setEndInterestMode(String endInterestMode) {
		this.endInterestMode = endInterestMode;
	}

	public String getLoanStatus() {
		return loanStatus;
	}

	public void setLoanStatus(String loanStatus) {
		this.loanStatus = loanStatus;
	}

	public String getIsDelay() {
		return isDelay;
	}

	public void setIsDelay(String isDelay) {
		this.isDelay = isDelay;
	}

	public Date getDelayStartDate() {
		return delayStartDate;
	}

	public void setDelayStartDate(Date delayStartDate) {
		this.delayStartDate = delayStartDate;
	}

	public Date getDelayEndDate() {
		return delayEndDate;
	}

	public void setDelayEndDate(Date delayEndDate) {
		this.delayEndDate = delayEndDate;
	}

	public FwGroup getGroup() {
		return group;
	}

	public void setGroup(FwGroup group) {
		this.group = group;
	}

	public String getTransactUser() {
		return transactUser;
	}

	public void setTransactUser(String transactUser) {
		this.transactUser = transactUser;
	}

	public Date getFoundDate() {
		return foundDate;
	}

	public void setFoundDate(Date foundDate) {
		this.foundDate = foundDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getForState() {
		return forState;
	}

	public void setForState(String forState) {
		this.forState = forState;
	}

	public String getResUser() {
		return resUser;
	}

	public void setResUser(String resUser) {
		this.resUser = resUser;
	}

	public String getAuditState() {
		return auditState;
	}

	public void setAuditState(String auditState) {
		this.auditState = auditState;
	}

	public String getLeaderShip() {
		return leaderShip;
	}

	public void setLeaderShip(String leaderShip) {
		this.leaderShip = leaderShip;
	}

	public String getLeaderAuditState() {
		return leaderAuditState;
	}

	public void setLeaderAuditState(String leaderAuditState) {
		this.leaderAuditState = leaderAuditState;
	}

	public String getIsModify() {
		return isModify;
	}

	public void setIsModify(String isModify) {
		this.isModify = isModify;
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

	public String getRepayPeriod() {
		return repayPeriod;
	}

	public void setRepayPeriod(String repayPeriod) {
		this.repayPeriod = repayPeriod;
	}

	public String getTransactAcctName() {
		return transactAcctName;
	}

	public void setTransactAcctName(String transactAcctName) {
		this.transactAcctName = transactAcctName;
	}

	public String getMgLeaderUserName() {
		return mgLeaderUserName;
	}

	public void setMgLeaderUserName(String mgLeaderUserName) {
		this.mgLeaderUserName = mgLeaderUserName;
	}

}
