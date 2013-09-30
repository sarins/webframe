/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-29 上午11:08:36
 * Author: zeek_zheng
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.investmanagement.action;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.huatek.fos.categorymanagement.entity.hibernate.BaseProjectCategories;
import com.huatek.fos.categorymanagement.service.BaseProjectCategoriesService;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.fos.investmanagement.service.IventureCapitalService;
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
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * 创投信息action类
 * 
 * @author: alan_zhang
 * 
 */
@Controller
@RequestMapping("/iventureCapital.do")
@SessionAttributes(types = SourceUseFunds.class)
public class IventureCapitalController {

	/**
	 * 创设业务对象
	 */
	@Autowired
	private IventureCapitalService iventureCapitalService;

	/**
	 * 项目管理的service.
	 */
	@Autowired
	private BaseProjectCategoriesService baseProjectCategoriesService;

	/**
	 * 资金收入编辑页面路径
	 */
	private static final String EDIT_INCOME_PAGE_PATH = "fos/investmanagement/iventureCapital_income_edit.jsp";

	/**
	 * 资金支出编辑页面路径
	 */
	private static final String EDIT_PAY_PAGE_PATH = "fos/investmanagement/iventureCapital_pay_edit.jsp";

	/**
	 * 查询页面路径
	 */
	private static final String QUERY_PAGE_PATH = "fos/investmanagement/iventureCapital_query.jsp";

	/**
	 * 查询列表路径
	 */
	private static final String LIST_PAGE_PATH = "fos/investmanagement/iventureCapital_list.jsp";

	/**
	 * 重定向添加编辑页面.
	 */
	private static final String REDIRECT_QUERY_PATH = "redirect:iventureCapital.do?actionMethod=editQuery";

	/**
	 * 导出页面
	 */
	private static final String EXPORT_PAGE_PATH = "fos/investmanagement/iventureCapital_gather_export_excel.jsp";

	/**
	 * 查询编辑页面初始化.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.GET)
	public String initEditQueryPage(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 统计日期（每月10日、20日或月底一天）
		String initDate = FosUtil.getInitDate();
		model.addAttribute("initDate", initDate);
		// 点击修改的时候 统计日期初始化
		String gatherDate = request.getParameter("gatherDate");
		Date date = FosUtil.getInitDate(gatherDate);
		model.addAttribute("gatherDate", date);
		// 获取创投信息ID
		String id = request.getParameter("id");
		// 项目类目
		BaseProjectCategories categories = null;
		// 获取提交类型
		String subType = request.getParameter("subType");
		model.addAttribute("subType", subType);
		// 如果提交类型是资金收入
		if (subType.equals("subIncome")) {
			// 获取创投资金收入项目类目
			List<BaseProjectCategories> incomeCategoryList = baseProjectCategoriesService
					.getCategoryByProCateCode(Constant.INVEST_MOUDLE,
							Constant.INCOME_FUND_CHUANGTOU);
			if (incomeCategoryList != null && incomeCategoryList.size() > 0) {
				categories = incomeCategoryList.get(0);
				// 新增
				if (id == null) {
					SourceUseFunds incomeFunds = new SourceUseFunds();
					incomeFunds.setFirstCategory(categories);
					model.addAttribute("sourceUseFunds", incomeFunds);
					// 编辑
				} else {
					model.addAttribute("sourceUseFunds", iventureCapitalService
							.getObjectById(SourceUseFunds.class,
									Long.valueOf(id)));
				}
			}
			return EDIT_INCOME_PAGE_PATH;
			// 如果是提交类型是资金支出
		} else if (subType.equals("subPay")) {
			// 获取创投资金支出项目类目
			List<BaseProjectCategories> payCategoryList = baseProjectCategoriesService
					.getCategoryByProCateCode(Constant.INVEST_MOUDLE,
							Constant.PAY_FUND_CHUANGTOU);
			if (payCategoryList != null && payCategoryList.size() > 0) {
				categories = payCategoryList.get(0);
				// 新增
				if (id == null) {
					SourceUseFunds payFunds = new SourceUseFunds();
					payFunds.setFirstCategory(categories);
					model.addAttribute("sourceUseFunds", payFunds);
					// 编辑
				} else {
					model.addAttribute("sourceUseFunds", iventureCapitalService
							.getObjectById(SourceUseFunds.class,
									Long.valueOf(id)));
				}
			}
			return EDIT_PAY_PAGE_PATH;
		}
		// 默认进入创投收入页面
		return EDIT_INCOME_PAGE_PATH;
	}

	/**
	 * 查询编辑创投信息列表页面初始化数据获取.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.POST)
	public String executeEditQuery(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 获取页面参数
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		// 获取当前登录用户
		FwAccount account = ThreadLocalClient.get().getOperator();
		// 项目类目
		BaseProjectCategories categories = null;
		// 创投信息pageBean
		CutPageBean fundPageBean = null;
		// 获取提交类型
		String subType = request.getParameter("subType");
		model.addAttribute("subType", subType);
		// 如果提交类型是资金收入
		if (subType.equals("subIncome")) {
			List<BaseProjectCategories> incomeCategoryList = baseProjectCategoriesService
					.getCategoryByProCateCode(Constant.INVEST_MOUDLE,
							Constant.INCOME_FUND_CHUANGTOU);
			if (incomeCategoryList != null && incomeCategoryList.size() > 0) {
				categories = incomeCategoryList.get(0);
				fundPageBean = iventureCapitalService
						.getIventureCapitalByFirstCategory(pageBean,
								paramterList, categories.getId(), account, null);
				model.addAttribute("pageBean", fundPageBean);
			}
			// 如果是提交类型是资金支出
		} else if (subType.equals("subPay")) {
			List<BaseProjectCategories> payCategoryList = baseProjectCategoriesService
					.getCategoryByProCateCode(Constant.INVEST_MOUDLE,
							Constant.PAY_FUND_CHUANGTOU);
			if (payCategoryList != null && payCategoryList.size() > 0) {
				categories = payCategoryList.get(0);
				fundPageBean = iventureCapitalService
						.getIventureCapitalByFirstCategory(pageBean,
								paramterList, categories.getId(), account, null);
				model.addAttribute("pageBean", fundPageBean);
			}
		}

		return LIST_PAGE_PATH;
	}

	/***
	 * 新增或编辑创投信息数据.
	 * 
	 * @param model
	 * @param fwSystem
	 * @param result
	 * @param status
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEdit(final Model model,
			@ModelAttribute final SourceUseFunds sourceUseFunds,
			final BindingResult result, final SessionStatus status,
			final HttpServletRequest request) throws ParseException {
		// 获取提交类型
		String subType = request.getParameter("subType");
		// 校验录入数据是否合法
		validate(sourceUseFunds, result, subType);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,
					"sourceUseFundsForm"));
		}
		// 获取当前登录用户
		FwAccount account = ThreadLocalClient.get().getOperator();

		if (subType.equals("subIncome") && sourceUseFunds.getId() == null) {
			// 统计日期
			String initDate = request.getParameter("gatherDate");
			// 格式化统计日期
			Date gatherDate = FosUtil.getInitDate(initDate);
			// 获取页面查询参数
			List<CommonBean> parameterList = QueryCondition.getQueryCondition(
					request, SourceUseFunds.class);
			// 获取分页查询pageBean
			CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
			// 获取项目类目对象
			List<BaseProjectCategories> incomeCategoryList = baseProjectCategoriesService
					.getCategoryByProCateCode(Constant.INVEST_MOUDLE,
							Constant.INCOME_FUND_CHUANGTOU);
			if (incomeCategoryList != null && incomeCategoryList.size() > 0) {
				BaseProjectCategories categories = incomeCategoryList.get(0);
				// 获取是否已存在数据
				CutPageBean incomeFunds = iventureCapitalService
						.getIventureCapitalByFirstCategory(pageBean,
								parameterList, categories.getId(), account,
								gatherDate);
				if (incomeFunds != null && incomeFunds.getDataList() != null
						&& incomeFunds.getDataList().size() > 0) {
					return Util.printErrorString("该统计日期下的资金收入数据已存在，无法执行操作！");
				}
			}
		}
		// 新增或编辑提交
		iventureCapitalService.saveIventureCapital(sourceUseFunds, account);
		// 清空session
		status.setComplete();
		return REDIRECT_QUERY_PATH + "&subType=" + subType + "&gatherDate="
				+ FosUtil.getStringDate(sourceUseFunds.getGatherDate());
	}

	/**
	 * 查询创投信息页面初始化.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.GET)
	public String queryInitPage(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 设置统计日期（每月10日、20日或月底一天）
		String initDate = FosUtil.getInitDate();
		model.addAttribute("initDate", initDate);
		// 获取查询项目类目
		model.addAttribute("categoriesList", baseProjectCategoriesService
				.getFirstCategory(Constant.INVEST_MOUDLE));
		return QUERY_PAGE_PATH;
	}

	/**
	 * 根据条件执行创投信息查询.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.POST)
	public String doQuery(final Model model, final HttpServletRequest request)
			throws ParseException {
		// 统计日期
		String initDate = request.getParameter("gatherDate");
		if (CommonUtil.isZeroLengthTrimString(initDate)) {
			return Util.printErrorString("请选择统计日期!");
		}
		// 格式化统计日期
		Date gatherDate = FosUtil.getInitDate(initDate);
		// 获取页面查询参数
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		// 获取分页查询pageBean
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		// 获取项目类目
		String firstCategoryId = request.getParameter("firstCategory");

		// 查询提交
		model.addAttribute("pageBean", iventureCapitalService
				.getVentureCapitalPageBean(pageBean, parameterList, gatherDate,
						firstCategoryId));

		// 查询页面执行数据提交请求标记（查询列表页面属于公共页面，部分按钮需要过滤）
		String superQuery = request.getParameter("superQuery");
		model.addAttribute("superQuery", superQuery);
		return LIST_PAGE_PATH;
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
		dataBinder.registerCustomEditor(Date.class, "gatherDate", dateEditor);
		dataBinder.registerCustomEditor(Date.class, "tenDaysDate", dateEditor);
		dataBinder.registerCustomEditor(Date.class, "aMonthDate", dateEditor);
		dataBinder.registerCustomEditor(BaseProjectCategories.class,
				"firstCategory", new BaseEntityEditor(
						BaseProjectCategories.class));
	}

	/***
	 * 删除.
	 * 
	 * @param id
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=delete")
	public String delete(@RequestParam("id") final Long id)
			throws ParseException {
		// 根据ID查询资金运用对象
		SourceUseFunds sourceUseFunds = (SourceUseFunds) iventureCapitalService
				.getObjectById(SourceUseFunds.class, id);
		if (sourceUseFunds != null) {
			// 执行删除操作
			iventureCapitalService.delete(sourceUseFunds);
		}
		// 获取提交类型（默认提交为资金收入）
		String subType = "subIncome";
		// 获取当前创投信息项目类目编码
		String proCateCode = sourceUseFunds.getFirstCategory().getProCateCode();
		// 如果是资金收入
		if (proCateCode.equals(Constant.INCOME_FUND_CHUANGTOU)) {
			// 提交类型设置为资金收入
			subType = "subIncome";
			// 如果是资金支出
		} else if (proCateCode.equals(Constant.PAY_FUND_CHUANGTOU)) {
			// 提交类型设置为资金支出
			subType = "subPay";
		}
		return REDIRECT_QUERY_PATH + "&subType=" + subType + "&&gatherDate="
				+ FosUtil.getStringDate(sourceUseFunds.getGatherDate());
	}

	/**
	 * 新增/编辑项目类目数据校验方法.
	 * 
	 * @param sourceUseFunds
	 *            创投信息对象
	 * @param errors
	 *            错误信息
	 */
	public static void validate(final SourceUseFunds sourceUseFunds,
			final Errors errors, String subType) {
		// 项目类别不能为空
		if (sourceUseFunds.getFirstCategory() == null) {
			errors.rejectValue("firstCategory", "required", "required");
		}
		// 项目名称不能为空
		if (CommonUtil.isZeroLengthTrimString(sourceUseFunds.getProjectName())
				&& subType.equals("subPay")) {
			errors.rejectValue("projectName", "required", "required");
		}
		// 10日内金额不能为空
		if (sourceUseFunds.getTenDaysMoney() == null) {
			errors.rejectValue("tenDaysMoney", "required", "required");
		}
		// 10日内日期不能为空
		if (sourceUseFunds.getTenDaysDate() == null) {
			errors.rejectValue("tenDaysDate", "required", "required");
		}
		if (sourceUseFunds.getaMonthMoney() == null) {
			sourceUseFunds.setaMonthMoney(new BigDecimal("0"));
		}
		if (sourceUseFunds.getTwoMonthsMoney() == null) {
			sourceUseFunds.setTwoMonthsMoney(new BigDecimal("0"));
		}
		if (sourceUseFunds.getThreeMonthsMoney() == null) {
			sourceUseFunds.setThreeMonthsMoney(new BigDecimal("0"));
		}
		if (sourceUseFunds.getSixMonthsMoney() == null) {
			sourceUseFunds.setSixMonthsMoney(new BigDecimal("0"));
		}
		if (sourceUseFunds.getMoreSixMonthsMoney() == null) {
			sourceUseFunds.setMoreSixMonthsMoney(new BigDecimal("0"));
		}
		if (sourceUseFunds.getTenDaysDate() != null
				&& sourceUseFunds.getGatherDate() != null) {
			if (sourceUseFunds.getTenDaysDate().getTime() < sourceUseFunds
					.getGatherDate().getTime()) {
				throw new BusinessRuntimeException("十日内日期必须大于统计日期");
			}
		}
		// 超长验证
		ValidateFieldLength.validateMaxLength(errors, "remarks", 1000,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "projectName", 200,
				"maxLimitLength", "输入超长。");
	}

	/**
	 * 导出创投信息.
	 * 
	 * @param model
	 *            model
	 * @param request
	 *            请求对象
	 * @return 返回融资信息查询结果页面
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=export", method = RequestMethod.POST)
	public String exportAssemble(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 统计日期
		String initDate = request.getParameter("gatherDate");
		// 格式化统计日期
		Date gatherDate = FosUtil.getInitDate(initDate);
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		// 获取该统计日期下是否存在可导出的数据
		CutPageBean dateListPageBean = iventureCapitalService
				.getIventureCapitalByGatherDate(pageBean, paramterList,
						gatherDate);
		if (dateListPageBean == null || dateListPageBean.getDataList() == null) {
			return Util.printErrorString("该统计日期下无可导出的创投信息!");
		}
		// 获取创投资金收入、资金支出类目ID
		List<BaseProjectCategories> incomeCategoryList = baseProjectCategoriesService
				.getCategoryByProCateCode(Constant.INVEST_MOUDLE,
						Constant.INCOME_FUND_CHUANGTOU);
		List<BaseProjectCategories> payCategoryList = baseProjectCategoriesService
				.getCategoryByProCateCode(Constant.INVEST_MOUDLE,
						Constant.PAY_FUND_CHUANGTOU);
		BaseProjectCategories categories = null;
		CutPageBean fundPageBean = null;
		// 处理资金收入数据
		if (incomeCategoryList != null && incomeCategoryList.size() > 0) {
			categories = incomeCategoryList.get(0);
			// 获取资金收入展示数据
			fundPageBean = iventureCapitalService
					.getIventureCapitalByFirstCategory(pageBean, paramterList,
							categories.getId(), null, gatherDate);
			if (fundPageBean != null && fundPageBean.getDataList() != null
					&& fundPageBean.getDataList().size() > 0) {
				// 设置资金收入编制部门
				SourceUseFunds incomeFunds = (SourceUseFunds) fundPageBean
						.getDataList().get(0);
				model.addAttribute("departIn", incomeFunds.getGroup().getName());
				// 设置资金收入编制人
				model.addAttribute("orgIn",
						incomeFunds.getOrganizationUserName());
				// 获取当前部门的部门领导
				List<FwAccount> incomeAccList = iventureCapitalService
						.getFwAccountLeader(incomeFunds.getGroup().getId());
				if (incomeAccList != null && incomeAccList.size() > 0) {
					// 设置分管领导
					model.addAttribute("leaderIn", incomeAccList.get(0)
							.getUserName());
				}
			}
			// 获取创投资金收入(期初结转金额)合计金额
			Map<String, BigDecimal> totalIncomeMap = this
					.getIncomeFundsTotalMoney((List<SourceUseFunds>) fundPageBean
							.getDataList());
			model.addAttribute("totalIncomeMap", totalIncomeMap);
		}
		// 处理资金支出数据
		if (payCategoryList != null && payCategoryList.size() > 0) {
			categories = payCategoryList.get(0);
			// 获取资金支出展示数据
			fundPageBean = iventureCapitalService
					.getIventureCapitalByFirstCategory(pageBean, paramterList,
							categories.getId(), null, gatherDate);
			if (fundPageBean != null && fundPageBean.getDataList() != null
					&& fundPageBean.getDataList().size() > 0) {
				// 支出总条数
				model.addAttribute("payCount", fundPageBean.getTotalRows());
				// 获取支出数据
				SourceUseFunds payFunds = (SourceUseFunds) fundPageBean
						.getDataList().get(0);
				// 设置资金支出编制部门
				model.addAttribute("departOut", payFunds.getGroup().getName());
				// 设置资金支出编制人
				model.addAttribute("orgOut", payFunds.getOrganizationUserName());
				// 获取当前部门的部门领导
				List<FwAccount> payAccList = iventureCapitalService
						.getFwAccountLeader(payFunds.getGroup().getId());
				if (payAccList != null && payAccList.size() > 0) {
					// 设置分管领导
					model.addAttribute("leaderOut", payAccList.get(0)
							.getUserName());
				}

			}
			// 计算每条资金支出金额
			List<SourceUseFunds> sourceUseFundsList = this
					.orgnizationOutFundsData((List<SourceUseFunds>) fundPageBean
							.getDataList());
			model.addAttribute("payFundsList", sourceUseFundsList);
			// 计算支出总金额
			Map<String, BigDecimal> totalPayMap = this
					.getOutFundsTotalMoney(sourceUseFundsList);
			model.addAttribute("totalPayMap", totalPayMap);
		}
		model.addAttribute("fileName", "创投信息.xls");
		return EXPORT_PAGE_PATH;
	}

	/**
	 * 计算创投资金收入(期初结转金额)合计金额
	 * 
	 * @param fundsApplyGatherList
	 *            资金运用视图对象列表
	 * @return 资金支出合计金额Map
	 */
	private Map<String, BigDecimal> getIncomeFundsTotalMoney(
			List<SourceUseFunds> sourceUseFundsList) {
		Map<String, BigDecimal> totalApplyMap = new HashMap<String, BigDecimal>();
		if (sourceUseFundsList != null && sourceUseFundsList.size() > 0) {
			// 初始化合计金额
			BigDecimal total = sourceUseFundsList.get(0).getSummaryMoney();
			BigDecimal tenDaysTotal = sourceUseFundsList.get(0)
					.getTenDaysMoney();
			BigDecimal aMonthTotal = sourceUseFundsList.get(0).getaMonthMoney();
			BigDecimal twoMonthsTotal = sourceUseFundsList.get(0)
					.getTwoMonthsMoney();
			BigDecimal threeMonthsTotal = sourceUseFundsList.get(0)
					.getThreeMonthsMoney();
			BigDecimal sixMonthsTotal = sourceUseFundsList.get(0)
					.getSixMonthsMoney();
			BigDecimal moreSixMonthsTotal = sourceUseFundsList.get(0)
					.getMoreSixMonthsMoney();
			// 设置合金金额
			totalApplyMap.put("total", total);
			totalApplyMap.put("tenDaysTotal", tenDaysTotal);
			totalApplyMap.put("aMonthTotal", aMonthTotal);
			totalApplyMap.put("twoMonthsTotal", twoMonthsTotal);
			totalApplyMap.put("threeMonthsTotal", threeMonthsTotal);
			totalApplyMap.put("sixMonthsTotal", sixMonthsTotal);
			totalApplyMap.put("moreSixMonthsTotal", moreSixMonthsTotal);
		}
		return totalApplyMap;
	}

	/**
	 * 计算资金支出合计金额
	 * 
	 * @param fundsApplyGatherList
	 *            资金运用视图对象列表
	 * @return 资金支出合计金额Map
	 */
	private Map<String, BigDecimal> getOutFundsTotalMoney(
			List<SourceUseFunds> sourceUseFundsList) {
		Map<String, BigDecimal> totalApplyMap = new HashMap<String, BigDecimal>();
		if (sourceUseFundsList != null && sourceUseFundsList.size() > 0) {
			// 初始化合计金额
			BigDecimal total = new BigDecimal(0);
			BigDecimal tenDaysTotal = new BigDecimal(0);
			BigDecimal aMonthTotal = new BigDecimal(0);
			BigDecimal twoMonthsTotal = new BigDecimal(0);
			BigDecimal threeMonthsTotal = new BigDecimal(0);
			BigDecimal sixMonthsTotal = new BigDecimal(0);
			BigDecimal moreSixMonthsTotal = new BigDecimal(0);
			// 获取资金支出合计金额(合计金额存放在第一条数据集中)
			SourceUseFunds sourceUseFunds = sourceUseFundsList.get(0);
			// 获取每个分类的合计金额
			BigDecimal tenDaysMoney = sourceUseFunds
					.getTenDaysMoneySummaryFirst();
			BigDecimal aMonthMoney = sourceUseFunds
					.getaMonthMoneySummaryFirst();
			BigDecimal twoMonthsMoney = sourceUseFunds
					.getTwoMonthsMoneySummaryFirst();
			BigDecimal threeMonthsMoney = sourceUseFunds
					.getThreeMonthsMoneySummaryFirst();
			BigDecimal sixMonthsMoney = sourceUseFunds
					.getSixMonthsMoneySummaryFirst();
			BigDecimal moreSixMonthsMoney = sourceUseFunds
					.getMoreSixMonthsMoneySummaryFirst();
			// 设置资金支出合计金额
			BigDecimal totalMoney = sourceUseFunds
					.getFirstProjectMoneySummary();
			// 计算资金支出合计金额
			tenDaysTotal = tenDaysTotal.add(tenDaysMoney);
			aMonthTotal = aMonthTotal.add(aMonthMoney);
			twoMonthsTotal = twoMonthsTotal.add(twoMonthsMoney);
			threeMonthsTotal = threeMonthsTotal.add(threeMonthsMoney);
			sixMonthsTotal = sixMonthsTotal.add(sixMonthsMoney);
			moreSixMonthsTotal = moreSixMonthsTotal.add(moreSixMonthsMoney);
			total = total.add(totalMoney);

			// 设置合金金额
			totalApplyMap.put("total", total);
			totalApplyMap.put("tenDaysTotal", tenDaysTotal);
			totalApplyMap.put("aMonthTotal", aMonthTotal);
			totalApplyMap.put("twoMonthsTotal", twoMonthsTotal);
			totalApplyMap.put("threeMonthsTotal", threeMonthsTotal);
			totalApplyMap.put("sixMonthsTotal", sixMonthsTotal);
			totalApplyMap.put("moreSixMonthsTotal", moreSixMonthsTotal);
		}
		return totalApplyMap;
	}

	/**
	 * 组装资金支出金额（金额(包括一级品类合计)）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	public List<SourceUseFunds> orgnizationOutFundsData(
			List<SourceUseFunds> sourceList) {
		SourceUseFunds tempSourceUseFunds = null;
		// 资金运用金额合计
		BigDecimal projectMoneySummary = new BigDecimal("0");
		// 10日内合计
		BigDecimal tenDaysMoneySummary = new BigDecimal("0");
		// 1月内合计
		BigDecimal aMonthMoneySummary = new BigDecimal("0");
		// 2月内合计
		BigDecimal twoMonthsMoneySummary = new BigDecimal("0");
		// 3月内合计
		BigDecimal threeMonthsMoneySummary = new BigDecimal("0");
		// 6月内合计
		BigDecimal sixMonthsMoneySummary = new BigDecimal("0");
		// 6月以上合计
		BigDecimal moreSixMonthsMoneySummary = new BigDecimal("0");
		for (int i = 0; i < sourceList.size(); i++) {
			// 第一次初始化金额信息
			if (i == 0) {
				tempSourceUseFunds = sourceList.get(i);
				// 资金运用金额合计
				projectMoneySummary = projectMoneySummary.add(sourceList.get(i)
						.getSummaryMoney());
				// 10日内金额合计
				tenDaysMoneySummary = tenDaysMoneySummary.add(sourceList.get(i)
						.getTenDaysMoney());
				// 1月内金额合计
				aMonthMoneySummary = aMonthMoneySummary.add(sourceList.get(i)
						.getaMonthMoney());
				// 2月内金额合计
				twoMonthsMoneySummary = twoMonthsMoneySummary.add(sourceList
						.get(i).getTwoMonthsMoney());
				// 3月内金额合计
				threeMonthsMoneySummary = threeMonthsMoneySummary
						.add(sourceList.get(i).getThreeMonthsMoney());
				// 6月内金额合计
				sixMonthsMoneySummary = sixMonthsMoneySummary.add(sourceList
						.get(i).getSixMonthsMoney());
				// 6月以上金额合计
				moreSixMonthsMoneySummary = moreSixMonthsMoneySummary
						.add(sourceList.get(i).getMoreSixMonthsMoney());
				// 对最后一条记录做处理
				if (i == sourceList.size() - 1) {
					tempSourceUseFunds
							.setFirstProjectMoneySummary(projectMoneySummary);
					tempSourceUseFunds
							.setTenDaysMoneySummaryFirst(tenDaysMoneySummary);
					tempSourceUseFunds
							.setaMonthMoneySummaryFirst(aMonthMoneySummary);
					tempSourceUseFunds
							.setTwoMonthsMoneySummaryFirst(twoMonthsMoneySummary);
					tempSourceUseFunds
							.setThreeMonthsMoneySummaryFirst(threeMonthsMoneySummary);
					tempSourceUseFunds
							.setSixMonthsMoneySummaryFirst(sixMonthsMoneySummary);
					tempSourceUseFunds
							.setMoreSixMonthsMoneySummaryFirst(moreSixMonthsMoneySummary);
				}
			} else {
				projectMoneySummary = projectMoneySummary.add(sourceList.get(i)
						.getSummaryMoney());
				tenDaysMoneySummary = tenDaysMoneySummary.add(sourceList.get(i)
						.getTenDaysMoney());
				aMonthMoneySummary = aMonthMoneySummary.add(sourceList.get(i)
						.getaMonthMoney());
				twoMonthsMoneySummary = twoMonthsMoneySummary.add(sourceList
						.get(i).getTwoMonthsMoney());
				threeMonthsMoneySummary = threeMonthsMoneySummary
						.add(sourceList.get(i).getThreeMonthsMoney());
				sixMonthsMoneySummary = sixMonthsMoneySummary.add(sourceList
						.get(i).getSixMonthsMoney());
				moreSixMonthsMoneySummary = moreSixMonthsMoneySummary
						.add(sourceList.get(i).getMoreSixMonthsMoney());
				// 对最后一条记录做处理
				if (i == sourceList.size() - 1) {
					tempSourceUseFunds
							.setFirstProjectMoneySummary(projectMoneySummary);
					tempSourceUseFunds
							.setTenDaysMoneySummaryFirst(tenDaysMoneySummary);
					tempSourceUseFunds
							.setaMonthMoneySummaryFirst(aMonthMoneySummary);
					tempSourceUseFunds
							.setTwoMonthsMoneySummaryFirst(twoMonthsMoneySummary);
					tempSourceUseFunds
							.setThreeMonthsMoneySummaryFirst(threeMonthsMoneySummary);
					tempSourceUseFunds
							.setSixMonthsMoneySummaryFirst(sixMonthsMoneySummary);
					tempSourceUseFunds
							.setMoreSixMonthsMoneySummaryFirst(moreSixMonthsMoneySummary);
				}
			}
		}
		return sourceList;
	}
}