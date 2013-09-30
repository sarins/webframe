package com.huatek.fos.fundsreportgather.action;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huatek.fos.fundsreportgather.entity.hibernate.ReportsDetails;
import com.huatek.fos.fundsreportgather.service.FundsGatherService;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.Util;

/**
 * 资金运用汇总action类
 * 
 * @author: Alan_zhang
 */
@Controller
@RequestMapping("/fundsGatherSubmit.do")
@SessionAttributes(types = ReportsDetails.class)
public class FundsGatherSubmitAction {

	/**
	 * 资金报表汇总service类
	 */
	@Autowired
	private FundsGatherService fundsGatherService;

	/**
	 * 资金运用查询列表页面跳转路径
	 */
	private static final String SUBMIT_PAGEP_PATH = "fos/fundsGathermanagement/fundsGatherSubmit.jsp";

	/**
	 * 报表审核记录列表页面跳转路径(POST方式)
	 */
	private static final String REDIRECT_QUERY_PATH = "redirect:fundsGatherSubmit.do?actionMethod=confirmSubmit";

	/**
	 * 资金报表汇总提交页面数据初始化.
	 * 
	 * @param model
	 *            model对象
	 * @param request
	 *            request请求对象
	 * @return 资金运用查询页面跳转路径
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=confirmSubmit", method = RequestMethod.GET)
	public String sunmitInitPage(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 设置统计日期（每月10日、20日或月底一天）
		String initDate = FosUtil.getInitDate();
		model.addAttribute("initDate", initDate);
		return SUBMIT_PAGEP_PATH;
	}

	/**
	 * 资金报表汇总提交.
	 * 
	 * @param model
	 *            model对象
	 * @param request
	 *            request请求对象
	 * @param subType
	 *            汇总类型（资金来源、资金运用）
	 * @param gatherDate
	 *            统计日期
	 * @return 报表汇总列表页面
	 * @throws ParseException
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=confirmSubmit", method = RequestMethod.POST)
	public String gatherApplyPreview(final Model model,
			final HttpServletRequest request,
			@RequestParam("subType") final String subType,
			final String gatherDate) throws ParseException {

		// 格式化统计日期
		Date date = FosUtil.getInitDate(gatherDate);
		// 如果提交汇总类型是资金来源滚动计划汇总
		if (subType.equals(Constant.DATA_SOURCES_FUNDS_RIO)) {
			// 获取汇总报表已审核部门数量
			int size = fundsGatherService.getAuditReportRecord(date,
					Constant.FUNDS_ORI_REPORT_NAME);
			if (size == 0) {
				return Util.printErrorString("目前没有可以汇总的资金来源滚动计划汇总数据!");
			}
			// 如果提交汇总类型是资金运用滚动计划汇总
		} else if (subType.equals(Constant.DATA_SOURCES_FUNDS_APPLY)) {
			// 获取汇总报表已审核部门数量
			int size = fundsGatherService.getAuditReportRecord(date,
					Constant.FUNDS_USE_REPORT_NAME);
			if (size == 0) {
				return Util.printErrorString("目前没有可以汇总的资金运用滚动计划汇总数据!");
			}
		}

		// 获取当前登录系统用户
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		// 根据查询条件获取报表汇总明细
		List<ReportsDetails> reportsDetailsList = fundsGatherService
				.getReportsDetails(Constant.REPORTS_USE_TOTAL, date);
		// 如果报表明细不为空
		if (reportsDetailsList != null && reportsDetailsList.size() > 0) {
			// 获取报表明细对象
			ReportsDetails reportsDetails = reportsDetailsList.get(0);
			// 如果提交汇总类型是资金来源滚动计划汇总
			if (subType.equals(Constant.DATA_SOURCES_FUNDS_RIO)) {
				// 判断是否已经汇总过
				if (CommonUtil.isNotZeroLengthTrimString(reportsDetails
						.getOneReportsName())) {
					return Util.printErrorString("该统计日期下的资金来源汇总报表已执行过报表生成!");
				}
				// 如果提交汇总类型是资金运用滚动计划汇总
			} else if (subType.equals(Constant.DATA_SOURCES_FUNDS_APPLY)) {
				// 判断是否已经汇总过
				if (CommonUtil.isNotZeroLengthTrimString(reportsDetails
						.getTowReportsName())) {
					return Util.printErrorString("该统计日期下的资金运用汇总报表已执行过报表生成!");
				}
			}
		}

		// 如果提交汇总类型是资金来源滚动计划汇总
		if (subType.equals(Constant.DATA_SOURCES_FUNDS_RIO)) {
			// 保存报表导出信息
			fundsGatherService.saveExportReportsRecord(null, date, fwAccount,
					Constant.FUNDS_ORI_GATHER_REPORT_NAME,
					Constant.REPORTS_USE_TOTAL);
			// 保存报表导出明细
			fundsGatherService.saveOrUpdateReportsDetails(fwAccount,
					Constant.REPORTS_USE_TOTAL, date,
					Constant.DATA_SOURCES_FUNDS_RIO);
		} else if (subType.equals(Constant.DATA_SOURCES_FUNDS_APPLY)) {
			// 保存报表导出信息
			fundsGatherService.saveExportReportsRecord(null, date, fwAccount,
					Constant.FUNDS_USE_GATHER_REPORT_NAME,
					Constant.REPORTS_USE_TOTAL);
			// 保存报表导出明细
			fundsGatherService.saveOrUpdateReportsDetails(fwAccount,
					Constant.REPORTS_USE_TOTAL, date,
					Constant.DATA_SOURCES_FUNDS_APPLY);
		}
		return REDIRECT_QUERY_PATH;
	}

	/**
	 * initBinder对象转换方法.
	 * 
	 * @param dataBinder
	 *            dataBinder
	 */
	@InitBinder
	protected void initBinder(final WebDataBinder dataBinder) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
		dataBinder.registerCustomEditor(Date.class, "gatherDate", dateEditor);
	}
}
