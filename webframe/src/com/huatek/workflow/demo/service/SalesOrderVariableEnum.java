package com.huatek.workflow.demo.service;

public enum SalesOrderVariableEnum {

	/**
	 * 保存
	 */
	Edit_Save(0),
	/**
	 * 提交
	 */
	Edit_Submit(1),
	/**
	 * 提交并确认
	 */
	Edit_SubmitAndConfirm(2),
	/**
	 * 取消
	 */
	Edit_Cancel(3),
	/**
	/**
	 * 确认成功
	 */
	Confirm_Success(4),
	/**
	 * 确认驳回
	 */
	Confirm_Reject(5),
	/**
	 * 财务审核成功
	 */
	Finacail_Audit_Success(6),
	/**
	 * 财务审核失败
	 */
	Finacail_Audit_Failure(7),
	/**
	 * 财务审核失败(ESB已付款订单驳回)
	 */
	Finacail_Audit_FailureESB(8),
	/**
	 * 财务审核取消审核
	 */
	Finacail_Audit_Cancle(9),
	/**
	 * 安排发货部分安排
	 */
	Deliver_Part(10),
	/**
	 * 安排发货全部安排
	 */
	Deliver_All(11),

	/**
	 * 安排发货驳回
	 */
	Deliver_Reject(12),
	/**
	 * 安排发货驳回(ESB已付款订单驳回)
	 */
	Deliver_RejectESB(13),

	/**
	 * 部分安排发货   部分取消    到   部分安排发货
	 */
	DeliveredPart_Reject_Part(14),
	/**
	 * 部分安排发货  取消全部    到   待安排发货
	 */
	DeliveredPart_Reject_ALL(15),
	/**
	 * 全部安排     取消部分     到     部分安排发货
	 */
	Deliver_All_Reject_Part(16),
	/**
	 * 全部安排     取消全部      到    待安排发货
	 */
	Deliver_All_Reject_ALL(17),

	/**
	 * 订金类订单审核通过
	 */
	DEPOSIT_ORDER_Audit(18);

	/**
	 * 字典code
	 */
	private int code;

	SalesOrderVariableEnum(int code){
		this.code = code;
	}

	public int getCode() {
		return code;
	}
}
