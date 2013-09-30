/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-21 下午03:00:34
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.financingmanagement.action;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import com.huatek.fos.financingmanagement.service.FinancingDetailService;
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
 * @author: apple_liu
 * 
 * @version $Id: FinancingDetailAction.java, v 0.1 2013-5-21 下午03:00:34 $
 * 
 *          Comment: 请类用来管理融资管理信息.
 */
@Controller
@RequestMapping("/financing.do")
@SessionAttributes(types = FinancingDetail.class)
public class FinancingDetailAction {

	@Autowired
	private FinancingDetailService financingDetailService;

	// 融资管理编辑列表页面路径
	private static final String QUERYAGEPATH = "fos/financingmanagement/financingOperator_list.jsp";
	// 融资管理编辑页面路径
	private static final String EDITPAGEPATH = "fos/financingmanagement/financing_edit.jsp";
	// 融资管理部门查询条件页面路径
	private static final String QUERYDEPARTPAGEPATH = "fos/financingmanagement/financingDepartment_query.jsp";
	// 重定向至新增页面查询路径
	private static final String REDIRECTPATH = "redirect:financing.do?actionMethod=editQuery";
	// 查看历史详情页面
	private static final String VIEWHISTORYPAGEPATH = "fos/popup/viewHistoryPopup_list.jsp";
	// 查看付息详情页面
	private static final String PAYInterstDetailPAGEPATH = "fos/popup/payInterstDetailPopup_list.jsp";
	// 融资信息导出页面
	private static final String EXPORTPAGEPATH = "fos/financingmanagement/financingDetail_export_excel.jsp";
	// 付息明细页面导出页面
	private static final String EXPORTPAYMENTPAGEPATH = "fos/popup/paymentInterst_export_excel.jsp";

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
		// 获取页面起始日期
		String startDate = request.getParameter("startDate");
		// 获取页面截至日期
		String endDate = request.getParameter("endDate");
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);

		String superQuery = request.getParameter("superQuery");
		model.addAttribute("superQuery", superQuery);
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, FinancingDetail.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("pageBean", financingDetailService
				.getDepartmentFinancingPageBean(pageBean, parameterList,
						fwAccount, startDate, endDate));
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
		// 根据Id判断是新增还是修改
		String financingId = request.getParameter("financingId");
		if (CommonUtil.isZeroLengthTrimString(financingId)) {
			FinancingDetail financingDetail = new FinancingDetail();
			financingDetail.setEndIntDate(Long.valueOf(20));
			model.addAttribute(financingDetail);
		} else {
			model.addAttribute(financingDetailService.getObjectById(
					FinancingDetail.class, Long.valueOf(financingId)));
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
		String superQuery = request.getParameter("superQuery");
		model.addAttribute("superQuery", superQuery);
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, FinancingDetail.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("pageBean", financingDetailService
				.getCurrAcctFinancingPageBean(pageBean, parameterList,
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
			@ModelAttribute final FinancingDetail financingDetail,
			final BindingResult result, final SessionStatus status,
			final HttpServletRequest request) throws ParseException {
		validate(financingDetail, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,
					"financingDetailForm"));
		}
		if (financingDetail.getId() != null) {
			if (financingDetail.getIsChangeRate().equals(
					Constant.IS_CHANGE_RATE_YES)) {
				FinancingDetail detail = (FinancingDetail) financingDetailService
						.getObjectById(FinancingDetail.class,
								financingDetail.getId());
				if (financingDetail.getStartDate().getTime() <= detail
						.getStartDate().getTime()) {
					return Util.printErrorString("更改利率之后的开始日期必须大于原始数据的开始日期！");
				}
				if (financingDetail.getInterestRate().equals(
						detail.getInterestRate())) {
					return Util.printErrorString("利率没有做调整！");
				}
			}
		}
		int saveStatus = financingDetailService
				.saveOrUpdateFinancing(financingDetail);
		if (saveStatus == 1) {
			result.rejectValue("contactNumber", "error.check.duplicate",
					"合同编码已存在！");
			return Util.printErrorString(Util.getErrorMsgInfo(result,
					"financingDetailForm"));
		}
		if (saveStatus == 0) {
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
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") final Long id) {
		FinancingDetail financingDetail = (FinancingDetail) financingDetailService
				.getObjectById(FinancingDetail.class, id);
		Long oldId = financingDetail.getOriginalId();
		List<FinancingDetail> allRelatedDatasList = financingDetailService
				.getAllRelatedDatesWithRecName(oldId);
		if (allRelatedDatasList != null && allRelatedDatasList.size() > 0) {
			for (int i = 0; i < allRelatedDatasList.size(); i++) {
				financingDetailService.delete(allRelatedDatasList.get(i));
			}
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
		dataBinder.registerCustomEditor(Date.class, "startDate", dateEditor);
		dataBinder.registerCustomEditor(Date.class, "endDate", dateEditor);
		dataBinder.registerCustomEditor(Date.class, "earlyReplyDate",
				dateEditor);
	}

	/**
	 * 数据校验.
	 * 
	 * @param financingDetail
	 * @param errors
	 */
	public static void validate(final FinancingDetail financingDetail,
			final Errors errors) {
		if (CommonUtil
				.isZeroLengthTrimString(financingDetail.getInfoCategory())) {
			errors.rejectValue("infoCategory", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(financingDetail.getMecCategory())) {
			errors.rejectValue("mecCategory", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(financingDetail.getMecName())) {
			errors.rejectValue("mecName", "required", "required");
		}
		if (financingDetail.getFinancingMoney() == null) {
			errors.rejectValue("financingMoney", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(financingDetail.getEndIntMode())) {
			errors.rejectValue("endIntMode", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(financingDetail.getEndIntDate()
				.toString())) {
			errors.rejectValue("endIntDate", "required", "required");
		}
		if (CommonUtil
				.isZeroLengthTrimString(financingDetail.getIsChangeRate())) {
			errors.rejectValue("isChangeRate", "required", "required");
		}
		if (CommonUtil
				.isZeroLengthTrimString(financingDetail.getInterestRate())) {
			errors.rejectValue("interestRate", "required", "required");
		} else {
			String intrestRate = financingDetail.getInterestRate();
			Pattern p = Pattern.compile(Constant.REGULAR_EXPRESSION_FLOAT_HAS0);
			Matcher m = p.matcher(intrestRate);
			if (!m.matches()) {
				throw new BusinessRuntimeException("利率必须为正浮点数");
			}
		}
		if (CommonUtil.isZeroLengthTrimString(financingDetail
				.getIsAdvanceReply())) {
			errors.rejectValue("isAdvanceReply", "required", "required");
		}
		if (financingDetail.getStartDate() == null) {
			errors.rejectValue("startDate", "required", "required");
		}
		if (financingDetail.getEndDate() == null) {
			errors.rejectValue("endDate", "required", "required");
		}
		if (financingDetail.getStartDate() != null
				&& financingDetail.getEndDate() != null) {
			if (financingDetail.getStartDate().getTime() > financingDetail
					.getEndDate().getTime()) {
				throw new BusinessRuntimeException("开始日期必须小于结束日期");
			}
		}
		if (financingDetail.getTimeLimit() != null) {
			Long timeLimit = financingDetail.getTimeLimit();
			Pattern p = Pattern.compile(Constant.REGULAR_EXPRESSION_INTEGER);
			Matcher m = p.matcher(String.valueOf(timeLimit));
			if (!m.matches()) {
				throw new BusinessRuntimeException("期限必须为正整数！");
			}
		}
		if (CommonUtil.isZeroLengthTrimString(financingDetail.getReplyPeriod())) {
			errors.rejectValue("replyPeriod", "required", "required");
		}
		// 如果信息类别为融资，则合同编码不能为空.
		if (financingDetail.getInfoCategory().equals(
				Constant.FINANCING_INFO_CATEGORY)) {
			if (CommonUtil.isZeroLengthTrimString(financingDetail
					.getContactNumber())) {
				errors.rejectValue("contactNumber", "required", "required");
			}
		}
		ValidateFieldLength.validateMaxLength(errors, "remark", 1000,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "contactNumber", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "mecName", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "guarantee", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "financingCategory", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "rateAdjustMode", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "mortMode", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "use", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "mecCategory", 200,
				"maxLimitLength", "输入超长。");
	}

	/**
	 * 根据oldId关联出历史数据.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=viewHistory")
	public String viewHistory(final Model model, HttpServletRequest request) {
		// 获取查看历史数据的参数Id
		String financeId = request.getParameter("financeId");
		FinancingDetail financingDetail = (FinancingDetail) financingDetailService
				.getObjectById(FinancingDetail.class, Long.valueOf(financeId));
		Long oldId = financingDetail.getOriginalId();
		Object[] params = new Object[] { oldId };
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, FinancingDetail.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("pageBean", financingDetailService.getHistoryData(
				pageBean, parameterList, params));
		return VIEWHISTORYPAGEPATH;

	}

	/**
	 * 查看付息明细.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=payInterestDetail")
	public String payInterestDetail(final Model model,
			@RequestParam("financeId") final Long id) throws ParseException {
		List<FinancingDetail> financingDetailList = this.getShowList(model, id);
		model.addAttribute("financingDetailList", financingDetailList);
		model.addAttribute(financingDetailService.getObjectById(
				FinancingDetail.class, id));
		return PAYInterstDetailPAGEPATH;

	}

	/**
	 * 公共的方法,获取季付或者月付的时间段.
	 * 
	 * @param model
	 * @param financeId
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public List<FinancingDetail> getShowList(final Model model,
			final Long financeId) throws ParseException {
		FinancingDetail financingDetail = (FinancingDetail) financingDetailService
				.getObjectById(FinancingDetail.class, financeId);
		Date startDate = financingDetail.getStartDate();
		Date endDate = null;
		if (financingDetail.getRealEndDate() != null) {
			endDate = financingDetail.getRealEndDate();
		} else {
			endDate = financingDetail.getEndDate();
		}
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String STD = df.format(startDate);
		String END = df.format(endDate);
		String endIntMode = financingDetail.getEndIntMode();
		// 计算利率
		float interestRate = Float
				.parseFloat(financingDetail.getInterestRate());
		BigDecimal totalMoney = financingDetail.getFinancingMoney();
		int replyPeriod = Integer.parseInt(financingDetail.getReplyPeriod());
		// 应还的利息总额
		BigDecimal rt = new BigDecimal(interestRate);
		List<FinancingDetail> financingDetailList = new ArrayList<FinancingDetail>();
		// 如果是月结
		if (endIntMode.equals("1")) {
			List<String> payIntestPeroid = FosUtil.getPayInterstPeriodDate(STD,
					END, String.valueOf(financingDetail.getEndIntDate()));
			for (int j = 0; j < payIntestPeroid.size(); j++) {
				FinancingDetail detail = new FinancingDetail();
				String payIntestPeroidTime = payIntestPeroid.get(j);
				detail.setPayIntestDate(payIntestPeroidTime);
				String[] twoDates = payIntestPeroidTime.split("~");
				String stDate1 = twoDates[0];
				String edDate1 = twoDates[1];
				int days = FosUtil.countDays(stDate1, edDate1) + 1;
				BigDecimal bday = new BigDecimal(days);
				BigDecimal paymentAmount = (rt.multiply(totalMoney)
						.multiply(bday)).divide((new BigDecimal(replyPeriod)
						.multiply(new BigDecimal(100))), 2,
						BigDecimal.ROUND_HALF_DOWN);
				detail.setPayAmount(paymentAmount);
				detail.setPayIntestDate(payIntestPeroidTime);
				detail.setInterestRate(financingDetail.getInterestRate());
				detail.setReplyPeriod(financingDetail.getReplyPeriod());
				financingDetailList.add(detail);
			}
		}
		// 如果是季结
		if (endIntMode.equals("2")) {
			List<String> payIntestPeroid = FosUtil
					.getPayInterstPeriodDateByQuater(STD, END,
							String.valueOf(financingDetail.getEndIntDate()));
			for (int j = 0; j < payIntestPeroid.size(); j++) {
				FinancingDetail detail = new FinancingDetail();
				String payIntestPeroidTime = payIntestPeroid.get(j);
				detail.setPayIntestDate(payIntestPeroidTime);
				String[] twoDates = payIntestPeroidTime.split("~");
				String stDate1 = twoDates[0];
				String edDate1 = twoDates[1];
				int days = FosUtil.countDays(stDate1, edDate1) + 1;
				BigDecimal bday = new BigDecimal(days);
				BigDecimal paymentAmount = (rt.multiply(totalMoney)
						.multiply(bday)).divide((new BigDecimal(replyPeriod)
						.multiply(new BigDecimal(100))), 2,
						BigDecimal.ROUND_HALF_DOWN);
				detail.setPayAmount(paymentAmount);
				detail.setPayIntestDate(payIntestPeroidTime);
				detail.setInterestRate(financingDetail.getInterestRate());
				detail.setReplyPeriod(financingDetail.getReplyPeriod());
				financingDetailList.add(detail);
			}
		}
		// 如果是年结
		if (endIntMode.equals("3")) {
			FinancingDetail detail = new FinancingDetail();
			int countDays = FosUtil.countDays(STD, END) + 1;
			BigDecimal bCountDays = new BigDecimal(countDays);
			BigDecimal paymentAmount = (rt.multiply(totalMoney)
					.multiply(bCountDays))
					.divide((new BigDecimal(replyPeriod)
							.multiply(new BigDecimal(100))), 2,
							BigDecimal.ROUND_HALF_DOWN);
			detail.setPayAmount(paymentAmount);
			String timePeriod = STD + "~" + END;
			detail.setPayIntestDate(timePeriod);
			detail.setInterestRate(financingDetail.getInterestRate());
			detail.setReplyPeriod(financingDetail.getReplyPeriod());
			financingDetailList.add(detail);
		}
		return financingDetailList;

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
				request, FinancingDetail.class);
		// 获取页面起始日期
		String startDate = request.getParameter("startDate");
		// 获取页面截至日期
		String endDate = request.getParameter("endDate");
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("queryParams", paramterList);
		model.addAttribute("success", request.getParameter("success"));
		pageBean.setExport(true);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		CutPageBean financPaggBean = financingDetailService.getExportPageBean(
				pageBean, paramterList, fwAccount, startDate, endDate);
		if (financPaggBean == null || financPaggBean.getDataList() == null
				|| financPaggBean.getDataList().size() == 0) {
			return Util.printErrorString("无可导出的报表！");
		}
		model.addAttribute("pageBean", financPaggBean);
		model.addAttribute("fileName", "融资信息.xls");
		return EXPORTPAGEPATH;
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
			@RequestParam("financeId") final Long id) throws ParseException {
		List financingDetailList = this.getShowList(model, id);
		model.addAttribute("financingDetailList", financingDetailList);
		model.addAttribute("financingDetail",
				financingDetailService.getObjectById(FinancingDetail.class, id));
		model.addAttribute("fileName", "付息明细信息.xls");
		return EXPORTPAYMENTPAGEPATH;

	}
}
