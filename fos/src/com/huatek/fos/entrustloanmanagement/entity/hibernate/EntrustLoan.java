package com.huatek.fos.entrustloanmanagement.entity.hibernate;

import java.math.BigDecimal;
import java.util.Date;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.entity.FwGroup;

/**
 * 
 * 
 * @author: marvin_liu
 * 
 * @version $Id: EntrustLoan.java, v 0.1 2013-5-29 下午01:15:03 $
 * 
 *          Comment: 委托贷款管理实体类
 */
public class EntrustLoan extends BaseEntity implements java.io.Serializable {

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
	private BigDecimal realRates;
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

	private String forState;
	private String depResUser;
	private String depAuditState;
	private String mgLeaderShip;
	private String mgLeaderUserName;

	private String leaderAuditState;

	private String remarks;

	private String isModify;

	private String replyPeriod;

	/**
	 * 付息起止日期.
	 */
	private String payIntestDate;

	private String payPeriod;

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

	public BigDecimal getRealRates() {
		return realRates;
	}

	public void setRealRates(BigDecimal realRates) {
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

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	public String getPayPeriod() {
		return payPeriod;
	}

	public void setPayPeriod(String payPeriod) {
		this.payPeriod = payPeriod;
	}

	public BigDecimal getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(BigDecimal payAmount) {
		this.payAmount = payAmount;
	}

	public String getReplyPeriod() {
		return replyPeriod;
	}

	public void setReplyPeriod(String replyPeriod) {
		this.replyPeriod = replyPeriod;
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
