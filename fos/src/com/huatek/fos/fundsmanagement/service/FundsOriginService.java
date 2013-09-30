package com.huatek.fos.fundsmanagement.service;

import java.text.ParseException;
import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.fos.fundsmanagement.entity.hibernate.AuditReportRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.RejectReasonRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

public interface FundsOriginService extends BaseService {
	/**
	 * 查询资金来源信息.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	CutPageBean getFundsOriPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList, Object[] params, FwAccount account);

	/**
	 * 查询资金来源信息（通过统计日期、数据类型、所属部门查询）.
	 * 
	 * @param sourceUseFunds
	 *            资金来源对象
	 * @param account
	 *            当前登录用户
	 * @return 返回类型
	 */
	List<SourceUseFunds> getFundsApplyByParam(
			final SourceUseFunds sourceUseFunds, FwAccount account);

	/**
	 * 新增或保存资金来源信息.
	 * 
	 * @param sourceUseFunds
	 *            资金来源
	 * @return 返回类型
	 */
	int saveSourceUseFunds(final SourceUseFunds sourceUseFunds,
			final FwAccount account);

	/**
	 * 查询资金来源审核信息.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */

	CutPageBean getFundsOriAuditPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList, Object[] params,
			final FwAccount account) throws ParseException;

	/**
	 * 预览资金来源报表信息.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	CutPageBean getFundsOriPreviewPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params,
			final FwAccount account) throws ParseException;

	/**
	 * 编辑提交.
	 * 
	 * @param auditReportRecord
	 *            资金来源审核记录对象
	 * @return 返回类型
	 */
	void confirmSubmit(final AuditReportRecord auditReportRecord);

	/**
	 * 审核通过或驳回.
	 * 
	 * @param auditReportRecord
	 *            资金来源审核记录对象
	 * @param status
	 *            审核通过或驳回
	 * @return 返回类型
	 */
	void auditSubmit(final AuditReportRecord auditReportRecord,
			final String status, final String rejectReason,
			final FwAccount account) throws ParseException;

	/**
	 * 驳回日志列表.
	 * 
	 * @return 返回类型
	 * @throws ParseException
	 */
	List<RejectReasonRecord> getRejectReasonRecord(Long auditReportRecordId);

	/**
	 * 组装一级项目分类信息（金额(包括一级品类合计)，信息条数 firstProjectCount用于一级分类RowSpan行数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	List<SourceUseFunds> orgnizationFirstData(List<SourceUseFunds> sourceList);

	/**
	 * 组装二级项目分类信息（金额(包括二级品类合计)，信息条数secondProjectCount 用于二级分类RowSpan行数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	List<SourceUseFunds> orgnizationSecondData(List<SourceUseFunds> sourceList);
}
