/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-31 下午12:42:00
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.homepage.action;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.huatek.fos.assetdebtmanagement.entity.hibernate.AssetDebt;
import com.huatek.fos.assetdebtmanagement.service.AssetDebtService;
import com.huatek.fos.basemanagement.entity.hibernate.AssetInformation;
import com.huatek.fos.entrustloanmanagement.entity.hibernate.EntrustLoan;
import com.huatek.fos.entrustloanmanagement.service.EntrustLoanService;
import com.huatek.fos.financingmanagement.service.FinancingDetailService;
import com.huatek.fos.homepage.entity.hibernate.FusionCharts;
import com.huatek.fos.util.Constant;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;

/**
 * 
 * @author: apple_liu
 * 
 * @version $Id: FusionChartsAction.java, v 0.1 2013-5-31 下午12:42:00 $
 * 
 *          Comment: 请添加对类的描述
 */
@Controller
@RequestMapping("/homePage.do")
public class HomePageAction {

	/**
	 * 融资模块service.
	 */
	@Autowired
	private FinancingDetailService financingDetailService;
	@Autowired
	private AssetDebtService assetDebtService;
	/**
	 * 委托贷款service.
	 */
	@Autowired
	private EntrustLoanService entrustLoanService;

	/**
	 * 首页fusionchart展示融资数据页面路径.
	 */
	private static final String FUSHIONCHATS_PAGE = "fos/homepage/homePage.jsp";
	/**
	 * 查看委托贷款详细信息页面路径.
	 */
	private static final String VIEW_ENTRUST_LOAN_DETAIL_PAGE = "fos/homepage/entrustLoan_view.jsp";
	/**
	 * 首页委贷页面路径.
	 */
	private static final String QUERY_ENTRUST_LOAN_PAGE = "fos/homepage/homePageRight.jsp";

	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=query")
	public String query(final Model model, final HttpServletRequest request)
			throws ParseException {
		// 创建图标对象并进行初始化
		FusionCharts fusionCharts = new FusionCharts();
		fusionCharts.setTitleName("集中还款图表展示");
		fusionCharts.setTableName("FinancingDetail");
		fusionCharts.setColumnName1("季度");
		fusionCharts.setColumnName2("financingMoney");
		fusionCharts.setSeriesName("mecName");
		fusionCharts.setNumberPrefix("万元");
		fusionCharts.setxName("季度");
		fusionCharts.setyName("金额");
		// 返回html形式的字符串代码
		StringBuffer strBuffer = financingDetailService
				.convertDataToXML(fusionCharts);
		model.addAttribute("strBuffer", strBuffer);
		// 获取年度融资信息结果
		AssetInformation assetInfomation = new AssetInformation();
		List financingAmountList = assetDebtService
				.getFinancingTotalAmountFromFinancing();
		if (financingAmountList.size() > 0 && financingAmountList != null) {
			Object amount = financingAmountList.get(0);
			if (amount != null) {
				BigDecimal financingAmount = new BigDecimal(amount.toString());
				assetInfomation.setFinancAmunt(financingAmount);
			}
		}
		List assetUserTypeList = assetDebtService
				.getAssetUserTypeInfo(Constant.FINANCING);
		if (assetUserTypeList.size() > 0 && !assetUserTypeList.isEmpty()) {
			AssetInformation assetInformation1 = (AssetInformation) assetUserTypeList
					.get(0);
			assetInfomation.setEndDate(assetInformation1.getEndDate());
			assetInfomation.setStartDate(assetInformation1.getStartDate());
			assetInfomation.setBudgetMoney(assetInformation1.getBudgetMoney());
		}
		model.addAttribute("assetInfomation", assetInfomation);
		// 获取年度担保信息结果
		AssetInformation assetInfomationSecurty = new AssetInformation();
		List securityAuthorizationList = assetDebtService
				.getSecurityTotalAmountFrom();
		if (securityAuthorizationList.size() > 0
				&& securityAuthorizationList != null) {
			Object securityAmount = securityAuthorizationList.get(0);
			if (securityAmount != null) {
				BigDecimal securityAmountTotal = new BigDecimal(
						securityAmount.toString());
				assetInfomationSecurty.setSercurtyAmunt(securityAmountTotal);
			}
		}
		List assetInfomationSecurtyList = assetDebtService
				.getAssetUserTypeInfo(Constant.GUARANTEE);
		if (assetInfomationSecurtyList.size() > 0
				&& !assetInfomationSecurtyList.isEmpty()) {
			AssetInformation securty = (AssetInformation) assetInfomationSecurtyList
					.get(0);
			assetInfomationSecurty.setEndDate(securty.getEndDate());
			assetInfomationSecurty.setStartDate(securty.getStartDate());
			assetInfomationSecurty.setBudgetMoney(securty.getBudgetMoney());
		}
		model.addAttribute("assetInfomationSecurty", assetInfomationSecurty);
		// 获取资产负债结果
		List assetDebtList = assetDebtService.getAssetDebtPageBeanInformation();
		if (assetDebtList.size() > 0 && !assetDebtList.isEmpty()) {
			AssetDebt assetDebt = (AssetDebt) assetDebtList.get(0);
			model.addAttribute("assetDebt", assetDebt);
		}
		return FUSHIONCHATS_PAGE;

	}

	/**
	 * 查看委托贷款详情.
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(params = "actionMethod=viewDetail", method = RequestMethod.GET)
	public String viewDetail(final Model model, final HttpServletRequest request) {
		String entrustLoanId = request.getParameter("entrustLoanId");
		if (CommonUtil.isNotZeroLengthTrimString(entrustLoanId)) {
			Long id = Long.valueOf(entrustLoanId);
			model.addAttribute(entrustLoanService.getObjectById(
					EntrustLoan.class, id));
		}
		return VIEW_ENTRUST_LOAN_DETAIL_PAGE;

	}

	/**
	 * 查询委贷信息.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=queryEntrustLoan", method = RequestMethod.POST)
	public String queryEntrustLoan(final Model model,
			final HttpServletRequest request) {
		// 委贷信息展示
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		pageBean.setPageSize(6);
		model.addAttribute("pageBean",
				entrustLoanService.getShowListDateInHomePage(pageBean, null));
		return QUERY_ENTRUST_LOAN_PAGE;
	}

}
