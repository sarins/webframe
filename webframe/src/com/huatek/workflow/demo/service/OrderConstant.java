package com.huatek.workflow.demo.service;

/**
 * 订单常量类.
 *
 * @author leon_zhang
 *
 */
public interface OrderConstant {

/*=====================================================*/
/*订单类型*/
/*=====================================================*/
	/**
	 * 订单类型B.
	 */
	String ORDER_TYPE_PROPERTY_B = "B";
	/**
	 * 订单类型C.
	 */
	String ORDER_TYPE_PROPERTY_C = "C";
	/**
	 * 零售订单获取编号的key.
	 */
	String GENERATE_NUMBER_LS = "LS";
	/**
	 * 批发订单获取编号的key.
	 */
	String GENERATE_NUMBER_PL = "PL";
	/**
	 * 客户订单获取编号的key.
	 */
	String GENERATE_NUMBER_KH = "KH";
	/**
	 * 业务订单获取编号的key.
	 */
	String GENERATE_NUMBER_YW = "YW";

	/**
	 * 销售订单取消单号.
	 */
	String GENERATE_NUMBER_OC = "OC";
	/**
	 * 采购订单取消单号.
	 */
	String GENERATE_NUMBER_CC = "CC";
	/**
	 * 物流单取消单号.
	 */
	String GENERATE_NUMBER_LC = "LC";
	/**
	 * 出库计划单取消单号.
	 */
	String GENERATE_NUMBER_PC = "PC";
	/**
	 * 入库计划单取消单号.
	 */
	String GENERATE_NUMBER_RC = "RC";
	/**
	 * 电购销售订单.
	 */
	String PL009 = "pl009";
	/**
	 * 货权转移账期发货销售订单.
	 */
	String PL008 = "pl008";
	/**
	 * 货权转移款到发货销售订单.
	 */
	String PL007 = "pl007";
	/**
	 * 批量现款现货销售订单.
	 */
	String PL006 = "pl006";
	/**
	 * 批量代运营销售订单.
	 */
	String PL005 = "pl005";
	/**
	 * 批量款到发货销售订单.
	 */
	String PL004 = "pl004";
	/**
	 * 批量样机单（样机信用）.
	 */
	String PL003 = "pl003";
	/**
	 * 批量账期发货销售订单.
	 */
	String PL002 = "pl002";
	/**
	 * 批量代发货销售订单.
	 */
	String PL001 = "pl001";


	/**
	 * 零售现款现货销售订单.
	 */
	String LS008 = "ls008";
	/**
	 * 零售代运营销售订单.
	 */
	String LS007 = "ls007";
	/**
	 * 活动尾款订单.
	 */
	String LS006 = "ls006";

	/**
	 * 活动订金订单.
	 */
	String LS005 = "ls005";

	/**
	 * 零售款到发货销售订单.
	 */
	String LS004 = "ls004";

	/**
	 * 零售账期发货销售订单.
	 */
	String LS003 = "ls003";

	/**
	 * 零售货到付款销售订单.
	 */
	String LS002 = "ls002";

	/**
	 * 零售代发货销售订单.
	 */
	String LS001 = "ls001";

/*=====================================================*/
/*需求单状态*/
/*=====================================================*/
	/**
	 * 需求单处理状态：部分确认.
	 */
	String ORDER_STATUS_CONFIRM_PART = "CONFIRM_PART";
	/**
	 * 需求单处理状态：全部确认.
	 */
	String ORDER_STATUS_CONFIRM_ALL = "CONFIRM_ALL";

	/**
	 * 需求单处理状态：关闭.
	 */
	String ORDER_STATUS_CLOSE = "CLOSE";
/*=====================================================*/
/*订单状态*/
/*=====================================================*/
	/**
	 * 订单处理状态：无
	 */
	String ORDER_STATUS_NONE = "NONE";
	/**
	 * 订单处理状态：1编辑中.
	 */
	String ORDER_STATUS_EDIT = "EDITING";
	/**
	 * 订单处理状态：2待确认.(需求单也用).
	 */
	String ORDER_STATUS_TO_CONFIRM = "TO_CONFIRM";
	/**
	 * 订单处理状态：3待审核.a
	 */
	String ORDER_STATUS_TO_AUDIT = "TO_AUDIT";
	/**
	 * 订单处理状态：4待安排发货.a
	 */
	String ORDER_STATUS_TO_SHIPMENTS = "TO_DELIVER";
	/**
	 * 订单处理状态：5全部安排.a
	 */
	String ORDER_STATUS_TO_SHIPMENTS_ALL = "DELIVER_ALL";
	/**
	 * 订单处理状态：6部分安排.a
	 */
	String ORDER_STATUS_TO_SHIPMENTS_PART = "DELIVER_PART";
	/**
	 * 订单处理状态：取消.
	 */
	String ORDER_STATUS_CANCELED = "CANCELED";
	/**
	 * 订单处理状态：编辑中删除(作废).
	 */
	String ORDER_STATUS_DELETED = "DELETED";
	/**
	 * 发货安排：未预分配.
	 */
	String PRE_DISTRIBUTION_NO = "PRE_DISTRIBUTION_NO";
	/**
	 * 发货安排：已预分配.
	 */
	String PRE_DISTRIBUTION_YES = "PRE_DISTRIBUTION_YES";
	/**
	 * 发货安排：预分配失败.
	 */
	String PRE_DISTRIBUTION_FAILURE = "PRE_DISTRIBUTION_FAILURE";

	/**
	 * 订金类订单审核通过状态：已审核.a
	 */
	String DEPOSIT_ORDER_AUDITED = "AUDITED";
/*=====================================================*/
/*财审状态状态*/
/*=====================================================*/
	/**
	 * 财务审核：1未审核.
	 */
	String FINANCE_AUDIT_NO = "FINANCE_AUDIT_NO";
	/**
	 * 财务审核：2审核通过.
	 */
	String FINANCE_AUDIT_YES = "FINANCE_AUDIT_YES";
	/**
	 * 财务审核：3审核驳回.
	 */
	String FINANCE_AUDIT_REJECT = "FINANCE_AUDIT_REJECT";

/*=====================================================*/
/*支付状态*/
/*=====================================================*/
	/**
	 * 支付状态：1未支付.
	 */
	String PAYMENT_STATUS_NO = "PAIDE_NO";
	/**
	 * 支付状态：2已支付.
	 */
	String PAYMENT_STATUS_YES = "PAYED";
	/**
	 * 支付状态：2已付定金.
	 */
	String PAYMENT_DEPOSIT = "DEPOSIT";

/*=====================================================*/
/*收款状态*/
/*=====================================================*/
	/**
	 * 收款状态：1未核销.
	 */
	String RECEIPT_STATUS_NONE = "VERIFICATION_NO";
	/**
	 * 收款状态：2部分核销.
	 */
	String RECEIPT_STATUS_PART = "VERIFICATION_PART";
	/**
	 * 收款状态：3整单核销.
	 */
	String RECEIPT_STATUS_ALL = "VERIFICATION_ALL";

	/***
	 * 收款状态 :4取消核销.
	 */
	String RECEIPT_STATUS_CANCEL = "VERIFICATION_CALL_OFF";

/*=====================================================*/
/*逆向状态*/
/*=====================================================*/
	/**
	 * 逆向状态(来源节点)：无.
	 */
	String REVERSE_STATUS_NONE = "NONE";
	/**
	 * 逆向状态(来源节点)：确认退回.
	 */
	String REVERSE_STATUS_CONFIRM_REJECT = "CONFIRM_RETURNED";
	/**
	 * 逆向状态(来源节点)：计划退回.
	 */
	String REVERSE_STATUS_PLAN_REJECT = "PLAN_RETURNED";

	/**
	 * 逆向状态(来源节点)：直发单财务审核驳回.
	 */
	String REVERSE_STATUS_STRAIGHT_SEND_FINANCE_REJECT = "STRAIGHT_SEND_FINANCE_RETURNED";

	//其余来源节点见物流单常量配置  LogisticsConstant

/*=====================================================*/
/*异常状态*/
/*=====================================================*/
	/**
	 * 异常状态：无异常状态
	 */
	String EXCEPTION_STATUS_GOODSLACK_NONE = "NONE";
	/**
	 * 异常状态：缺货
	 */
	String EXCEPTION_STATUS_GOODSLACK = "EXCEP_GOODSLACK";


/*=====================================================*/
/*开票状态*/
/*=====================================================*/

	/**
	 * 开票状态：1未开票.
	 */
	String INVOICE_STATUS_NONE = "INVOICE_NONE";
	/**
	 * 开票状态：2部分开票.
	 */
	String INVOICE_STATUS_PART = "INVOICE_PART";
	/**
	 * 开票状态：3已开票.
	 */
	String INVOICE_STATUS_ALL = "INVOICE_ALL";

/*=====================================================*/
/*是否有收款记录*/
/*=====================================================*/
	/**
	 * 是否有收款记录：1是.
	 */
	String HAS_RECEIPT_RECORD_YES = "YES";
	/**
	 * 是否有收款记录：2否.
	 */
	String HAS_RECEIPT_RECORD_NO = "NO";

/*=====================================================*/
/*开单方式*/
/*=====================================================*/
	/**
	 * 开单方式 ESB.
	 */
	String CREATE_MODE_ESB = "1";
	/**
	 * 开单方式 手工.
	 */
	String CREATE_MODE_MANNEL = "2";
	/**
	 * 开单方式 EXCEL.
	 */
	String CREATE_MODE_EXCEL = "3";
	/**
     * 开单方式 BUSINESS.
     */
    String CREATE_MODE_BUSINESS = "4";

/*=====================================================*/
/*退换货状态*/
/*=====================================================*/
	/**
	 * 退换货状态：1NONE无状态.
	 */
	String RETURNED_STATUS_NONE = "NONE";
	/**
	 * 退换货状态：2申请部分退款.
	 */
	String RETURNED_STATUS_APPLY_PART_REFUND = "APPLY_PART_REFUND";
	/**
	 * 退换货状态：3申请退款.
	 */
	String RETURNED_STATUS_APPLY_REFUND = "APPLY_REFUND";
	/**
	 * 退换货状态：4退换货中.
	 */
	String RETURNED_STATUS_REFUNDING = "REFUNDING";
	/**
	 * 退换货状态：5退款完成.
	 */
	String RETURNED_STATUS_REFUNDED = "REFUNDED";
/*=====================================================*/
/*虚拟商品处理状态*/
/*=====================================================*/
	/**
	 * 处理状态：未处理.
	 */
	String DEAL_STATUS_NO = "TO_DEAL";
	/**
	 * 处理状态：已处理.
	 */
	String DEAL_STATUS_YES = "DEALED";
	/*=====================================================*/
	/*订金类订单处理状态*/
	/*=====================================================*/
		/**
		 * 处理状态：未处理.
		 */
		String DEPOSIT_DEAL_STATUS_NO = "TO_DEAL";
		/**
		 * 处理状态：已处理.
		 */
		String DEPOSIT_DEAL_STATUS_YES = "DEALED";
		/**
		 * 处理状态：尾款异常.
		 */
		String BALANCE_REF_DEPOSIT = "DEAL_EXCEPTION";
/*=====================================================*/
/*日志操作名称*/
/*=====================================================*/
	/**
	 * 新增保存.
	 */
	String LOG_NEW_ADD_SAVE = "新增零售订单保存";
	/**
	 * 修改保存.
	 */
	String LOG_NEW_ADD_EDIT_SAVE = "新增零售订单修改保存";
	/**
	 * 新增提交.
	 */
	String LOG_NEW_ADD_SUBMIT = "新增零售订单提交";

	/**
	 * 新增批量提交.
	 */
	String LOG_NEW_ADD_BATCH_SUBMIT = "新增零售订单批量提交";
	/**
	 * 新增提交并确认.
	 */
	String LOG_NEW_ADD_SUBMIT_AND_CONFIRM = "新增零售订单提交并确认";
	/**
	 * ESB修改确认.
	 */
	String LOG_NEW_ADD_ESB_CONFIRM = "ESB零售订单修改确认";
	/**
	 * 新增批量提交并确认.
	 */
	String LOG_NEW_ADD_BATCH_SUBMIT_AND_CONFIRM = "新增零售订单批量提交并确认";
	/**
	 * ESB批量确认.
	 */
	String LOG_NEW_ADD_BATCH_ESB_CONFIRM = "ESB零售订单批量确认";

	/**
	 * 新增零售订单确认.
	 */
	String LOG_NEW_ADD_CONFIRM = "新增零售订单确认";

	/**
	 * 新增零售订单批量确认.
	 */
	String LOG_NEW_ADD_BATCH_CONFIRM = "新增零售订单批量确认";

	/**
	 * 待确认零售单驳回.
	 */
	String LOG_TO_CONFIRM_ORDER_REJECT = "待确认零售单驳回";
	/**
	 * 预分配失败零售订单再确认.
	 */
	String LOG_TO_CONFIRM_ORDER_CONFIRM_AGAIN = "预分配失败零售订单再确认";
	/**
	 * 预分配失败零售订单批量再确认.
	 */
	String LOG_TO_CONFIRM_ORDER_BATCH_CONFIRM_AGAIN = "预分配失败零售订单批量再确认";
	/**
	 * 异常尾款订单修改为非尾款并确认到待审核.
	 */
	String LOG_EXCEPTION_ORDER_BATCH_CONFIRM_AGAIN = "异常尾款订单修改为非尾款并确认";

	/**
	 * 新增零售单取消.
	 */
	String LOG_NEW_ADD_CANCEL = "新增零售单取消";
	/**
	 * 新增零售单取消.
	 */
	String LOG_NEW_ADD_DELETE = "编辑中零售单作废";
	/**
	 * 异常零售单保存.
	 */
	String LOG_EXCEPTION_SAVE = "异常零售单保存";
	/**
	 * 异常零售单转计划处理.
	 */
	String LOG_EXCEPTION_TOPLAN_PROCESS = "异常零售单转计划处理";

	/**
	 * 异常零售单转销售处理.
	 */
	String LOG_EXCEPTION_TOSALES_PROCESS = "异常零售单转销售处理";

	/**
	 * 异常零售单申请退款.
	 */
	String LOG_EXCEPTION_APPLY_REFUND = "异常零售单申请退款";
	/**
	 * 零售单申请退款.
	 */
	String APPLY_REFUND_CONFIRM = "零售单退返申请确认";
	/**
	 * 零售单取消申请退款.
	 */
	String APPLY_REFUND_CANCEL = "零售单申请退款取消";

	/**
	 * 修改地址.
	 */
	String UPDATE_ADDRESS = "修改地址";
	/**
	 * 系统自动执行.
	 */
	String LOG_ORDER_SYS_AUTO_EXE = "系统自动执行";
	/**
	 * 零售订单审核_批准.
	 */
	String LOG_ORDER_CONFIRM = "财务批准";
	/**
	 * 零售订单审核_驳回.
	 */
	String LOG_ORDER_REJECT = "财务驳回";

	/**
	 * 零售订单审核_取消.
	 */
	String LOG_ORDER_CANCEL = "财务审核取消";

	/**
	 * 批量安排发货订单_批量驳回.
	 */
	String LOG_ORDER_BATCH_ARRANGE_BATCH_REJECT = "批量安排发货订单_批量驳回";

	/**
	 * 手工安排处理登记.
	 */
	String LOG_ORDER_MANUAL_ARRANGE_REGISTER = "手工安排处理登记";

	/**
	 * 手工安排驳回.
	 */
	String LOG_ORDER_MANUAL_ARRANGE_REJECT = "手工安排驳回";

	/**
	 * 手工安排发货_提交.
	 */
	String LOG_ORDER_MANUAL_ARRANGE_SUBMIT = "手工安排提交";

	/**
	 * 手工安排发货_保存.
	 */
	String LOG_ORDER_MANUAL_ARRANGE_SAVE = "手工安排保存";

	/*
	 * 发票申请作废
	 * */
    String LOG_ORDER_MANUAL_APPLY_SET="发票申请作废";

    /*
     * 发票确认作废
     * */
    String LOG_ORDER_MANUAL_VALIDATE_SET="发票确认作废";
	/**
	 * 手工安排发货_暂存提交.
	 */
	String LOG_ORDER_MANUAL_ARRANGE_SAVESUBMIT = "手工安排暂存提交";

	/**
	 * 零售单取消申请退款.
	 */
	String ESB_APPLY_REFUND = "ESB零售单申请退款";

	/**
	 * 缺货.
	 */
	String LOG_ORDER_MANUAL_ARRANGE_NO_ENOUGH_GOODS = "缺货";

	/**
	 * 需求单确认自动生成订单.
	 */
	String LOG_CONFIRM_REQUESTORDER_AUTO_CREATE_ORDER = "需求单确认自动生成订单";

	/**
	 * 需求单确认自动生成订单.
	 */
	String LOG_CONFIRM_ORDER_AUTO_CREATE_LOGISTICSORDER = "批发单提交并确认";

	/**
	 * 被驳回的销售单确认处理生成物流单.
	 */
	String LOG_REQUESTORDER_REJECTAFTERCOMFIRM = "被驳回的销售单安排发货生成物流单";

	/**
	 * 直发单财务审核驳回.
	 */
	String LOG_STRAIGHT_SEND_FINANCE_REJECT = "直发单财务审核驳回";

	/**
	 * 直发单财务审核驳回.
	 */
	String LOG_SALES_REF_LOGIS_REJECT = "零售单对应物流单审核驳回";

	/**
	 * 新增订单明细商品.
	 */
	String LOG_ADD_DETAIL_PRD = "订单明细增加商品";
	/**
	 * 复制订单明细商品.
	 */
	String LOG_COPY_DETAIL_PRD = "订单明细复制添加";
	/**
	 * 删除订单明细商品.
	 */
	String LOG_DELETE_DETAIL_PRD = "订单明细删除";

	/**
	 * 订单明细修改.
	 */
	String LOG_EDIT_DETAIL_PRD = "订单明细修改";
	/**
	 * 订单明细修改.
	 */
	String LOG_COFIRM_NEW_DELETE = "ESB待确认零售作废";
	/**
	 * 零售单手工发票
	 */
	String LOG_SAVE_INVOICE = "订单手工生成发票";
	/**
	 * 零售单批量生成发票
	 */
	String LOG_BATCH_SAVE_INVOICE = "订单批量生成发票";
	/**
	 * 零售单批量生成发票
	 */
	String LOG_ADD_GENERATE_GIFT_ORDER = "订单生成赠品单据";


/*=====================================================*/
/*批发单日志操作名称*/
/*=====================================================*/
	/**
	 * 批发单新增.
	 */
	String LOG_B_ORDER_SAVE = "批发单新增保存";
	/**
	 * 批发单新增.
	 */
	String LOG_B_ORDER_EIDT = "批发单修改保存";

	/**
	 * 批发销售订单审核.
	 */
	String LOG_B_ORDER_CONFIRM = "批发销售单审核驳回";
	/**
	 * 批发销售订单审核_取消.
	 */
	String LOG_B_ORDER_CANCEL = "批发销售单财务审核取消";


/*=====================================================*/
/*价格异常状态*/
/*=====================================================*/

	/**
	 * 价格异常.
	 */
	String ABNORMAL_PRICE = "1";

	/**
	 * 价格正常.
	 */
	String NORMAL_PRICE = "0";
/*=====================================================*/
/*需求单日志操作名称*/
/*=====================================================*/
	/**
	 * 新增保存.
	 */
	String LOG_RES_ADD_SAVE = "新增需求单保存";
	/**
	 * 修改保存.
	 */
	String LOG_RES_ADD_EDIT_SAVE = "新增需求单修改保存";

	/**
	 * 新增提交.
	 */
	String LOG_RES_ADD_SUBMIT = "新增需求单提交";

	/**
	 * 新增批量提交.
	 */
	String LOG_RES_ADD_BATCH_SUBMIT = "新增需求单批量提交";
	/**
	 * 作废.
	 */
	String LOG_RES_DELETE = "作废";
	/**
	 * 关闭.
	 */
	String LOG_RES_SHUTDOWN = "关闭";
	/**
	 * 关闭.
	 */
	String LOG_RES_AUDIT_REJECT = "审核驳回";
	/**
	 * 关闭.
	 */
	String LOG_RES_CONFIRM = "安排发货";


}
