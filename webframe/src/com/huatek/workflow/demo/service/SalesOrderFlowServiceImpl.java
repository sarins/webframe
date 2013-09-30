package com.huatek.workflow.demo.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.util.Constant;
import com.huatek.workflow.demo.entity.DemoEntity;
import com.huatek.workflow.entity.NodeEntity;
import com.huatek.workflow.entity.TransferEntity;
import com.huatek.workflow.service.AbstractWorkflow;
import com.huatek.workflow.service.BaseWorkflowService;
import com.huatek.workflow.service.TransferExpressService;

public class SalesOrderFlowServiceImpl extends AbstractWorkflow implements
			BaseWorkflowService<DemoEntity> {


	DemoService demoService;

	protected HibernateTemplate hibernateTemplate;

	public  static final NodeEntity START_NODE = new NodeEntity(START_NODE_ID,"开始");
	public  static final NodeEntity END_NODE = new NodeEntity(END_NODE_ID,"结束");
	//订单处理状态：编辑中.
	public static final NodeEntity EDITING = new NodeEntity(OrderConstant.ORDER_STATUS_EDIT);
	//订单处理状态：编辑中取消.
	public static final NodeEntity CANCELED = new NodeEntity(OrderConstant.ORDER_STATUS_CANCELED);
	//订单处理状态：待确认.
	public static final NodeEntity TO_COMFIRM = new NodeEntity(OrderConstant.ORDER_STATUS_TO_CONFIRM);
	//订单处理状态：待审核.
	public static final NodeEntity TO_AUDIT = new NodeEntity(OrderConstant.ORDER_STATUS_TO_AUDIT);
	//订单处理状态：待安排发货.
	public static final NodeEntity TO_DELIVER = new NodeEntity(OrderConstant.ORDER_STATUS_TO_SHIPMENTS);
	//订单处理状态：部分安排发货.
	public static final NodeEntity DELIVERIED_PART = new NodeEntity(OrderConstant.ORDER_STATUS_TO_SHIPMENTS_PART);
	//订单处理状态：全部安排发货.
	public static final NodeEntity DELIVERIED_ALL = new NodeEntity(OrderConstant.ORDER_STATUS_TO_SHIPMENTS_ALL);

	//订金类订单审核通过状态：已审核.
	public static final NodeEntity AUDIT = new NodeEntity(OrderConstant.DEPOSIT_ORDER_AUDITED);


	public SalesOrderFlowServiceImpl() {
		// 把流程节点加入MAP中
		NODE_MAP.put(START_NODE.getId(), START_NODE);
		NODE_MAP.put(EDITING.getId(), EDITING);
		NODE_MAP.put(CANCELED.getId(), CANCELED);
		NODE_MAP.put(TO_COMFIRM.getId(), TO_COMFIRM);
		NODE_MAP.put(TO_AUDIT.getId(), TO_AUDIT);
		NODE_MAP.put(AUDIT.getId(), AUDIT);
		NODE_MAP.put(TO_DELIVER.getId(), TO_DELIVER);
		NODE_MAP.put(DELIVERIED_PART.getId(), DELIVERIED_PART);
		NODE_MAP.put(DELIVERIED_ALL.getId(), DELIVERIED_ALL);
		NODE_MAP.put(END_NODE.getId(), END_NODE);

		// 设置流程节点之间的关系
		if(START_NODE.getTransferList().size()>0){
			return;
		}
		// 开始节点之后到编辑中
		START_NODE.addTransferEntity(new TransferEntity(EDITING));
		// 编辑中保存之后到编辑中
		EDITING.addTransferEntity(new TransferEntity(EDITING,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Edit_Save) != null;
					}
				}));
		// 编辑中提交之后到待确认
		EDITING.addTransferEntity(new TransferEntity(TO_COMFIRM,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Edit_Submit) != null;
					}

				}));
		// 编辑中提交并确认之后到待审核
		EDITING.addTransferEntity(new TransferEntity(TO_AUDIT,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Edit_SubmitAndConfirm) != null;
					}

				}));
		// 编辑中提交并确认之后到待审核
		EDITING.addTransferEntity(new TransferEntity(CANCELED,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Edit_Cancel) != null;
					}

				}));
		// 确认之后到待财务审核
		TO_COMFIRM.addTransferEntity(new TransferEntity(TO_AUDIT,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Confirm_Success) != null;
					}

				}));
		// 确认驳回之后到编辑中
		TO_COMFIRM.addTransferEntity(new TransferEntity(EDITING,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Confirm_Reject) != null;
					}

				}));
		// 财务审核通过到待安排发货
		TO_AUDIT.addTransferEntity(new TransferEntity(TO_DELIVER,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Finacail_Audit_Success) != null;
					}

				}));
		// 财务审核驳回到编辑中
		TO_AUDIT.addTransferEntity(new TransferEntity(EDITING,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Finacail_Audit_Failure) != null;
					}

				}));
		//(ESB订单驳回)财务审核驳回到待确认
		TO_AUDIT.addTransferEntity(new TransferEntity(TO_COMFIRM,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Finacail_Audit_FailureESB) != null;
					}

				}));
		//订金类订单财务审核通过到已审核
		TO_AUDIT.addTransferEntity(new TransferEntity(AUDIT,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.DEPOSIT_ORDER_Audit) != null;
					}

				}));
		//订金类已审核点取消审核到待审核
		AUDIT.addTransferEntity(new TransferEntity(TO_AUDIT,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Finacail_Audit_Cancle) != null;
					}

				}));
		//待安排发货点取消审核到待审核
		TO_DELIVER.addTransferEntity(new TransferEntity(TO_AUDIT,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Finacail_Audit_Cancle) != null;
					}

				}));
		// 待安排发货到部分安排
		TO_DELIVER.addTransferEntity(new TransferEntity(DELIVERIED_PART,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Deliver_Part) != null;
					}

				}));
		// 部分安排发货到部分安排
		DELIVERIED_PART.addTransferEntity(new TransferEntity(DELIVERIED_PART,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Deliver_Part) != null;
					}

				}));

		// 部分安排发货到全部安排
		DELIVERIED_PART.addTransferEntity(new TransferEntity(DELIVERIED_ALL,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Deliver_All) != null;
					}
				}));


		// 待安排发货到全部安排
		TO_DELIVER.addTransferEntity(new TransferEntity(DELIVERIED_ALL,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Deliver_All) != null;
					}

				}));
		// 待安排发货驳回到编辑中
		TO_DELIVER.addTransferEntity(new TransferEntity(EDITING,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Deliver_Reject) != null;
					}

				}));
		// (ESB订单驳回)待安排发货驳回到待确认
		TO_DELIVER.addTransferEntity(new TransferEntity(TO_COMFIRM,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Deliver_RejectESB) != null;
					}

				}));
		// 待安排发货取消审核到待审核
		TO_DELIVER.addTransferEntity(new TransferEntity(TO_AUDIT,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.Finacail_Audit_Cancle) != null;
					}
				}));
		// 部分安排发货   部分取消    到   部分安排发货
		DELIVERIED_PART.addTransferEntity(new TransferEntity(DELIVERIED_PART,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap
								.get(SalesOrderVariableEnum.DeliveredPart_Reject_Part) != null;
					}
				}));
		// 部分安排发货  取消全部    到   待安排发货
		DELIVERIED_PART.addTransferEntity(new TransferEntity(TO_DELIVER,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap.get(SalesOrderVariableEnum.DeliveredPart_Reject_ALL) != null;
					}
				}));
		// 全部安排     取消部分     到     部分安排发货
		DELIVERIED_ALL.addTransferEntity(new TransferEntity(DELIVERIED_PART,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap.get(SalesOrderVariableEnum.Deliver_All_Reject_Part) != null;
					}
				}));
		// 全部安排     取消全部      到    待安排发货
		DELIVERIED_ALL.addTransferEntity(new TransferEntity(TO_DELIVER,
				new TransferExpressService() {
					public boolean isMatch(
							Map<Object, Object> variableMap) {
						return variableMap.get(SalesOrderVariableEnum.Deliver_All_Reject_ALL) != null;
					}
				}));
	}

	public void transfer(NodeEntity currentNode, DemoEntity flowInstance)
			throws SQLException {
//		if(flowInstance.getId()!=null && salesLockOrderStatus(flowInstance.getId(),currentNode.getId())<0){
//			throw new BusinessRuntimeException("流程节点错误：该订单已经被处理了。");
//		}
		if (flowInstance.getId() != null) {
			//锁定记录
			String holdStatus = demoService.getObjectByIdLock(DemoEntity.class, flowInstance.getId(), "holdStatus");
			//如果已经冻结则抛出异常
			if (Constant.STATUS_ACTIVE.equals(holdStatus)) {
				throw new BusinessRuntimeException("该订单已经被冻结,请刷新或返回页面。");
			}
			//如果当前状态已改变
			String orderStatus = demoService.getObjectByIdLock(DemoEntity.class, flowInstance.getId(), "orderStatus");
			if (!currentNode.getId().equals(orderStatus)) {
				throw new BusinessRuntimeException("该订单已经被其它流程节点处理了,请刷新或返回页面。");
			}
		}
		NodeEntity nextNode = super.getNextNode(flowInstance, currentNode.getId());
		flowInstance.setOrderStatus(nextNode.getId());
	}

	public DemoService getDemoService() {
		return demoService;
	}

	public void setDemoService(DemoService demoService) {
		this.demoService = demoService;
	}

}
