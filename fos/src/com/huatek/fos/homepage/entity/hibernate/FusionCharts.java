/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-31 上午11:23:58
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.homepage.entity.hibernate;

import com.huatek.base.entity.BaseEntity;

/**
 * 
 * @author: apple_liu
 * 
 * @version $Id: FusionCharts.java, v 0.1 2013-5-31 上午11:23:58 $
 * 
 *          Comment: 请添加对类的描述
 */
public class FusionCharts extends BaseEntity implements java.io.Serializable {

	/**
	 * 序列化.
	 */
	private static final long serialVersionUID = -150493286686423392L;
	/**
	 * 图标展示名.
	 */
	private String titleName;
	/**
	 * 数据库表名.
	 */
	private String tableName;
	/**
	 * 指定表中要统计的列1.
	 */
	private String columnName1;
	/**
	 * 指定表中要统计的列2.
	 */
	private String columnName2;
	/**
	 * 指定坐标轴的x坐标名称.
	 */
	private String xName;
	/**
	 * 指定坐标轴的y坐标名称.
	 */
	private String yName;
	/**
	 * 指定计量单位名称.
	 */
	private String numberPrefix;
	/**
	 * 指定
	 */
	private String seriesName;

	public String getSeriesName() {
		return seriesName;
	}

	public void setSeriesName(String seriesName) {
		this.seriesName = seriesName;
	}

	public String getNumberPrefix() {
		return numberPrefix;
	}

	public void setNumberPrefix(String numberPrefix) {
		this.numberPrefix = numberPrefix;
	}

	public String getTitleName() {
		return titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getColumnName1() {
		return columnName1;
	}

	public void setColumnName1(String columnName1) {
		this.columnName1 = columnName1;
	}

	public String getColumnName2() {
		return columnName2;
	}

	public void setColumnName2(String columnName2) {
		this.columnName2 = columnName2;
	}

	public String getxName() {
		return xName;
	}

	public void setxName(String xName) {
		this.xName = xName;
	}

	public String getyName() {
		return yName;
	}

	public void setyName(String yName) {
		this.yName = yName;
	}

}
