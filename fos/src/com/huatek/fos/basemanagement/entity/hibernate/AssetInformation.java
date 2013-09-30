/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-27 下午03:17:44
 * Author: zeek_zheng
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.basemanagement.entity.hibernate;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.huatek.base.entity.BaseEntity;

/**
 * 
 * @author: allen_huang
 * 
 * @version $Id: BeginFunds.java, v 0.1 2013-5-27 下午03:17:44 $
 * 
 *          Comment: 资产信息的实体
 */
public class AssetInformation extends BaseEntity implements Serializable {

	/**
	 * 序列号
	 */
	private static final long serialVersionUID = -6682985681176554842L;

	/**
	 * 金额使用类型（1代表融资 2代表担保）.
	 */
	private String userType;

	/**
	 * 融资担保年度预算金额
	 */
	private BigDecimal budgetMoney;
	/**
	 * 年度起始时间
	 */
	private Date startDate;
	/**
	 * 年度截至时间
	 */
	private Date endDate;
	/**
	 * 创建日期
	 */
	private Date foundDate;
	/**
	 * 融资总额.
	 */
	private BigDecimal financAmunt;
	/**
	 * 担保总额.
	 */
	private BigDecimal sercurtyAmunt;

	public BigDecimal getSercurtyAmunt() {
		return sercurtyAmunt;
	}

	public void setSercurtyAmunt(BigDecimal sercurtyAmunt) {
		this.sercurtyAmunt = sercurtyAmunt;
	}

	public BigDecimal getFinancAmunt() {
		return financAmunt;
	}

	public void setFinancAmunt(BigDecimal financAmunt) {
		this.financAmunt = financAmunt;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public BigDecimal getBudgetMoney() {
		return budgetMoney;
	}

	public void setBudgetMoney(BigDecimal budgetMoney) {
		this.budgetMoney = budgetMoney;
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

	public Date getFoundDate() {
		return foundDate;
	}

	public void setFoundDate(Date foundDate) {
		this.foundDate = foundDate;
	}

}
