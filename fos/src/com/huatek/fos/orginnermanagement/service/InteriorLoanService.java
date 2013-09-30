/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-28 上午10:05:07
 * Author: allen_huang
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.orginnermanagement.service;

import java.text.ParseException;
import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.fos.orginnermanagement.entity.hibernate.InteriorLoan;
import com.huatek.fos.orginnermanagement.entity.hibernate.LoanReasonRecord;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 * 
 * @author: allen_huang
 * 
 * 
 *          Comment: 集团内部借款服务类
 */
public interface InteriorLoanService extends BaseService {
	/**
	 * 获取当前集团内部借款分页数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 */
	CutPageBean getInteriorLoanPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount, Object[] params)
			throws ParseException;

	/**
	 * 获取当前集团内部借款审核数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 */
	CutPageBean getInteriorAuditPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount, Object[] params)
			throws ParseException;

	/**
	 * 审核通过或驳回.
	 * 
	 * @param auditId
	 *            资金来源
	 * @param status
	 *            审核通过或驳回
	 * @return 返回类型
	 */
	int auditSubmit(final Long interiorId, final String status,
			final String rejectReason) throws ParseException;

	/**
	 * 获取当前集团内部借款分页数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 */
	CutPageBean getInteriorPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount);

	/**
	 * 驳回日志列表.
	 * 
	 * @return 返回类型
	 * @throws ParseException
	 */
	List<LoanReasonRecord> getReasonsById(Long Id);

	/**
	 * 编辑提交.
	 * 
	 * @param auditId
	 *            资金来源
	 * @return 返回类型
	 */
	int confirmSubmit(final Long interiorId);

	/**
	 * 获取当前登录用户录入数据.
	 * 
	 * @param pageBean
	 * @param fwAccount
	 * @return
	 */
	CutPageBean getCurrAcctInteriorLoanPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount,
			Object[] params, boolean isExport) throws ParseException;

	/**
	 * 新增或者修改集团内部借款
	 * 
	 * @param interiorLoan
	 * @return
	 */
	boolean saveOrUpdateInteriorLoan(final InteriorLoan interiorLoan);

	/**
	 * 查看付息明细.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @param financeId
	 * @return
	 */
	CutPageBean getPayInterstDetail(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params);
}
