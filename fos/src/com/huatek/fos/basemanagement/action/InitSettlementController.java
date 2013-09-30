/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-27 下午03:13:36
 * Author: zeek_zheng
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.basemanagement.action;

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

import com.huatek.fos.basemanagement.entity.hibernate.InitSettlement;
import com.huatek.fos.basemanagement.service.InitSettlementService;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;

/**
 * 
 * @author: zeek_zheng
 * 
 * @version $Id: BeginFundsController.java, v 0.1 2013-5-27 下午03:13:36 $
 * 
 *          Comment: 期初结转金额
 */
@Controller
@RequestMapping("/initSettlement.do")
@SessionAttributes(types = InitSettlement.class)
public class InitSettlementController {

	/**
	 * 业务对象
	 */
	@Autowired
	private InitSettlementService initSettlementService;

	/**
	 * 跳转页面
	 */
	private static final String LIST_EDIT_PAGE = "fos/initsettlement/initsettlement_edit_query.jsp";

	private static final String LIST_PAGE = "fos/initsettlement/initsettlement_list.jsp";

	private static final String REDIRECT_PATH = "redirect:initSettlement.do?actionMethod=editQuery";

	/**
	 * 初始化页面
	 * 
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.GET)
	public String init(final Model model, final HttpServletRequest request)
			throws ParseException {
		String initSettleId = request.getParameter("initSettlementId");
		String initDate = FosUtil.getInitDate();
		model.addAttribute("initDate", initDate);
		if (CommonUtil.isNotZeroLengthTrimString(initSettleId)) {
			model.addAttribute(initSettlementService.getObjectById(
					InitSettlement.class, Long.valueOf(initSettleId)));
		} else {
			model.addAttribute(new InitSettlement());
		}
		return LIST_EDIT_PAGE;
	}

	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.POST)
	public String query(final Model model, final HttpServletRequest request) {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, InitSettlement.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("pageBean",
				initSettlementService.getFundsPageBean(pageBean, parameterList));
		return LIST_PAGE;
	}

	/**
	 * 新增期初结转金额
	 * 
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String add(final Model model,
			@ModelAttribute final InitSettlement initSettlement,
			final BindingResult result, final SessionStatus status,
			final HttpServletRequest request) throws ParseException {
		// 调用添加类目数据封装方法
		String gatherDate = request.getParameter("gatherDate");
		if (!"".equals(gatherDate)) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			initSettlement.setGatherDate(df.parse(gatherDate));
		}
		// 必输校验
		validate(initSettlement, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,
					"initSettlementForm"));
		}
		// 调用新增、编辑数据库操作方法
		boolean statuss = initSettlementService
				.saveOrUpdateFunds(initSettlement);
		if (statuss) {
			// 清空Session
			status.setComplete();
		} else {
			return Util.printErrorString("同一日期只能录入一条相同类型的期初结转金额");
		}
		return REDIRECT_PATH;
	}

	public static void validate(final InitSettlement initSettlement,
			final Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(initSettlement.getUseType())) {
			errors.rejectValue("useType", "required", "required");
		}
		if (initSettlement.getGatherDate() == null) {
			errors.rejectValue("gatherDate", "required", "required");
		}
		if (initSettlement.getSettlementMoney() == null) {
			errors.rejectValue("settlementMoney", "required", "required");
		}
	}

	/**
	 * 删除期初结转金额
	 * 
	 * @return
	 */
	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String del(@RequestParam("initSettlementid") final Long id) {
		InitSettlement initSettlement = (InitSettlement) initSettlementService
				.getObjectById(InitSettlement.class, id);
		if (initSettlement != null) {
			initSettlementService.delete(initSettlement);
		}
		return LIST_EDIT_PAGE;
	}

	/**
	 * 初始化日期
	 * 
	 * @param dataBinder
	 */
	@InitBinder
	protected void initBinder(final WebDataBinder dataBinder) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
		dataBinder.registerCustomEditor(Date.class, "gatherDate", dateEditor);
	}
}
