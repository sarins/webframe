/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-27 下午03:00:34
 * Author: marvin_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.entrustloanmanagement.action;

import java.math.BigDecimal;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.huatek.fos.entrustloanmanagement.entity.hibernate.EntrustLoan;
import com.huatek.fos.entrustloanmanagement.service.EntrustLoanService;
import com.huatek.fos.financingmanagement.entity.hibernate.FinancingDetail;
import com.huatek.fos.orginnermanagement.entity.hibernate.LoanReasonRecord;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * 
 * 
 * @author: marvin_liu
 * 
 * @version $Id: EntrustLoanAction.java, v 0.1 2013-5-29 下午02:04:21 $
 * 
 *          Comment: 委托贷款控制层
 */
@Controller
@RequestMapping("/entrustLoan.do")
@SessionAttributes(types = EntrustLoan.class)
public class EntrustLoanAction {

	@Autowired
	private EntrustLoanService entrustLoanService;

	// 委托贷款列表页面路径
	private static final String QUERYAGEPATH = "fos/entrustloanmanagement/entrustLoan_list.jsp";
	// 委托贷款编辑页面路径
	private static final String EDITPAGEPATH = "fos/entrustloanmanagement/entrustLoan_edit.jsp";
	// 委托贷款审核提交页面路径
	private static final String AUDITSUBMITPAGEPATH = "fos/entrustloanmanagement/entrustLoan_view.jsp";
	// 委托贷款查询条件页面路径
	private static final String QUERYDEPARTPAGEPATH = "fos/entrustloanmanagement/entrustLoan_query.jsp";
	// 委托贷款审核提交前查询条件页面路径
	private static final String QUERYSUBMITDEPARTPAGEPATH = "fos/entrustloanmanagement/entrustLoan_submit_audit.jsp";
	// 重定向至新增页面查询路径
	private static final String REDIRECTPATH = "redirect:entrustLoan.do?actionMethod=editQuery";

	// 重定向至审核提交页面路径
	private static final String AUDITREDIRECTPATH = "redirect:entrustLoan.do?actionMethod=querySubmitAudit";

	// 付息明细页面路径
	private static final String PAYINTERSTDETAILPAGEPATH = "fos/popup/entrustLoanPayDetailPopup_list.jsp";

	// 付息明细页面导出页面
	private static final String EXPORTPAYMENTPAGEPATH = "fos/popup/entrust_pay_export_excel.jsp";

	// 委托贷款信息导出页面
	private static final String EXPORTPAGEPATH = "fos/entrustloanmanagement/entrustLoan_export_excel.jsp";

	/**
	 * 查询登录用户所在部门表头.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.GET)
	public String query(final Model model, final HttpServletRequest request) {
		return QUERYDEPARTPAGEPATH;
	}

	/**
	 * 查询登录用户所在部门全部数据.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.POST)
	public String doquery(final Model model, final HttpServletRequest request)
			throws ParseException {
		String superQuery = request.getParameter("superQuery");
		model.addAttribute("superQuery", superQuery);
		// 获取页面起始日期
		String startDate = request.getParameter("startDate");
		// 获取页面截至日期
		String endDate = request.getParameter("endDate");
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		// 设置查询参数
		Object[] params = new Object[] { startDate, endDate };
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, EntrustLoan.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		boolean isExport = false;
		model.addAttribute("pageBean", entrustLoanService
				.getDepartmentEntrustLoanPageBean(pageBean, parameterList,
						fwAccount, params, isExport));
		return QUERYAGEPATH;
	}

	/**
	 * 查询当前登录用户表头信息.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.GET)
	public String editQuery(final Model model, final HttpServletRequest request) {
		// 获取当前系统时间月份对应的天数
		String[] daysInMonth = FosUtil.getDaysByMonth();
		List daysForPaymentDayList = Arrays.asList(daysInMonth);
		model.addAttribute("daysForPaymentDayList", daysForPaymentDayList);
		String entrustLoanId = request.getParameter("entrustLoanId");
		if (CommonUtil.isZeroLengthTrimString(entrustLoanId)) {
			EntrustLoan entrustLoan = new EntrustLoan();
			entrustLoan.setEndInterestDate(Long.valueOf(20));
			model.addAttribute(entrustLoan);
		} else {
			model.addAttribute(entrustLoanService.getObjectById(
					EntrustLoan.class, Long.valueOf(entrustLoanId)));
		}
		return EDITPAGEPATH;
	}

	/**
	 * 查询当前登录用户录入的数据.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.POST)
	public String doQuery(final Model model, final HttpServletRequest request) {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, EntrustLoan.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("pageBean", entrustLoanService
				.getCurrAcctEntrustLoanPageBean(pageBean, parameterList,
						fwAccount));
		return QUERYAGEPATH;
	}

	/**
	 * 保存或者新增数据.
	 * 
	 * @param model
	 * @param financingDetail
	 * @param result
	 * @param status
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEdit(final Model model,
			@ModelAttribute final EntrustLoan entrustLoan,
			final BindingResult result, final SessionStatus status,
			final HttpServletRequest request) throws ParseException {

		validate(entrustLoan, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,
					"interiorLoanForm"));
		}
		FwAccount account = ThreadLocalClient.get().getOperator();
		if (entrustLoanService.saveOrUpdateEntrustLoan(entrustLoan, account)) {
			status.setComplete();
		}
		return REDIRECTPATH;

	}

	/**
	 * 导出融资管理信息.
	 * 
	 * @param model
	 *            model
	 * @param request
	 *            请求对象
	 * @return 返回融资信息查询结果页面
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=export", method = RequestMethod.POST)
	public String exportAssemble(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(
				request, EntrustLoan.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("queryParams", paramterList);
		pageBean.setExport(true);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		// 获取页面起始日期
		String startDate = request.getParameter("startDate");
		// 获取页面截至日期
		String endDate = request.getParameter("endDate");
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		// 设置查询参数
		Object[] params = new Object[] { startDate, endDate };
		boolean isExport = true;
		CutPageBean cutPageBean = entrustLoanService
				.getDepartmentEntrustLoanPageBean(pageBean, paramterList,
						fwAccount, params, isExport);
		if (cutPageBean == null || cutPageBean.getDataList() == null
				|| cutPageBean.getDataList().size() == 0) {
			return Util.printErrorString("无可导出的数据或需要导出的数据未通过审核");
		}
		model.addAttribute("pageBean", cutPageBean);
		model.addAttribute("fileName", "委托贷款信息.xls");
		return EXPORTPAGEPATH;
	}

	/**
	 * 删除.
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String delete(@RequestParam("entrustLoanId") final Long id) {
		EntrustLoan entrustLoan = (EntrustLoan) entrustLoanService
				.getObjectById(EntrustLoan.class, id);
		if (entrustLoan != null) {
			entrustLoanService.delete(entrustLoan);
		}
		return REDIRECTPATH;
	}

	/**
	 * 提交或审核查询页面.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=querySubmitAudit")
	public String querySubmitAudit(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, EntrustLoan.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		String opType = request.getParameter("opType");
		model.addAttribute("opType", opType);
		// 获取页面起始日期
		String startDate = request.getParameter("startDate");
		// 获取页面截至日期
		String endDate = request.getParameter("endDate");
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		// 设置查询参数
		Object[] params = new Object[] { startDate, endDate, opType };
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("pageBean", entrustLoanService
				.getAuditSubmitEntrustLoanPageBean(pageBean, parameterList,
						params, fwAccount));
		return QUERYSUBMITDEPARTPAGEPATH;
	}

	/**
	 * 查询当前提交的审核信息.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=auditSubmitPreview", method = RequestMethod.GET)
	public String auditSubmit(final Model model,
			final HttpServletRequest request) {
		String entrustLoanId = request.getParameter("entrustLoanId");
		if (entrustLoanId != null && !"".equals(entrustLoanId)) {
			model.addAttribute(entrustLoanService.getObjectById(
					EntrustLoan.class, Long.valueOf(entrustLoanId)));
		}
		String opType = request.getParameter("opType");
		model.addAttribute("opType", opType);
		List<LoanReasonRecord> reasonList = entrustLoanService
				.getRejectReasonRecord(Long.valueOf(entrustLoanId));
		model.addAttribute("reasonList", reasonList);
		return AUDITSUBMITPAGEPATH;
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
			@RequestParam("id") final Long entrustLoanId) {
		entrustLoanService.confirmSubmit(entrustLoanId);
		String opType = request.getParameter("opType");
		return AUDITREDIRECTPATH + "&opType=" + opType;
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
			@RequestParam("id") final Long entrustLoanId, final String status)
			throws ParseException {
		String rejectReason = request.getParameter("rejectReason");
		if (Constant.LEADER_AUDIT_STATE_REBUT.equals(status)
				&& CommonUtil.isNotZeroLengthTrimString(rejectReason)) {
			// 驳回原因长度校验
			if (rejectReason.getBytes(Charset.forName("GBK")).length > 1000) {
				return Util.printErrorString("驳回原因长度不能超过1000个字符!");
			}
		}
		FwAccount account = ThreadLocalClient.get().getOperator();
		entrustLoanService.auditSubmit(entrustLoanId, status, rejectReason,
				account);
		String opType = request.getParameter("opType");
		return AUDITREDIRECTPATH + "&opType=" + opType;
	}

	/**
	 * initBinder方法.
	 * 
	 * @param dataBinder
	 *            dataBinder
	 */
	@InitBinder
	protected void initBinder(final WebDataBinder dataBinder) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
		dataBinder
				.registerCustomEditor(Date.class, "startRateDate", dateEditor);
		dataBinder.registerCustomEditor(Date.class, "endRateDate", dateEditor);
	}

	/**
	 * 数据校验.
	 * 
	 * @param financingDetail
	 * @param errors
	 */
	public static void validate(final EntrustLoan entrustLoan,
			final Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(entrustLoan.getLoanUser())) {
			errors.rejectValue("loanUser", "required", "required");
		}
		if (entrustLoan.getLoanMoney() == null) {
			errors.rejectValue("loanMoney", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(entrustLoan.getLoanBank())) {
			errors.rejectValue("loanBank", "required", "required");
		}
		if (entrustLoan.getContractRates() == null) {
			errors.rejectValue("contractRates", "required", "required");
		}
		if (entrustLoan.getRealRates() == null) {
			errors.rejectValue("realRates", "required", "required");
		}
		if (entrustLoan.getStartRateDate() == null) {
			errors.rejectValue("startRateDate", "required", "required");
		}
		if (entrustLoan.getEndRateDate() == null) {
			errors.rejectValue("endRateDate", "required", "required");
		}
		if (entrustLoan.getTimeLimit() == null) {
			errors.rejectValue("timeLimit", "required", "required");
		}
		if (entrustLoan.getEndInterestMode() == null) {
			errors.rejectValue("endInterestMode", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(entrustLoan.getLoanStatus())) {
			errors.rejectValue("loanStatus", "required", "required");
		}
		if (entrustLoan.getEndInterestDate() == null) {
			errors.rejectValue("endInterestDate", "required", "required");
		}
		ValidateFieldLength.validateMaxLength(errors, "loanUser", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "loanBank", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "remarks", 1000,
				"maxLimitLength", "输入超长。");
		if (entrustLoan.getStartRateDate() != null
				&& entrustLoan.getEndRateDate() != null) {
			if (entrustLoan.getStartRateDate().getTime() > entrustLoan
					.getEndRateDate().getTime()) {
				throw new BusinessRuntimeException("开始日期必须小于结束日期");
			}
		}
	}

	/**
	 * 查看付息明细.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=payInterestDetail")
	public String payInterestDetail(final Model model, Long entrustLoanId)
			throws ParseException {
		List<EntrustLoan> entrustLoanList = getShowList(model, entrustLoanId);
		model.addAttribute("entrustLoanList", entrustLoanList);
		model.addAttribute(entrustLoanService.getObjectById(EntrustLoan.class,
				entrustLoanId));
		return PAYINTERSTDETAILPAGEPATH;
	}

	/**
	 * 导出付息明细数据.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=exportPaymentInterst", method = RequestMethod.POST)
	public String exportPaymentInterst(final Model model,
			@RequestParam("entrustLoanId") final Long id) throws ParseException {
		List<EntrustLoan> entrustLoanList = this.getShowList(model, id);
		model.addAttribute("entrustLoanList", entrustLoanList);
		model.addAttribute("entrustLoan",
				entrustLoanService.getObjectById(EntrustLoan.class, id));
		model.addAttribute("fileName", "付息明细信息.xls");
		return EXPORTPAYMENTPAGEPATH;
	}

	/**
	 * 获取付息明细数据.
	 * 
	 * @param model
	 * @param entrustLoanId
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public List<EntrustLoan> getShowList(final Model model, Long entrustLoanId)
			throws ParseException {
		EntrustLoan entrustLoan = (EntrustLoan) entrustLoanService
				.getObjectById(EntrustLoan.class, entrustLoanId);
		Date startDate = entrustLoan.getStartRateDate();
		Date endDate = entrustLoan.getEndRateDate();

		String STD = FosUtil.getStringDate(startDate);
		String END = FosUtil.getStringDate(endDate);
		String endIntMode = entrustLoan.getEndInterestMode();
		// 计算利率
		BigDecimal interestRate = entrustLoan.getRealRates();
		BigDecimal totalMoney = entrustLoan.getLoanMoney();
		// 应还的利息总额
		BigDecimal rt = interestRate;
		List<EntrustLoan> entrustLoanList = new ArrayList<EntrustLoan>();
		// 如果是月结
		if (endIntMode.equals("1")) {
			List<String> payIntestPeroid = FosUtil.getPayInterstPeriodDate(STD,
					END, String.valueOf(entrustLoan.getEndInterestDate()));
			for (int j = 0; j < payIntestPeroid.size(); j++) {
				EntrustLoan detail = new EntrustLoan();
				String payIntestPeroidTime = payIntestPeroid.get(j);
				String[] twoDates = payIntestPeroidTime.split("~");
				String stDate1 = twoDates[0];
				String edDate1 = twoDates[1];
				int days = FosUtil.countDays(stDate1, edDate1) + 1;
				BigDecimal bday = new BigDecimal(days);
				BigDecimal paymentAmount = (rt.multiply(totalMoney)
						.multiply(bday)).divide(
						(new BigDecimal(Integer.parseInt(entrustLoan
								.getReplyPeriod()))
								.multiply(new BigDecimal(100))), 2,
						BigDecimal.ROUND_HALF_DOWN);
				detail.setPayAmount(paymentAmount);
				detail.setPayIntestDate(payIntestPeroidTime);
				detail.setRealRates((entrustLoan.getRealRates()));
				detail.setPayPeriod(entrustLoan.getReplyPeriod());
				entrustLoanList.add(detail);
			}
		}
		if (endIntMode.equals("2")) {
			List<String> payIntestPeroid = FosUtil
					.getPayInterstPeriodDateByQuater(STD, END,
							String.valueOf(entrustLoan.getEndInterestDate()));
			for (int j = 0; j < payIntestPeroid.size(); j++) {
				EntrustLoan detail = new EntrustLoan();
				String payIntestPeroidTime = payIntestPeroid.get(j);
				String[] twoDates = payIntestPeroidTime.split("~");
				String stDate1 = twoDates[0];
				String edDate1 = twoDates[1];
				int days = FosUtil.countDays(stDate1, edDate1) + 1;
				BigDecimal bday = new BigDecimal(days);
				BigDecimal paymentAmount = (rt.multiply(totalMoney)
						.multiply(bday)).divide(
						(new BigDecimal(Integer.parseInt(entrustLoan
								.getReplyPeriod()))
								.multiply(new BigDecimal(100))), 2,
						BigDecimal.ROUND_HALF_DOWN);
				detail.setPayAmount(paymentAmount);
				detail.setPayIntestDate(payIntestPeroidTime);
				detail.setRealRates((entrustLoan.getRealRates()));
				detail.setPayPeriod(entrustLoan.getReplyPeriod());
				entrustLoanList.add(detail);
			}
		}
		// 如果是年结
		if (endIntMode.equals("3")) {
			EntrustLoan detail = new EntrustLoan();
			int countDays = FosUtil.countDays(STD, END) + 1;
			BigDecimal bCountDays = new BigDecimal(countDays);
			BigDecimal paymentAmount = (rt.multiply(totalMoney)
					.multiply(bCountDays)).divide(
					(new BigDecimal(Integer.parseInt(entrustLoan
							.getReplyPeriod())).multiply(new BigDecimal(100))),
					2, BigDecimal.ROUND_HALF_DOWN);
			detail.setPayAmount(paymentAmount);
			String timePeriod = STD + "~" + END;
			detail.setPayIntestDate(timePeriod);
			detail.setRealRates((entrustLoan.getRealRates()));
			detail.setPayPeriod(entrustLoan.getReplyPeriod());
			entrustLoanList.add(detail);
		}
		return entrustLoanList;
	}
}
