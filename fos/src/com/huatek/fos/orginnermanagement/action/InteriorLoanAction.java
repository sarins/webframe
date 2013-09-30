/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-27 下午03:00:34
 * Author: allen_huang
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.orginnermanagement.action;

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

import com.huatek.fos.financingmanagement.entity.hibernate.FinancingDetail;
import com.huatek.fos.orginnermanagement.entity.hibernate.InteriorLoan;
import com.huatek.fos.orginnermanagement.service.InteriorLoanService;
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
 * @author: allen_huang
 * 
 * @version $Id: InteriorLoanAction.java, v 0.1 2013-5-21 下午03:00:34 $
 * 
 *          Comment: 集团内部借款控制器.
 */
@Controller
@RequestMapping("/orgInner.do")
@SessionAttributes(types = InteriorLoan.class)
public class InteriorLoanAction {

	@Autowired
	private InteriorLoanService interiorLoanService;

	// 集团内部借款列表页面路径
	private static final String QUERYAGEPATH = "fos/orginnermanagement/interiorLoan_list.jsp";
	// 集团内部借款审核提交前列表页面路径
	private static final String QUERYSUBMITAGEPATH = "fos/orginnermanagement/interiorLoan_submit_list.jsp";
	// 集团内部借款审核提交前列表页面路径
	private static final String QUERYAUDITAGEPATH = "fos/orginnermanagement/interiorLoan_audit_list.jsp";
	// 集团内部借款编辑页面路径
	private static final String EDITPAGEPATH = "fos/orginnermanagement/interiorLoan_edit.jsp";
	// 集团内部借款审核提交页面路径
	private static final String AUDITSUBMITPAGEPATH = "fos/orginnermanagement/interiorLoan_view.jsp";
	// 集团内部借款审核页面路径
	private static final String AUDITPAGEPATH = "fos/orginnermanagement/interiorLoan_audit.jsp";
	// 集团内部借款查询条件页面路径
	private static final String QUERYDEPARTPAGEPATH = "fos/orginnermanagement/interiorLoan_query.jsp";
	// 集团内部借款审核提交前查询条件页面路径
	private static final String QUERYSUBMITDEPARTPAGEPATH = "fos/orginnermanagement/interiorLoan_submit_query.jsp";
	// 集团内部借款审核查询条件页面路径
	private static final String QUERYAUDITDEPARTPAGEPATH = "fos/orginnermanagement/interiorLoan_audit_query.jsp";
	// 重定向至新增页面查询路径
	private static final String REDIRECTPATH = "redirect:orgInner.do?actionMethod=editQuery";
	// 重定集团内部借款审核提交前查询路径
	private static final String AUDITREDIRECTPATH = "redirect:orgInner.do?actionMethod=querySubmit";
	// 付息名字页面路径
	private static final String PAYINTERSTDETAILPAGEPATH = "fos/popup/interiorLoanPayDetaillPopup_list.jsp";
	// 导出页面路径
	private static final String EXPORT_PAGE_PATH = "fos/orginnermanagement/interiorLoan_export_excel.jsp";
	// 导出付息明细页面路径
	private static final String EXPORT_PAYMENT_PAGE_PATH = "fos/popup/interior_pay_export_excel.jsp";

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
				request, InteriorLoan.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		boolean isExport = false;
		model.addAttribute("pageBean", interiorLoanService
				.getCurrAcctInteriorLoanPageBean(pageBean, parameterList,
						fwAccount, params, isExport));
		return QUERYAGEPATH;
	}

	/**
	 * 查询审核提交前的数据.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=querySubmit", method = RequestMethod.GET)
	public String querySubmit(final Model model,
			final HttpServletRequest request) {
		return QUERYSUBMITDEPARTPAGEPATH;
	}

	/**
	 * 查询登录用户所在部门全部数据.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=querySubmit", method = RequestMethod.POST)
	public String doQuerySubmit(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 获取页面起始日期
		String startDate = request.getParameter("startDate");
		// 获取页面截至日期
		String endDate = request.getParameter("endDate");
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		// 设置查询参数
		Object[] params = new Object[] { startDate, endDate };
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, InteriorLoan.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("pageBean", interiorLoanService
				.getInteriorLoanPageBean(pageBean, parameterList, fwAccount,
						params));
		return QUERYSUBMITAGEPATH;
	}

	/**
	 * 查询需要审核的全部数据.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=queryAudit", method = RequestMethod.GET)
	public String queryAudit(final Model model, final HttpServletRequest request) {

		return QUERYAUDITDEPARTPAGEPATH;
	}

	/**
	 * 查询需要审核的全部数据.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=queryAudit", method = RequestMethod.POST)
	public String doQueryAudit(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 获取页面起始日期
		String startDate = request.getParameter("startDate");
		// 获取页面截至日期
		String endDate = request.getParameter("endDate");
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		// 设置查询参数
		Object[] params = new Object[] { startDate, endDate };
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, InteriorLoan.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("pageBean", interiorLoanService
				.getInteriorAuditPageBean(pageBean, parameterList, fwAccount,
						params));
		return QUERYAUDITAGEPATH;
	}

	/**
	 * 查询当前提交的审核信息.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=auditSubmit", method = RequestMethod.GET)
	public String auditSubmit(@RequestParam("interiorId") final Long id,
			final Model model, final HttpServletRequest request) {

		model.addAttribute(interiorLoanService.getObjectById(
				InteriorLoan.class, Long.valueOf(id)));
		model.addAttribute("ioanReasonRecord",
				interiorLoanService.getReasonsById(Long.valueOf(id)));

		return AUDITSUBMITPAGEPATH;
	}

	/**
	 * 查询当前需要审核的信息.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=audit", method = RequestMethod.GET)
	public String audit(@RequestParam("interiorId") final Long id,
			final Model model, final HttpServletRequest request) {
		model.addAttribute(interiorLoanService.getObjectById(
				InteriorLoan.class, Long.valueOf(id)));
		model.addAttribute("ioanReasonRecord",
				interiorLoanService.getReasonsById(Long.valueOf(id)));

		return AUDITPAGEPATH;
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
	@RequestMapping(params = "actionMethod=audit", method = RequestMethod.POST)
	public String doAudit(final Model model, final HttpServletRequest request,
			@RequestParam("interiorId") final Long id, final String status)
			throws ParseException {
		String rejectReason = request.getParameter("rejectReason");
		if (Constant.LEADER_AUDIT_STATE_REBUT.equals(status)
				&& CommonUtil.isNotZeroLengthTrimString(rejectReason)) {
			// 驳回原因长度校验
			if (rejectReason.getBytes(Charset.forName("GBK")).length > 1000) {
				return Util.printErrorString("驳回原因长度不能超过1000个字符!");
			}

		}
		interiorLoanService.auditSubmit(id, status, rejectReason);

		return QUERYAUDITDEPARTPAGEPATH;
	}

	/**
	 * 对提交的审核信息进行审核.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=auditSubmit", method = RequestMethod.POST)
	public String doAuditSubmit(@RequestParam("interiorId") final Long id,
			final Model model, final HttpServletRequest request) {

		interiorLoanService.confirmSubmit(Long.valueOf(id));

		return AUDITREDIRECTPATH;
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
		String interiorId = request.getParameter("interiorId");
		if (CommonUtil.isZeroLengthTrimString(interiorId)) {
			InteriorLoan interiorLoan = new InteriorLoan();
			interiorLoan.setEndInterestDate(Long.valueOf(20));
			model.addAttribute(interiorLoan);
		} else {
			model.addAttribute(interiorLoanService.getObjectById(
					InteriorLoan.class, Long.valueOf(interiorId)));
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
				request, InteriorLoan.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("pageBean", interiorLoanService.getInteriorPageBean(
				pageBean, parameterList, fwAccount));
		return QUERYAGEPATH;
	}

	/**
	 * 保存或者新增数据.
	 * 
	 * @param model
	 * @param InteriorLoan
	 * @param result
	 * @param status
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEdit(final Model model,
			@ModelAttribute final InteriorLoan interiorLoan,
			final BindingResult result, final SessionStatus status,
			final HttpServletRequest request) throws ParseException {

		// 比较起息日小于到期日
		String startRateDate = request.getParameter("startRateDate");
		String endRateDate = request.getParameter("endRateDate");
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		if (CommonUtil.isNotZeroLengthTrimString(startRateDate)
				&& CommonUtil.isNotZeroLengthTrimString(endRateDate)) {
			Date startDate1 = df.parse(startRateDate);
			Date endDate1 = df.parse(endRateDate);
			if (startDate1.getTime() > endDate1.getTime()) {
				throw new BusinessRuntimeException("起息日必须小于到期日。");
			}
		}

		// 比较延期起始日小于延期截至日
		String delayStartDate = request.getParameter("delayStartDate");
		String delayEndDate = request.getParameter("delayEndDate");
		if (CommonUtil.isNotZeroLengthTrimString(delayStartDate)
				&& CommonUtil.isNotZeroLengthTrimString(delayEndDate)) {
			Date delayStartDate1 = df.parse(delayStartDate);
			Date delayEndDate1 = df.parse(delayEndDate);
			if (delayStartDate1.getTime() > delayEndDate1.getTime()) {
				throw new BusinessRuntimeException("延期起始日必须小于延期截至日。");
			}
		}

		validate(interiorLoan, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,
					"interiorLoanForm"));
		}
		if (interiorLoanService.saveOrUpdateInteriorLoan(interiorLoan)) {
			status.setComplete();
		}
		return REDIRECTPATH;

	}

	/**
	 * 删除.
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") final Long id) {
		InteriorLoan interiorLoan = (InteriorLoan) interiorLoanService
				.getObjectById(InteriorLoan.class, id);
		if (interiorLoan != null) {
			interiorLoanService.delete(interiorLoan);
		}
		return REDIRECTPATH;
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
		dataBinder.registerCustomEditor(Date.class, "delayStartDate",
				dateEditor);
		dataBinder.registerCustomEditor(Date.class, "delayEndDate", dateEditor);
	}

	/**
	 * 数据校验.
	 * 
	 * @param financingDetail
	 * @param errors
	 */
	public static void validate(final InteriorLoan interiorLoan,
			final Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(interiorLoan.getLoanUser())) {
			errors.rejectValue("loanUser", "required", "required");
		}
		if (interiorLoan.getLoanMoney() == null) {
			errors.rejectValue("loanMoney", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(interiorLoan.getLoanBank())) {
			errors.rejectValue("loanBank", "required", "required");
		}
		if (interiorLoan.getContractRates() == null) {
			errors.rejectValue("contractRates", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(interiorLoan.getRealRates())) {
			errors.rejectValue("realRates", "required", "required");
		}
		if (interiorLoan.getStartRateDate() == null) {
			errors.rejectValue("startRateDate", "required", "required");
		}
		if (interiorLoan.getEndRateDate() == null) {
			errors.rejectValue("endRateDate", "required", "required");
		}
		if (CommonUtil
				.isZeroLengthTrimString(interiorLoan.getEndInterestMode())) {
			errors.rejectValue("endInterestMode", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(interiorLoan.getLoanStatus())) {
			errors.rejectValue("loanStatus", "required", "required");
		}
		ValidateFieldLength.validateMaxLength(errors, "loanUser", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "loanBank", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "remarks", 1000,
				"maxLimitLength", "输入超长。");

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
	public String payInterestDetail(@RequestParam("interiorId") final Long id,
			final Model model, HttpServletRequest request)
			throws ParseException {
		List<InteriorLoan> interiorLoanList = this.getShowList(model, id);

		model.addAttribute("interiorLoanList", interiorLoanList);
		model.addAttribute(interiorLoanService.getObjectById(
				InteriorLoan.class, id));
		return PAYINTERSTDETAILPAGEPATH;

	}

	@SuppressWarnings("unchecked")
	private List<InteriorLoan> getShowList(Model model, Long id)
			throws ParseException {

		InteriorLoan interiorLoan = (InteriorLoan) interiorLoanService
				.getObjectById(InteriorLoan.class, id);
		Date startDate = interiorLoan.getStartRateDate();
		Date endDate = interiorLoan.getEndRateDate();

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String STD = df.format(startDate);
		String END = df.format(endDate);
		String endIntMode = interiorLoan.getEndInterestMode();
		// 计算利率
		float interestRate = Float.parseFloat(interiorLoan.getRealRates());
		BigDecimal totalMoney = interiorLoan.getLoanMoney();
		// 应还的利息总额
		BigDecimal rt = new BigDecimal(interestRate);
		List<InteriorLoan> interiorLoanList = new ArrayList<InteriorLoan>();
		if (endIntMode.equals("1")) {
			List<String> payIntestPeroid = FosUtil.getPayInterstPeriodDate(STD,
					END, String.valueOf(interiorLoan.getEndInterestDate()));
			for (int j = 0; j < payIntestPeroid.size(); j++) {
				InteriorLoan detail = new InteriorLoan();
				String payIntestPeroidTime = payIntestPeroid.get(j);
				detail.setPayIntestDate(payIntestPeroidTime);
				String[] twoDates = payIntestPeroidTime.split("~");
				String stDate1 = twoDates[0];
				String edDate1 = twoDates[1];
				int days = FosUtil.countDays(stDate1, edDate1) + 1;
				BigDecimal bday = new BigDecimal(days);
				BigDecimal paymentAmount = (rt.multiply(totalMoney)
						.multiply(bday)).divide(
						(new BigDecimal(interiorLoan.getRepayPeriod())
								.multiply(new BigDecimal(100))), 2,
						BigDecimal.ROUND_HALF_DOWN);
				detail.setPayAmount(paymentAmount);
				detail.setPayIntestDate(payIntestPeroidTime);
				detail.setRealRates((interiorLoan.getRealRates()));
				detail.setPayPeriod(interiorLoan.getRepayPeriod());
				interiorLoanList.add(detail);

			}
		} else if (endIntMode.equals("2")) {
			List<String> payIntestPeroid = FosUtil
					.getPayInterstPeriodDateByQuater(STD, END,
							String.valueOf(interiorLoan.getEndInterestDate()));
			for (int j = 0; j < payIntestPeroid.size(); j++) {
				InteriorLoan detail = new InteriorLoan();
				String payIntestPeroidTime = payIntestPeroid.get(j);
				detail.setPayIntestDate(payIntestPeroidTime);
				String[] twoDates = payIntestPeroidTime.split("~");
				String stDate1 = twoDates[0];
				String edDate1 = twoDates[1];
				int days = FosUtil.countDays(stDate1, edDate1) + 1;
				BigDecimal bday = new BigDecimal(days);
				BigDecimal paymentAmount = (rt.multiply(totalMoney)
						.multiply(bday)).divide(
						(new BigDecimal(interiorLoan.getRepayPeriod())
								.multiply(new BigDecimal(100))), 2,
						BigDecimal.ROUND_HALF_DOWN);
				detail.setPayAmount(paymentAmount);
				detail.setPayIntestDate(payIntestPeroidTime);
				detail.setRealRates((interiorLoan.getRealRates()));
				detail.setPayPeriod(interiorLoan.getRepayPeriod());
				interiorLoanList.add(detail);

			}
		} else if (endIntMode.equals("3")) {
			InteriorLoan detail = new InteriorLoan();
			int countDays = FosUtil.countDays(STD, END) + 1;
			BigDecimal bCountDays = new BigDecimal(countDays);
			BigDecimal paymentAmount = (rt.multiply(totalMoney)
					.multiply(bCountDays)).divide(
					(new BigDecimal(interiorLoan.getRepayPeriod())
							.multiply(new BigDecimal(100))), 2,
					BigDecimal.ROUND_HALF_DOWN);
			detail.setPayAmount(paymentAmount);
			String timePeriod = STD + "~" + END;
			detail.setPayIntestDate(timePeriod);
			detail.setRealRates((interiorLoan.getRealRates()));
			detail.setPayPeriod(interiorLoan.getRepayPeriod());
			interiorLoanList.add(detail);
		}
		return interiorLoanList;
	}

	/**
	 * 导出
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=export", method = RequestMethod.POST)
	public String exportAssemble(final Model model,
			final HttpServletRequest request) throws ParseException {

		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, InteriorLoan.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("queryParams", parameterList);
		model.addAttribute("success", request.getParameter("success"));
		pageBean.setExport(true);
		// 获取页面起始日期
		String startDate = request.getParameter("startDate");
		// 获取页面截至日期
		String endDate = request.getParameter("endDate");
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		// 设置查询参数
		Object[] params = new Object[] { startDate, endDate };
		boolean isExport = true;
		CutPageBean cutPageBean = interiorLoanService
				.getCurrAcctInteriorLoanPageBean(pageBean, parameterList,
						fwAccount, params, isExport);
		if (cutPageBean == null || cutPageBean.getDataList() == null
				|| cutPageBean.getDataList().size() == 0) {
			return Util.printErrorString("无可导出的数据或需要导出的数据未通过审核!");
		}
		model.addAttribute("pageBean", cutPageBean);
		model.addAttribute("fileName", "集团内部借款信息.xls");
		return EXPORT_PAGE_PATH;
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
			@RequestParam("interiorId") final Long id) throws ParseException {
		List interiorLoanList = this.getShowList(model, id);
		model.addAttribute("interiorLoanList", interiorLoanList);
		model.addAttribute(interiorLoanService.getObjectById(
				InteriorLoan.class, id));
		model.addAttribute("fileName", "付息明细信息.xls");
		return EXPORT_PAYMENT_PAGE_PATH;

	}
}
