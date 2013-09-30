/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-21 下午03:05:25
 * Author: allen_huang
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.orginnermanagement.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.fos.entrustloanmanagement.entity.hibernate.EntrustLoan;
import com.huatek.fos.orginnermanagement.entity.hibernate.InteriorLoan;
import com.huatek.fos.orginnermanagement.entity.hibernate.LoanReasonRecord;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;

/**
 * 
 * @author: allen_huang
 * 
 * 
 *          Comment: 集团内部借款服务实现类.
 */
public class InteriorLoanServiceImpl extends BaseServiceImpl implements
		InteriorLoanService {

	/**
	 * 获取当前集团内部借款分页数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 * @throws ParseException
	 */
	public CutPageBean getCurrAcctInteriorLoanPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount,
			Object[] params, boolean isExport) throws ParseException {
		// TODO Auto-generated method stub
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 获取查询条件
		Object startDate = params[0];
		Object endDate = params[1];
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果起始日期不为空
		if (startDate != null
				&& CommonUtil.isNotZeroLengthTrimString(startDate.toString())) {
			// 起息日期大于等于起始日期
			queryCondition.append(" and t.startRateDate >= ?");
			paramArrayList.add(FosUtil.getInitDate(startDate.toString()));
		}
		// 如果截至日期不为空
		if (endDate != null
				&& CommonUtil.isNotZeroLengthTrimString(endDate.toString())) {
			// 结息日期小于等于截至日期
			queryCondition.append(" and t.endRateDate <= ?");
			paramArrayList.add(FosUtil.getInitDate(endDate.toString()));
		}
		// 导出需要获取该日期下的所有审核通过的数据（不可编辑）
		if (isExport == true) {
			queryCondition.append(" and t.isModify =?");
			paramArrayList.add(Constant.MODIFY_FUNDS_NO);
		}
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id =?");
			paramArrayList.add(fwAccount.getFwGroup().getId());
		}
		String totalRowHsql = "select count(t) from InteriorLoan t where "
				+ queryCondition;
		String resultHsql = "from InteriorLoan t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultHsql, "order by t.id desc", paramArrayList.toArray(),
				pageBean, parameterList);

	}

	/**
	 * 获取当前集团内部借款分页数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 * @throws ParseException
	 */
	public CutPageBean getInteriorLoanPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount, Object[] params)
			throws ParseException {
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 获取查询条件
		Object startDate = params[0];
		Object endDate = params[1];
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果起始日期不为空
		if (startDate != null
				&& CommonUtil.isNotZeroLengthTrimString(startDate.toString())) {
			// 起息日期大于等于起始日期
			queryCondition.append(" and t.startRateDate >= ?");
			paramArrayList.add(FosUtil.getInitDate(startDate.toString()));
		}
		// 如果截至日期不为空
		if (endDate != null
				&& CommonUtil.isNotZeroLengthTrimString(endDate.toString())) {
			// 结息日期小于等于截至日期
			queryCondition.append(" and t.endRateDate <= ?");
			paramArrayList.add(FosUtil.getInitDate(endDate.toString()));
		}
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(fwAccount.getFwGroup().getId());
		}
		String totalRowHsql = "select count(t) from InteriorLoan t where "
				+ queryCondition
				+ " and t.forState = 0 and t.leaderAuditState <> 1 ";
		String resultRowHsql = "from InteriorLoan t where " + queryCondition
				+ " and t.forState = 0 and t.leaderAuditState <> 1  ";
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultRowHsql, "order by t.id desc", paramArrayList.toArray(),
				pageBean, parameterList);
	}

	/**
	 * 获取当前集团内部借款审核数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 * @throws ParseException
	 */
	public CutPageBean getInteriorAuditPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount, Object[] params)
			throws ParseException {
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 获取查询条件
		Object startDate = params[0];
		Object endDate = params[1];
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果起始日期不为空
		if (startDate != null
				&& CommonUtil.isNotZeroLengthTrimString(startDate.toString())) {
			// 起息日期大于等于起始日期
			queryCondition.append(" and t.startRateDate >= ?");
			paramArrayList.add(FosUtil.getInitDate(startDate.toString()));
		}
		// 如果截至日期不为空
		if (endDate != null
				&& CommonUtil.isNotZeroLengthTrimString(endDate.toString())) {
			// 结息日期小于等于截至日期
			queryCondition.append(" and t.endRateDate <= ?");
			paramArrayList.add(FosUtil.getInitDate(endDate.toString()));
		}
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(fwAccount.getFwGroup().getId());
		}
		String totalRowHsql = "select count(t) from InteriorLoan t where "
				+ queryCondition
				+ " and t.forState = 1 and t.leaderAuditState <> 1 ";
		String resultRowHsql = "from InteriorLoan t where " + queryCondition
				+ " and t.forState = 1 and t.leaderAuditState <> 1 ";
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultRowHsql, "order by t.id asc", paramArrayList.toArray(),
				pageBean, parameterList);
	}

	/**
	 * 获取当前集团内部借款分页数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 */
	public CutPageBean getInteriorPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount) {
		// TODO Auto-generated method stub
		String condition = " 1=1 ";
		String totalRowHsql = "select count(t) from InteriorLoan t where "
				+ condition + " and t.transactAcctName='"
				+ fwAccount.getAcctName() + "'";
		String resultHsql = "from InteriorLoan t where " + condition
				+ " and t.transactAcctName='" + fwAccount.getAcctName() + "'";
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultHsql, "order by t.id desc", pageBean, parameterList);
	}

	/**
	 * 新增或者修改集团内部借款.
	 * 
	 */
	@SuppressWarnings("unchecked")
	public synchronized boolean saveOrUpdateInteriorLoan(
			InteriorLoan interiorLoan) {
		if (interiorLoan.getId() == null) {
			FwAccount fwAccount = ThreadLocalClient.get().getOperator();
			List<FwAccount> accountList = hibernateTemplate
					.find("from FwAccount t where t.position=? and t.fwGroup.id=? order by t.id asc",
							new Object[] { Constant.LEADER_CODE,
									fwAccount.getFwGroup().getId() });
			interiorLoan.setGroup(fwAccount.getFwGroup());
			// 取系统用户
			FwAccount account = ThreadLocalClient.get().getOperator();
			interiorLoan.setTransactUser(account.getUserName());
			interiorLoan.setTransactAcctName(account.getAcctName());
			if (accountList.size() > 0) {
				interiorLoan.setLeaderShip(accountList.get(0).getAcctName());
				interiorLoan.setMgLeaderUserName(accountList.get(0)
						.getUserName());
			}
			// 取当前时间
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			interiorLoan.setFoundDate(currentDate);
			interiorLoan.setIsModify(Constant.MODIFY_FUNDS_YES);
			interiorLoan.setForState(Constant.FOR_STATE_NOT_FINISH);
			interiorLoan.setLeaderAuditState(Constant.LEADER_AUDIT_STATE_NO);
			hibernateTemplate.save(interiorLoan);

		} else {
			hibernateTemplate.merge(interiorLoan);
		}
		return true;
	}

	/**
	 * 查看付息明细.
	 */
	public CutPageBean getPayInterstDetail(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params) {
		// TODO Auto-generated method stub
		String condition = "t.id =?";
		String totalRowHsql = "select count(t) from FinancingDetail t";
		String resultHsql = "from FinancingDetail t where " + condition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultHsql, "order by t.id asc", pageBean, parameterList);
	}

	/**
	 * 驳回日志列表.
	 * 
	 * @return 返回类型
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public List<LoanReasonRecord> getReasonsById(Long Id) {
		return hibernateTemplate
				.find("from LoanReasonRecord t where t.ownId=? and t.useType =? order by t.rejDate desc",
						new Object[] { Id,
								Constant.REJECT_RESEAON_USETYPE_ENTRUST });
	}

	/**
	 * 编辑提交.
	 * 
	 * @param auditId
	 *            资金来源
	 * @return 返回类型
	 */
	public synchronized int confirmSubmit(final Long interiorId) {
		String forState = getObjectByIdLock(InteriorLoan.class, interiorId,
				"forState");
		if (forState != null && !forState.equals(Constant.FOR_STATE_NOT_FINISH)) {
			throw new BusinessRuntimeException("该记录已经被处理，不能再操作");
		}
		InteriorLoan interiorLoan = (InteriorLoan) this.getObjectById(
				InteriorLoan.class, interiorId);
		interiorLoan.setForState(Constant.FOR_STATE_FINISH);
		if (interiorLoan.getLeaderAuditState() != null
				&& Constant.LEADER_AUDIT_STATE_REBUT.equals(interiorLoan
						.getLeaderAuditState())) {
			interiorLoan.setLeaderAuditState(Constant.LEADER_AUDIT_STATE_NO);
		}
		this.merge(interiorLoan);
		return 0;
	}

	/**
	 * 审核通过或驳回.
	 * 
	 * @param auditId
	 *            资金来源
	 * @param status
	 *            审核通过或驳回
	 * @return 返回类型
	 * @throws ParseException
	 */
	public synchronized int auditSubmit(final Long interiorId,
			final String status, final String rejectReason)
			throws ParseException {
		String leaderAuditState = getObjectByIdLock(InteriorLoan.class,
				interiorId, "leaderAuditState");
		if (leaderAuditState != null
				&& !leaderAuditState.equals(Constant.LEADER_AUDIT_STATE_NO)) {
			throw new BusinessRuntimeException("该记录已经被处理，不能再操作");
		}

		InteriorLoan interiorLoan = (InteriorLoan) this.getObjectById(
				InteriorLoan.class, interiorId);
		interiorLoan.setLeaderAuditState(status);
		if (status != null && Constant.LEADER_AUDIT_STATE_REBUT.equals(status)) {
			interiorLoan.setForState(Constant.FOR_STATE_NOT_FINISH);
		}
		this.merge(interiorLoan);
		if (status != null && Constant.LEADER_AUDIT_STATE_REBUT.equals(status)) {
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			LoanReasonRecord loanReasonRecord = new LoanReasonRecord();
			FwAccount account = ThreadLocalClient.get().getOperator();
			loanReasonRecord.setRejUserName(account.getUserName());
			loanReasonRecord.setRejReason(rejectReason);
			loanReasonRecord.setRejDate(currentDate);
			loanReasonRecord.setFoundDate(currentDate);
			loanReasonRecord
					.setUseType(Constant.REJECT_RESEAON_USETYPE_ENTRUST);
			loanReasonRecord.setOwnId(interiorId);
			save(loanReasonRecord);
		} else if (status != null
				&& Constant.LEADER_AUDIT_STATE_YES.equals(status)) {
			interiorLoan.setIsModify(Constant.MODIFY_FUNDS_NO);
		}
		return 0;
	}

}
