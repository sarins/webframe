/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-28 上午10:05:07
 * Author: allen_huang
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.entrustloanmanagement.service;

import java.text.ParseException;
import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.fos.entrustloanmanagement.entity.hibernate.EntrustLoan;
import com.huatek.fos.orginnermanagement.entity.hibernate.LoanReasonRecord;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 * 
 * 
 * @author: marvin_liu
 * 
 * @version $Id: EntrustLoanService.java, v 0.1 2013-5-29 下午02:20:04 $
 * 
 *          Comment: 请添加对类的描述
 */
public interface EntrustLoanService extends BaseService {
	/**
	 * 获取当前部门所有委托贷款分页数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 */
	CutPageBean getDepartmentEntrustLoanPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount,
			Object[] params, boolean isExport) throws ParseException;

	/**
	 * 获取当前登录用户录入数据.
	 * 
	 * @param pageBean
	 * @param fwAccount
	 * @return
	 */
	CutPageBean getCurrAcctEntrustLoanPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, final FwAccount fwAccount);

	/**
	 * 新增或者修改委托贷款数据.
	 * 
	 * @param entrustLoan
	 * @return
	 */
	boolean saveOrUpdateEntrustLoan(final EntrustLoan entrustLoan,
			FwAccount fwAccount);

	/**
	 * 获取提交或审核所有委托贷款分页数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 */
	CutPageBean getAuditSubmitEntrustLoanPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params,
			final FwAccount account) throws ParseException;

	/**
	 * 编辑提交.
	 * 
	 * @param auditId
	 *            资金来源
	 * @return 返回类型
	 */
	void confirmSubmit(final Long entrustLoanId);

	/**
	 * 审核通过或驳回.
	 * 
	 * @param auditId
	 *            资金来源
	 * @param status
	 *            审核通过或驳回
	 * @return 返回类型
	 */
	void auditSubmit(final Long entrustLoanId, final String status,
			final String rejectReason, final FwAccount account);

	/**
	 * 驳回日志列表.
	 * 
	 * @return 返回类型
	 * @throws ParseException
	 */
	List<LoanReasonRecord> getRejectReasonRecord(Long auditReportRecordId);

	/**
	 * 查看付息明细.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @param params
	 * @return
	 */
	CutPageBean getPayInterstDetail(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params);

	/**
	 * 获取委托贷款预警list.
	 * 
	 * @return
	 */
	CutPageBean getShowListDateInHomePage(CutPageBean pageBean,
			List<CommonBean> parameterList);
}
