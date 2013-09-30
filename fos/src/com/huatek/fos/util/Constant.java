/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-21 下午06:24:21
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.util;

/**
 * 
 * @author: apple_liu
 * 
 * @version $Id: Constant.java, v 0.1 2013-5-21 下午06:24:21 $
 * 
 *          Comment: 常量类
 */
public interface Constant {

	/**
	 * 浮点型验证正则表达式.非负
	 */
	String REGULAR_EXPRESSION_FLOAT_HAS0 = "^\\d+(\\.\\d+)?$";
	// 金额大于0的正则表达式
	String REGULAR_EXPRESSION_FLOAT_MONEY = "^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){1,2})?$";
	/**
	 * 正整数的正则表达式.
	 */
	String REGULAR_EXPRESSION_INTEGER = "^[0-9]*[1-9][0-9]*$";
	/**
	 * 资金来源滚动计划表（报表名称）.
	 */
	String FUNDS_ORI_REPORT_NAME = "资金来源滚动计划表";
	/**
	 * 资金运用滚动计划表（报表名称）.
	 */
	String FUNDS_USE_REPORT_NAME = "资金运用滚动计划表";

	/**
	 * 资金来源滚动计划汇总表（汇总报表名称）
	 */
	String FUNDS_ORI_GATHER_REPORT_NAME = "资金来源滚动计划汇总表";
	/**
	 * 资金运用滚动计划汇总表（汇总报表名称）
	 */
	String FUNDS_USE_GATHER_REPORT_NAME = "资金运用滚动计划汇总表";
	/**
	 * 资金计划与平衡分析报表（汇总报表名称）
	 */
	String FUNDS_BALANCE_GATHER_REPORT_NAME = "资金计划与平衡分析报表";

	/**
	 * 报表编制状态 1 已完成.
	 */
	String FOR_STATE_FINISH = "1";
	/**
	 * 报表编制状态 0 未完成.
	 */
	String FOR_STATE_NOT_FINISH = "0";
	/**
	 * 报表导出后，资金运用数据是否可以再次被修改，1：是.
	 */
	final String MODIFY_FUNDS_YES = "1";
	/**
	 * 报表导出后，资金运用数据是否可以再次被修改，0：否.
	 */
	final String MODIFY_FUNDS_NO = "0";

	/**
	 * 数据来源 1代表资金来源(RIO).
	 */
	final String DATA_SOURCES_FUNDS_RIO = "1";
	/**
	 * 数据来源 2代表资金运用(APPLY).
	 */
	final String DATA_SOURCES_FUNDS_APPLY = "2";
	/**
	 * 数据来源 3代表创投资金(CHUANGTOU).
	 */
	final String DATA_SOURCES_FUNDS_CHUANGTOU = "3";
	/**
	 * 数据来源 4代表平衡分析汇总（BALANCE）
	 */
	final String DATA_SOURCES_FUNDS_BALANCE = "4";

	/**
	 * 编制状态 0:未完成.
	 */
	final String FORMATION_STATE_NO = "0";
	/**
	 * 编制状态 1:已完成.
	 */
	final String FORMATION_STATE_YES = "1";

	/**
	 * 分管领导审核状态 0:未审核(NO).
	 */
	final String LEADER_AUDIT_STATE_NO = "0";
	/**
	 * 分管领导审核状态 1:已审核(YES).
	 */
	final String LEADER_AUDIT_STATE_YES = "1";
	/**
	 * 分管领导审核状态 2:驳回(REBUT).
	 */
	final String LEADER_AUDIT_STATE_REBUT = "2";

	/**
	 * 驳回原因记录表使用类型 1 集团内部.
	 */
	final String REJECT_RESEAON_USETYPE_ENTRUST = "1";
	/**
	 * 驳回原因记录表使用类型 2 委托贷款.
	 */
	final String REJECT_RESEAON_USETYPE_INTERIOR = "2";

	/**
	 * 资金来源滚动计划模块.
	 */
	final String FUNDS_ORIGIN_MOUDLE = "1";
	/**
	 * 资金运用滚动计划模块.
	 */
	final String FUNDS_APPLY_MOUDLE = "2";
	/**
	 * 融资管理模块.
	 */
	final String FINANCING_MOUDLE = "3";
	/**
	 * 集团内部借款模块.
	 */
	final String INTERIOR_LOAN_MOUDLE = "4";
	/**
	 * 担保管理模块.
	 */
	final String SECURITY_MOUDLE = "5";
	/**
	 * 创投信息模块.
	 */
	final String INVEST_MOUDLE = "6";
	/**
	 * 委托贷款模块.
	 */
	final String ENTRUST_LOAN_MOUDLE = "7";
	/**
	 * 融资模块付款日.
	 */
	String FINANCING_PAYMENT_DAY = "20";
	/**
	 * 融资模块信息类别，1代表融资.
	 */
	String FINANCING_INFO_CATEGORY = "1";
	/**
	 * 代表是最新数据.
	 */
	String FINANNCING_IS_NEWEST = "1";
	/**
	 * 代表是老数据.
	 */
	String FINANNCING_ISNOT_NEWEST = "0";
	/**
	 * 改变利率 1代表是.
	 */
	String IS_CHANGE_RATE_YES = "1";
	/**
	 * 改变利率 0代表否.
	 */
	String IS_CHANGE_RATE_NO = "0";
	/**
	 * 领导级别编码.
	 */
	String LEADER_CODE = "12";
	/**
	 * 员工级别编码.
	 */
	String EMPLOYEE_CODE = "11";

	/**
	 * 系统功能模块（数据字典Code定义）.
	 */
	String FOS_FUNCTION_MOUDLE = "fosFunctionMoudle";

	/**
	 * 还款周期 360.
	 */
	String REPAY_PERIOD_360 = "360";
	/**
	 * 还款周期 365.
	 */
	String REPAY_PERIOD_365 = "365";
	/**
	 * 报表所属类型 1：代表单部门.
	 */
	String REPORTS_USE_ONE = "1";
	/**
	 * 报表所属类型 2：代表5个部门总和
	 */
	String REPORTS_USE_TOTAL = "2";

	/**
	 * 生效/失效状态 A生效.
	 */
	String STATUS_VALID = "A";

	/**
	 * 生效/失效状态 D失效.
	 */
	String STATUS_INVALID = "D";

	/**
	 * 涉及汇总报表部门为1.
	 */
	String DEPARTMENT_GROUPTYPE = "1";
	/**
	 * 资产信息融资为1.
	 */
	String FINANCING = "1";
	/**
	 * 资产信息担保为0.
	 */
	String GUARANTEE = "0";
	/**
	 * 平衡汇总分析自有资金期初结转金额使用类型为1
	 */
	String INIT_SETTLEMENT_MONEY_OWN = "1";
	/**
	 * 平衡汇总分析财政专户期初结转金额使用类型为2
	 */
	String INIT_SETTLEMENT_MONEY_FINANCE = "2";
	/**
	 * 创投初结转金额使用类型为3
	 */
	String INIT_SETTLEMENT_MONEY_IVENTURE = "3";

	/**
	 * 创投资金收入类目编码 05
	 */
	String INCOME_FUND_CHUANGTOU = "05";
	/**
	 * 创投资金支出类目编码 06
	 */
	String PAY_FUND_CHUANGTOU = "06";
	/**
	 * 西安投资控股有限公司部门ID为2
	 */
	long PARENT_COMPANY_GROUP_ID = 2;
}
