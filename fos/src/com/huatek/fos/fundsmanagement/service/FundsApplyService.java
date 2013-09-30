package com.huatek.fos.fundsmanagement.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.fos.fundsmanagement.entity.hibernate.AuditReportRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.RejectReasonRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 * 资金运用service类
 * 
 * @author alan_zhang
 * 
 */
public interface FundsApplyService extends BaseService {
	/**
	 * 查询资金运用信息.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	CutPageBean getFundsApply(CutPageBean pageBean,
			List<CommonBean> paramterList, Object[] params, FwAccount account);

	/**
	 * 查询资金运用信息（通过统计日期、数据类型、所属部门查询）.
	 * 
	 * @param sourceUseFunds
	 *            资金运用对象
	 * @param account
	 *            当前登录用户
	 * @return 返回类型
	 */
	List<SourceUseFunds> getFundsApplyByParam(
			final SourceUseFunds sourceUseFunds, FwAccount account);

	/**
	 * 新增或编辑资金运用信息.
	 * 
	 * @param sourceUseFunds
	 *            资金运用
	 * @return 返回类型
	 */
	void saveOrUpdateApplyFunds(final SourceUseFunds sourceUseFunds,
			final FwAccount account);

	/**
	 * 查询资金运用审核信息.
	 * 
	 * @param pageBean
	 *            pageBean对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	CutPageBean getFundsApplyAudit(CutPageBean pageBean,
			List<CommonBean> paramterList, Object[] params,
			final FwAccount account) throws ParseException;

	/**
	 * 预览资金运用报表信息.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	CutPageBean getFundsApplyPreview(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params, FwAccount account)
			throws ParseException;

	/**
	 * 报表审核确认提交.
	 * 
	 * @param auditReportRecord
	 *            资金来源审核记录对象
	 * @return 返回类型
	 */
	void confirmSubmit(final AuditReportRecord auditReportRecord);

	/**
	 * 审核通过或驳回提交.
	 * 
	 * @param auditReportRecord
	 *            资金来源审核记录对象
	 * @param status
	 *            审核通过或驳回
	 * @return 返回类型
	 * @throws ParseException
	 */
	void auditSubmit(final AuditReportRecord auditReportRecord,
			final String status, final String rejectReason,
			final FwAccount account) throws ParseException;

	/**
	 * 查询驳回日志列表.
	 * 
	 * @return 返回类型
	 * @throws ParseException
	 */
	List<RejectReasonRecord> getRejectReasonRecord(Long auditReportRecordId);

	/**
	 * 通过统计日期和报表名称获取审核记录
	 * 
	 * @param gatherDate
	 *            统计日期
	 * @param reportsName
	 *            报表名称
	 * @return
	 */
	List<AuditReportRecord> getAuditReportRecord(Date gatherDate,
			String reportsName, FwAccount account);

	/**
	 * 组装一级项目分类信息（金额(包括一级品类合计)，信息条数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	List<SourceUseFunds> orgnizationFirstData(List<SourceUseFunds> sourceList);
}
