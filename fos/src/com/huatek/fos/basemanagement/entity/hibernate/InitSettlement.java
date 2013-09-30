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
 * @author: zeek_zheng
 * 
 * @version $Id: BeginFunds.java, v 0.1 2013-5-27 下午03:17:44 $
 * 
 *          Comment: 期初结转金额的实体
 */
public class InitSettlement extends BaseEntity implements Serializable {

	/**
	 * 序列号
	 */
	private static final long serialVersionUID = -1567647773793342476L;

	/**
	 * 期初结转金额
	 */
	private BigDecimal settlementMoney;

	/**
	 * 统计日期
	 */
	private Date gatherDate;

	/**
	 * 创建日期
	 */
	private Date foundDate;

	/**
	 * 金额使用类型
	 */
	private String useType;

	public BigDecimal getSettlementMoney() {
		return settlementMoney;
	}

	public void setSettlementMoney(BigDecimal settlementMoney) {
		this.settlementMoney = settlementMoney;
	}

	public Date getFoundDate() {
		return foundDate;
	}

	public void setFoundDate(Date foundDate) {
		this.foundDate = foundDate;
	}

	public String getUseType() {
		return useType;
	}

	public void setUseType(String useType) {
		this.useType = useType;
	}

	public void setGatherDate(Date gatherDate) {
		this.gatherDate = gatherDate;
	}

	public Date getGatherDate() {
		return gatherDate;
	}
}
