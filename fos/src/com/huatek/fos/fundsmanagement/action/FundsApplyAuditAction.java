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
import com.huatek.fos.fundsmanagement.service.FundsApplyService;
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
 * 资金运用报表审核action类
 * 
 * @author: alan_zhang
 */
@Controller
@RequestMapping("/fundsApplyAudit.do")
@SessionAttributes(types = SourceUseFunds.class)
public class FundsApplyAuditAction {

	/**
	 * 资金运用service类
	 */
	@Autowired
	private FundsApplyService fundsApplyService;

	/**
	 * 资金统计service类
	 */
	@Autowired
	private FundsGatherService fundsGatherService;

	/**
	 * 报表审核记录列表页面跳转路径
	 */
	private static final String LIST_PAGE_PATH = "fos/fundsapplymanagement/fundsApply_audit.jsp";

	/**
	 * 报表审核信息预览页面跳转路径
	 */
	private static final String LIST_PAGEPRVIEW_PATH = "fos/fundsapplymanagement/fundsApply_audit_preview.jsp";

	/**
	 * 报表审核记录列表页面跳转路径(POST方式)
	 */
	private static final String REDIRECT_QUERY_PATH = "redirect:fundsApplyAudit.do?actionMethod=query";

	/**
	 * 报表审核记录查询.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=query")
	public String executeQuery(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 获取页面查询参数
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		// 获取页面起始日期
		String startDate = request.getParameter("startDate");
		// 获取页面截至日期
		String endDate = request.getParameter("endDate");
		// 获取提交类型(sbReport：报表提交；sbAudit:报表审核)
		String submitType = request.getParameter("submitType");
		// 获取当前登录系统用户
		FwAccount account = ThreadLocalClient.get().getOperator();
		// 设置查询参数
		Object[] params = new Object[] { startDate, endDate, submitType };
		// 获取分页pagrBean
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);

		// 返回查询结果
		model.addAttribute("pageBean", fundsApplyService.getFundsApplyAudit(
				pageBean, parameterList, params, account));
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("submitType", submitType);

		return LIST_PAGE_PATH;
	}

	/**
	 * 查询列表.
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
		// 获取查询条件
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		// 获取统计日期
		String gatherDate = request.getParameter("gatherDate");
		// 格式化日期
		Date date = FosUtil.getInitDate(gatherDate);
		// 设置查询参数
		Object[] params = new Object[] { date };

		// 获取当前登录系统用户
		FwAccount account = ThreadLocalClient.get().getOperator();

		// 获取分页pageBean
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		// 获取查询结果
		pageBean = fundsApplyService.getFundsApplyPreview(pageBean,
				parameterList, params, account);
		List dataList = pageBean.getDataList();

		if (dataList != null && dataList.size() > 0) {
			fundsApplyService.orgnizationFirstData(dataList);
		}

		// 查询驳回记录
		String auditId = request.getParameter("auditId");
		String submitType = request.getParameter("submitType");
		model.addAttribute("auditId", auditId);
		model.addAttribute("submitType", submitType);
		model.addAttribute(
				"auditReportRecord",
				fundsApplyService.getObjectById(AuditReportRecord.class,
						Long.valueOf(auditId)));
		List<RejectReasonRecord> reasonList = fundsApplyService
				.getRejectReasonRecord(Long.valueOf(auditId));
		model.addAttribute("reasonList", reasonList);
		model.addAttribute("pageBean", pageBean);
		return LIST_PAGEPRVIEW_PATH;
	}

	/***
	 * 报表审核确认提交.
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
		AuditReportRecord auditReportRecord = (AuditReportRecord) fundsApplyService
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
						.getTowReportsName())) {
					return Util
							.printErrorString("当前统计日期下的所有部门资金运用汇总报表已经生成，无法执行该操作！");
				}
			}

			// 执行报表审核确认提交
			fundsApplyService.confirmSubmit(auditReportRecord);
		}

		// 获取提交类型
		String submitType = request.getParameter("submitType");
		return REDIRECT_QUERY_PATH + "&submitType=" + submitType;
	}

	/***
	 * 审核通过或驳回提交.
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
		// 获取驳回原因
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
		AuditReportRecord auditReportRecord = (AuditReportRecord) fundsApplyService
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
						.getTowReportsName())) {
					return Util
							.printErrorString("当前统计日期下的所有部门资金运用汇总报表已经生成，无法执行该操作！");
				}
			}

			// 获取当前登录系统用户
			FwAccount account = ThreadLocalClient.get().getOperator();
			// 执行审核提交
			fundsApplyService.auditSubmit(auditReportRecord, status,
					rejectReason, account);
		}

		// 获取提交类型
		String submitType = request.getParameter("submitType");
		return REDIRECT_QUERY_PATH + "&submitType=" + submitType;
	}
}
