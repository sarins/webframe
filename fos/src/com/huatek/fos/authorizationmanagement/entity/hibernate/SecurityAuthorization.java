/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-28 上午11:12:23
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.authorizationmanagement.entity.hibernate;

import java.math.BigDecimal;
import java.util.Date;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.entity.FwGroup;

/**
 * 
 * @author: apple_liu
 * 
 * @version $Id: SecurityAuthorization.java, v 0.1 2013-5-28 上午11:12:23 $
 * 
 *          Comment: 请类用来记录担保授信相关信息.
 */
public class SecurityAuthorization extends BaseEntity implements
		java.io.Serializable {

	/**
	 * 序列号.
	 */
	private static final long serialVersionUID = -8534883285616493510L;
	/**
	 * 项目类别.
	 */
	private String categoryType;
	/**
	 * 事项状态.
	 */
	private String eventStatus;
	/**
	 * 事项名称.
	 */
	private String eventName;
	/**
	 * 提取类别.
	 */
	private String drawType;
	/**
	 * 合同金额.
	 */
	private BigDecimal contractMoney;
	/**
	 * 担保金额.
	 */
	private BigDecimal securityMoney;
	/**
	 * 事项发生起始日期.
	 */
	private Date eventInitialDate;
	/**
	 * 事项发生截止日期.
	 */
	private Date eventEndDate;
	/**
	 * 审批情况 .
	 */
	private String approveCondition;
	/**
	 * 事项基本情况概述.
	 */
	private String eventSummary;
	/**
	 * 备注.
	 */
	private String remarks;
	/**
	 * 员工部门Id.
	 */
	private FwGroup group;
	/**
	 * 经办人.
	 */
	private String transacUser;
	/**
	 * 创建日期.
	 */
	private Date foundDate;

	public String getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(String categoryType) {
		this.categoryType = categoryType;
	}

	public String getEventStatus() {
		return eventStatus;
	}

	public void setEventStatus(String eventStatus) {
		this.eventStatus = eventStatus;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getDrawType() {
		return drawType;
	}

	public void setDrawType(String drawType) {
		this.drawType = drawType;
	}

	public BigDecimal getContractMoney() {
		return contractMoney;
	}

	public void setContractMoney(BigDecimal contractMoney) {
		this.contractMoney = contractMoney;
	}

	public BigDecimal getSecurityMoney() {
		return securityMoney;
	}

	public void setSecurityMoney(BigDecimal securityMoney) {
		this.securityMoney = securityMoney;
	}

	public Date getEventInitialDate() {
		return eventInitialDate;
	}

	public void setEventInitialDate(Date eventInitialDate) {
		this.eventInitialDate = eventInitialDate;
	}

	public Date getEventEndDate() {
		return eventEndDate;
	}

	public void setEventEndDate(Date eventEndDate) {
		this.eventEndDate = eventEndDate;
	}

	public String getApproveCondition() {
		return approveCondition;
	}

	public void setApproveCondition(String approveCondition) {
		this.approveCondition = approveCondition;
	}

	public String getEventSummary() {
		return eventSummary;
	}

	public void setEventSummary(String eventSummary) {
		this.eventSummary = eventSummary;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public FwGroup getGroup() {
		return group;
	}

	public void setGroup(FwGroup group) {
		this.group = group;
	}

	public String getTransacUser() {
		return transacUser;
	}

	public void setTransacUser(String transacUser) {
		this.transacUser = transacUser;
	}

	public Date getFoundDate() {
		return foundDate;
	}

	public void setFoundDate(Date foundDate) {
		this.foundDate = foundDate;
	}

}
