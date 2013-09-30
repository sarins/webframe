package com.huatek.fos.assetdebtmanagement.entity.hibernate;

import java.math.BigDecimal;
import java.util.Date;

import com.huatek.base.entity.BaseEntity;

/**
 * 
 * @author: allen_huang
 * 
 * @version $Id: AssetDebt.java, v 0.1 2013-6-3
 * 
 *          Comment: 资产负债率管理实体类.
 */
public class AssetDebt extends BaseEntity implements java.io.Serializable {

	/**
	 * 序列号.
	 */
	private static final long serialVersionUID = -3846202705229624910L;

	/**
	 * 资产合计.
	 */
	private BigDecimal assetAmount;
	/**
	 * 负债总计.
	 */
	private BigDecimal debtToatl;
	/**
	 * 负债率.
	 */
	private BigDecimal debtRatio;
	/**
	 * 起始日期.
	 */
	private Date startDate;
	/**
	 * 截至日期.
	 */
	private Date endDate;
	/**
	 * 创建日期.
	 */
	private Date foundDate;

	public BigDecimal getAssetAmount() {
		return this.assetAmount;
	}

	public void setAssetAmount(BigDecimal assetAmount) {
		this.assetAmount = assetAmount;
	}

	public BigDecimal getDebtToatl() {
		return this.debtToatl;
	}

	public void setDebtToatl(BigDecimal debtToatl) {
		this.debtToatl = debtToatl;
	}

	public BigDecimal getDebtRatio() {
		return this.debtRatio;
	}

	public void setDebtRatio(BigDecimal debtRatio) {
		this.debtRatio = debtRatio;
	}

	public Date getStartDate() {
		return this.startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return this.endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getFoundDate() {
		return this.foundDate;
	}

	public void setFoundDate(Date foundDate) {
		this.foundDate = foundDate;
	}

}