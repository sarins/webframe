/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-28 下午12:34:02
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.authorizationmanagement.action;

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

import com.huatek.fos.authorizationmanagement.entity.hibernate.SecurityAuthorization;
import com.huatek.fos.authorizationmanagement.service.SecurityAuthorizationService;
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
 * @version $Id: SecurityAuthorization.java, v 0.1 2013-5-28 下午12:34:02 $
 * 
 *          Comment: 请类用来管理担保授信相关信息.
 */
@Controller
@RequestMapping("/securityAuthorization.do")
@SessionAttributes(types = SecurityAuthorization.class)
public class SecurityAuthorizationAction {

	/**
	 * 担保授信的service.
	 */
	@Autowired
	private SecurityAuthorizationService securityAuthorizationService;
	// 担保授信编辑页面路径.
	private static final String EDITPAGEPATH = "fos/securityauthorization/securityAuthorization_edit_query.jsp";
	// 担保授信列表页面路径.
	private static final String QUERYPAGELISTPATH = "fos/securityauthorization/securityAuthorization_list.jsp";
	// 担保授信查询条件页面路径.
	private static final String QUERYPAGEPATH = "fos/securityauthorization/securityAuthorization_query.jsp";
	// 重定向路径.
	private static final String REDIRECTPATH = "redirect:securityAuthorization.do?actionMethod=editQuery";
	// 担保信息导出页面
	private static final String EXPORTPAGEPATH = "fos/securityauthorization/securityAuthorization_export_excel.jsp";

	/**
	 * 查询当前登录用户表头数据.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.GET)
	public String editQuery(final Model model, final HttpServletRequest request) {
		String securityAuthoryId = request.getParameter("securityAuthoryId");
		if (CommonUtil.isZeroLengthTrimString(securityAuthoryId)) {
			model.addAttribute(new SecurityAuthorization());
		} else {
			model.addAttribute(securityAuthorizationService.getObjectById(
					SecurityAuthorization.class,
					Long.valueOf(securityAuthoryId)));
		}
		return EDITPAGEPATH;
	}

	/**
	 * 查询当前登录用户数据列表.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.POST)
	public String doEditQuery(final Model model, HttpServletRequest request) {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SecurityAuthorization.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("pageBean", securityAuthorizationService
				.getSecurityAuthorizationForOperator(pageBean, parameterList,
						fwAccount));
		return QUERYPAGELISTPATH;

	}

	/**
	 * 查询条件页面.
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.GET)
	public String query(final Model model) {
		return QUERYPAGEPATH;
	}

	/***
	 * 查询当前登录用户所在部分全部数据.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.POST)
	public String doQuery(final Model model, final HttpServletRequest request)
			throws ParseException {
		// 获取页面起始日期
		String startDate = request.getParameter("eventInitialDate");
		// 获取页面截至日期
		String endDate = request.getParameter("eventEndDate");
		model.addAttribute("eventInitialDate", startDate);
		model.addAttribute("eventEndDate", endDate);
		String superQuery = request.getParameter("superQuery");
		model.addAttribute("superQuery", superQuery);
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SecurityAuthorization.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("pageBean", securityAuthorizationService
				.getSecurityAuthorizationCurrGroup(pageBean, parameterList,
						fwAccount, startDate, endDate));
		return QUERYPAGELISTPATH;

	}

	/***
	 * 保存修改担保授信数据.
	 * 
	 * @param model
	 * @param securityAuthorization
	 * @param result
	 * @param status
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEdit(final Model model,
			@ModelAttribute final SecurityAuthorization securityAuthorization,
			final BindingResult result, final SessionStatus status,
			HttpServletRequest request) throws ParseException {
		validate(securityAuthorization, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,
					"securityAuthorizationForm"));
		}
		if (securityAuthorizationService
				.saveOrUpdateSecurityAuthorizaition(securityAuthorization)) {
			status.setComplete();
		}
		return REDIRECTPATH;

	}

	/**
	 * 删除数据.
	 */
	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") final Long id) {
		SecurityAuthorization securityAuthorization = (SecurityAuthorization) securityAuthorizationService
				.getObjectById(SecurityAuthorization.class, id);
		if (securityAuthorization != null) {
			securityAuthorizationService.delete(securityAuthorization);
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
		dataBinder.registerCustomEditor(Date.class, "eventInitialDate",
				dateEditor);
		dataBinder.registerCustomEditor(Date.class, "eventEndDate", dateEditor);
	}

	/**
	 * 数据校验.
	 * 
	 * @param securityAuthorization
	 * @param errors
	 */
	public static void validate(
			final SecurityAuthorization securityAuthorization,
			final Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(securityAuthorization
				.getCategoryType())) {
			errors.rejectValue("categoryType", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(securityAuthorization
				.getEventStatus())) {
			errors.rejectValue("eventStatus", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(securityAuthorization
				.getEventName())) {
			errors.rejectValue("eventName", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(securityAuthorization
				.getDrawType())) {
			errors.rejectValue("drawType", "required", "required");
		}
		if (securityAuthorization.getEventInitialDate() == null) {
			errors.rejectValue("eventInitialDate", "required", "required");
		}
		if (securityAuthorization.getEventEndDate() == null) {
			errors.rejectValue("eventEndDate", "required", "required");
		}
		if (securityAuthorization.getEventInitialDate() != null
				&& securityAuthorization.getEventEndDate() != null) {
			if (securityAuthorization.getEventInitialDate().getTime() > securityAuthorization
					.getEventEndDate().getTime()) {
				throw new BusinessRuntimeException("开始日期必须小于结束日期");
			}
		}
		// 合同金额不能为空
		if (securityAuthorization.getContractMoney() == null) {
			errors.rejectValue("contractMoney", "required", "required");
		}
		ValidateFieldLength.validateMaxLength(errors, "eventName", 200,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "approveCondition", 1000,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "eventSummary", 1000,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "remarks", 1000,
				"maxLimitLength", "输入超长。");

	}

	/**
	 * 导出担保信息.
	 * 
	 * @param model
	 *            model
	 * @param request
	 *            请求对象
	 * @return 返回担保信息查询结果页面
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=export", method = RequestMethod.POST)
	public String exportAssemble(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 获取页面起始日期
		String startDate = request.getParameter("eventInitialDate");
		// 获取页面截至日期
		String endDate = request.getParameter("eventEndDate");
		model.addAttribute("eventInitialDate", startDate);
		model.addAttribute("eventEndDate", endDate);
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(
				request, SecurityAuthorization.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		pageBean.setExport(true);
		CutPageBean securityPageBean = securityAuthorizationService
				.getSecurityAuthorizationCurrGroup(pageBean, paramterList,
						fwAccount, startDate, endDate);
		if (securityPageBean == null || securityPageBean.getDataList() == null
				|| securityPageBean.getDataList().size() == 0) {
			return Util.printErrorString("无可导出的报表！");
		}
		model.addAttribute("queryParams", paramterList);
		model.addAttribute("success", request.getParameter("success"));
		model.addAttribute("pageBean", securityPageBean);
		model.addAttribute("fileName", "担保信息.xls");
		return EXPORTPAGEPATH;
	}

}
