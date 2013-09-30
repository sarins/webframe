package com.huatek.fos.fundsmanagement.action;

import java.nio.charset.Charset;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huatek.fos.fundsmanagement.entity.hibernate.AuditReportRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.RejectReasonRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.fos.fundsmanagement.service.FundsOriginService;
import com.huatek.fos.fundsreportgather.entity.hibernate.ReportsDetails;
import com.huatek.fos.fundsreportgather.service.FundsGatherService;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;

/**
 * 
 * 
 * @author: marvin_liu
 * 
 * @version $Id: FundsOriginAction.java, v 0.1 2013-5-21 下午04:16:10 $
 * 
 *          Comment: 请添加对类的描述
 */
@Controller
@RequestMapping("/fundsOriginAudit.do")
@SessionAttributes(types = SourceUseFunds.class)
public class FundsOriginAuditAction {

	@Autowired
	private FundsOriginService fundsOriginService;

	/**
	 * 资金统计service类
	 */
	@Autowired
	private FundsGatherService fundsGatherService;

	private static final String LISTPAGEPATH = "fos/fundsmanagement/fundsOrigin_audit.jsp";

	private static final String LISTPAGEPRVIEWPATH = "fos/fundsmanagement/fundsOrigin_audit_preview.jsp";

	private static final String REDIRECTQUERYPATH = "redirect:fundsOriginAudit.do?actionMethod=query";

	/**
	 * 查询列表.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=query")
	public String doSuperQuery(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, AuditReportRecord.class);
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String opType = request.getParameter("opType");
		Object[] params = new Object[] { startDate, endDate, opType };
		// 获取当前登录系统用户
		FwAccount account = ThreadLocalClient.get().getOperator();
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("pageBean", fundsOriginService
				.getFundsOriAuditPageBean(pageBean, parameterList, params,
						account));
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("opType", opType);
		return LISTPAGEPATH;
	}

	/**
	 * 审核预览.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=auditPreview")
	public String auditPreview(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		String gatherDate = request.getParameter("gatherDate");
		Date date = FosUtil.getInitDate(gatherDate);
		Object[] params = new Object[] { date };
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount account = ThreadLocalClient.get().getOperator();
		pageBean = fundsOriginService.getFundsOriPreviewPageBean(pageBean,
				parameterList, params, account);
		List dataList = pageBean.getDataList();
		if (dataList != null && dataList.size() > 0) {
			fundsOriginService.orgnizationFirstData(dataList);
			fundsOriginService.orgnizationSecondData(dataList);
		}
		model.addAttribute("pageBean", pageBean);
		String auditId = request.getParameter("auditId");
		String opType = request.getParameter("opType");
		model.addAttribute("auditId", auditId);
		model.addAttribute("opType", opType);
		model.addAttribute(
				"auditReportRecord",
				fundsOriginService.getObjectById(AuditReportRecord.class,
						Long.valueOf(auditId)));
		List<RejectReasonRecord> reasonList = fundsOriginService
				.getRejectReasonRecord(Long.valueOf(auditId));
		model.addAttribute("reasonList", reasonList);
		return LISTPAGEPRVIEWPATH;
	}

	/***
	 * 编辑提交.
	 * 
	 * @param model
	 * @param fwSystem
	 * @param result
	 * @param status
	 * @return
	 */
	@RequestMapping(params = "actionMethod=confirmSubmit", method = RequestMethod.POST)
	public String confirmSubmit(final Model model,
			final HttpServletRequest request,
			@RequestParam("id") final Long auditId) {
		// 根据审核ID获取审核记录
		AuditReportRecord auditReportRecord = (AuditReportRecord) fundsOriginService
				.getObjectById(AuditReportRecord.class, auditId);
		// 根据统计日期和报表名称获取该部门下的报表审核记录
		if (auditReportRecord != null) {
			// 根据查询条件获取所有部门报表汇总明细
			List<ReportsDetails> reportsDetailsList = fundsGatherService
					.getReportsDetails(Constant.REPORTS_USE_TOTAL,
							auditReportRecord.getGatherDate());
			// 如果报表明细不为空
			if (reportsDetailsList != null && reportsDetailsList.size() > 0) {
				// 获取报表明细对象
				ReportsDetails reportsDetails = reportsDetailsList.get(0);
				// 判断是否已经汇总过
				if (CommonUtil.isNotZeroLengthTrimString(reportsDetails
						.getOneReportsName())) {
					return Util
							.printErrorString("当前统计日期下的所有部门资金来源汇总报表已经生成，无法执行该操作！");
				}
			}
			fundsOriginService.confirmSubmit(auditReportRecord);
		}

		String opType = request.getParameter("opType");
		return REDIRECTQUERYPATH + "&opType=" + opType;
	}

	/***
	 * 审核.
	 * 
	 * @param model
	 * @param fwSystem
	 * @param result
	 * @param status
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=auditSubmit", method = RequestMethod.POST)
	public String auditSubmit(final Model model,
			final HttpServletRequest request,
			@RequestParam("id") final Long auditId, final String status)
			throws ParseException {
		String rejectReason = request.getParameter("rejectReason");
		// 如果当前审核状态是驳回
		if (Constant.LEADER_AUDIT_STATE_REBUT.equals(status)
				&& CommonUtil.isNotZeroLengthTrimString(rejectReason)) {
			// 驳回原因长度校验
			if (rejectReason.getBytes(Charset.forName("GBK")).length > 1000) {
				return Util.printErrorString("驳回原因长度不能超过1000个字符!");
			}

		}
		// 根据审核ID获取审核记录
		AuditReportRecord auditReportRecord = (AuditReportRecord) fundsOriginService
				.getObjectById(AuditReportRecord.class, auditId);
		// 根据统计日期和报表名称获取该部门下的报表审核记录
		if (auditReportRecord != null) {
			// 根据查询条件获取所有部门报表汇总明细
			List<ReportsDetails> reportsDetailsList = fundsGatherService
					.getReportsDetails(Constant.REPORTS_USE_TOTAL,
							auditReportRecord.getGatherDate());
			// 如果报表明细不为空
			if (reportsDetailsList != null && reportsDetailsList.size() > 0) {
				// 获取报表明细对象
				ReportsDetails reportsDetails = reportsDetailsList.get(0);
				// 判断是否已经汇总过
				if (CommonUtil.isNotZeroLengthTrimString(reportsDetails
						.getOneReportsName())) {
					return Util
							.printErrorString("当前统计日期下的所有部门资金来源汇总报表已经生成，无法执行该操作！");
				}
			}
			FwAccount account = ThreadLocalClient.get().getOperator();
			fundsOriginService.auditSubmit(auditReportRecord, status,
					rejectReason, account);
		}
		String opType = request.getParameter("opType");
		return REDIRECTQUERYPATH + "&opType=" + opType;
	}
}
