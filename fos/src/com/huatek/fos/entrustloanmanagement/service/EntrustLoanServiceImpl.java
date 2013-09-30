/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-21 下午03:05:25
 * Author: allen_huang
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.entrustloanmanagement.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.fos.entrustloanmanagement.entity.hibernate.EntrustLoan;
import com.huatek.fos.orginnermanagement.entity.hibernate.LoanReasonRecord;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;

/**
 * 
 * 
 * @author: marvin_liu
 * 
 * @version $Id: EntrustLoanServiceImpl.java, v 0.1 2013-5-29 下午02:20:11 $
 * 
 *          Comment: 请添加对类的描述
 */
public class EntrustLoanServiceImpl extends BaseServiceImpl implements
		EntrustLoanService {
	/**
	 * 获取当前登录用户录入数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 */
	public CutPageBean getCurrAcctEntrustLoanPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, final FwAccount fwAccount) {
		StringBuffer queryCondition = new StringBuffer();
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果当前登录用户不是领导或管理员，需要根据登录用户名过滤数据
		if (fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append("where 1=1 and t.transactAcctName=? ");
			paramArrayList.add(fwAccount.getAcctName());
		}

		String totalRowHsql = "select count(t) from EntrustLoan t "
				+ queryCondition;
		String resultHsql = "from EntrustLoan t " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultHsql, "order by t.foundDate desc",
				paramArrayList.toArray(), pageBean, parameterList);

	}

	/**
	 * 获取当前部门所有委托贷款分页数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 * @throws ParseException
	 */
	public CutPageBean getDepartmentEntrustLoanPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount,
			Object[] params, boolean isExport) throws ParseException {
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
		String totalRowHsql = "select count(t) from EntrustLoan t where "
				+ queryCondition;
		String resultRowHsql = "from EntrustLoan t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultRowHsql, "order by t.foundDate desc",
				paramArrayList.toArray(), pageBean, parameterList);
	}

	/**
	 * 获取提交或审核所有委托贷款分页数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 * @throws ParseException
	 */
	public CutPageBean getAuditSubmitEntrustLoanPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params,
			final FwAccount fwAccount) throws ParseException {
		List<Object> paramArrayList = new ArrayList<Object>();
		StringBuffer queryCondition = new StringBuffer(" 1=1 ");
		// 获取查询条件
		Object startDate = params[0];
		Object endDate = params[1];
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
			// 统计日期小于等于结息日期
			queryCondition.append(" and t.endRateDate <= ?");
			paramArrayList.add(FosUtil.getInitDate(endDate.toString()));
		}
		Object opType = params[2];
		if (opType != null && "editSubmit".equals(opType)) {
			paramArrayList.add(Constant.FOR_STATE_NOT_FINISH);
			queryCondition.append(" and t.forState=?");
		}
		if (opType != null && "audit".equals(opType)) {
			paramArrayList.add(Constant.FOR_STATE_FINISH);
			paramArrayList.add(Constant.LEADER_AUDIT_STATE_NO);
			queryCondition.append(" and t.forState=? and t.leaderAuditState=?");
		}
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id =?");
			paramArrayList.add(fwAccount.getFwGroup().getId());
		}

		String totalRowHsql = "select count(t) from EntrustLoan t where "
				+ queryCondition;
		String resultRowHsql = "from EntrustLoan t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultRowHsql, "order by t.id desc", paramArrayList.toArray(),
				pageBean, parameterList);
	}

	/**
	 * 新增或者修改委托贷款数据.
	 * 
	 * @param entrustLoan
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public synchronized boolean saveOrUpdateEntrustLoan(
			EntrustLoan entrustLoan, FwAccount fwAccount) {
		if (entrustLoan.getId() == null) {
			List<FwAccount> accountList = hibernateTemplate
					.find("from FwAccount t where t.position=? and t.fwGroup.id=? order by t.id asc",
							new Object[] { Constant.LEADER_CODE,
									fwAccount.getFwGroup().getId() });
			entrustLoan.setGroup(fwAccount.getFwGroup());
			// 取系统用户
			entrustLoan.setTransactUser(fwAccount.getUserName());
			entrustLoan.setTransactAcctName(fwAccount.getAcctName());
			// 取当前时间
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			entrustLoan.setFoundDate(currentDate);
			entrustLoan.setIsModify(Constant.MODIFY_FUNDS_YES);
			entrustLoan.setForState(Constant.FOR_STATE_NOT_FINISH);
			if (accountList.size() > 0) {
				entrustLoan.setMgLeaderShip(accountList.get(0).getAcctName());
				entrustLoan.setMgLeaderUserName(accountList.get(0)
						.getUserName());
			}
			entrustLoan.setLeaderAuditState(Constant.LEADER_AUDIT_STATE_NO);
			hibernateTemplate.save(entrustLoan);

		} else {
			hibernateTemplate.merge(entrustLoan);
		}
		return true;
	}

	/**
	 * 编辑提交.
	 * 
	 * @param auditId
	 *            委托贷款
	 * @return 返回类型
	 */
	public void confirmSubmit(final Long entrustLoanId) {
		String forState = getObjectByIdLock(EntrustLoan.class, entrustLoanId,
				"forState");
		if (forState != null && !forState.equals(Constant.FOR_STATE_NOT_FINISH)) {
			throw new BusinessRuntimeException("该记录已经被处理，不能再操作");
		}
		EntrustLoan entrustLoan = (EntrustLoan) this.getObjectById(
				EntrustLoan.class, entrustLoanId);
		entrustLoan.setForState(Constant.FOR_STATE_FINISH);
		if (entrustLoan.getLeaderAuditState() != null
				&& Constant.LEADER_AUDIT_STATE_REBUT.equals(entrustLoan
						.getLeaderAuditState())) {
			entrustLoan.setLeaderAuditState(Constant.LEADER_AUDIT_STATE_NO);
		}
		this.merge(entrustLoan);
	}

	/**
	 * 审核通过或驳回.
	 * 
	 * @param entrustLoanId
	 *            委托贷款
	 * @param status
	 *            审核通过或驳回
	 * @return 返回类型
	 * @throws ParseException
	 */
	public void auditSubmit(final Long entrustLoanId, final String status,
			final String rejectReason, final FwAccount account) {
		String leaderAuditState = getObjectByIdLock(EntrustLoan.class,
				entrustLoanId, "leaderAuditState");
		if (leaderAuditState != null
				&& !leaderAuditState.equals(Constant.LEADER_AUDIT_STATE_NO)) {
			throw new BusinessRuntimeException("该记录已经被处理，不能再操作");
		}
		EntrustLoan entrustLoan = (EntrustLoan) this.getObjectById(
				EntrustLoan.class, entrustLoanId);
		entrustLoan.setLeaderAuditState(status);
		if (status != null && Constant.LEADER_AUDIT_STATE_REBUT.equals(status)) {
			entrustLoan.setForState(Constant.FOR_STATE_NOT_FINISH);
		}
		this.merge(entrustLoan);
		if (status != null && Constant.LEADER_AUDIT_STATE_REBUT.equals(status)) {
			// 取当前时间
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			LoanReasonRecord loanReasonRecord = new LoanReasonRecord();
			loanReasonRecord.setRejUserName(account.getUserName());
			loanReasonRecord.setRejReason(rejectReason);
			loanReasonRecord.setRejDate(currentDate);
			loanReasonRecord.setFoundDate(currentDate);
			loanReasonRecord.setOwnId(entrustLoan.getId());
			loanReasonRecord
					.setUseType(Constant.REJECT_RESEAON_USETYPE_INTERIOR);
			save(loanReasonRecord);
		} else if (status != null
				&& Constant.LEADER_AUDIT_STATE_YES.equals(status)) {
			entrustLoan.setIsModify(Constant.MODIFY_FUNDS_NO);
		}
	}

	/**
	 * 驳回日志列表.
	 * 
	 * @return 返回类型
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public List<LoanReasonRecord> getRejectReasonRecord(Long auditReportRecordId) {
		return hibernateTemplate
				.find("from LoanReasonRecord t where t.ownId=? and t.useType=? order by t.rejDate desc",
						new Object[] { auditReportRecordId,
								Constant.REJECT_RESEAON_USETYPE_INTERIOR });
	}

	/**
	 * 查看付息明细.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @param params
	 * @return
	 */
	public CutPageBean getPayInterstDetail(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params) {
		String condition = "t.id =?";
		String totalRowHsql = "select count(t) from EntrustLoan t";
		String resultHsql = "from EntrustLoan t where " + condition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultHsql, "order by t.id asc", pageBean, parameterList);
	}

	/**
	 * 获取委托贷款除了正常之外的所有数据.
	 */
	public CutPageBean getShowListDateInHomePage(CutPageBean pageBean,
			List<CommonBean> parameterList) {
		String totalRowHsql = "select count(t) from EntrustLoan t where t.loanStatus <> '1'";
		String resultHsql = "from EntrustLoan t where t.loanStatus <> '1'";
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultHsql, "order by t.id", pageBean, null);
	}
}
