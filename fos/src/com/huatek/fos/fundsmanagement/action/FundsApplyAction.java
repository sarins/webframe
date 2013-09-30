package com.huatek.fos.fundsmanagement.action;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
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
import com.huatek.fos.fundsmanagement.entity.hibernate.AuditReportRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.fos.fundsmanagement.service.FundsApplyService;
import com.huatek.fos.fundsreportgather.entity.hibernate.ReportsDetails;
import com.huatek.fos.fundsreportgather.service.FundsGatherService;
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
 * 资金运用action类
 * 
 * @author: alan_zhang
 */
@Controller
@RequestMapping("/fundsApply.do")
@SessionAttributes(types = SourceUseFunds.class)
public class FundsApplyAction {

	/**
	 * 资金运用service类
	 */
	@Autowired
	private FundsApplyService fundsApplyService;
	/**
	 * 项目类目service类
	 */
	@Autowired
	private BaseProjectCategoriesService baseProjectCategoriesService;

	/**
	 * 资金统计service类
	 */
	@Autowired
	private FundsGatherService fundsGatherService;

	/**
	 * 资金运用编辑页面跳转路径
	 */
	private static final String EDIT_PAGE_PATH = "fos/fundsapplymanagement/fundsApply_edit.jsp";

	/**
	 * 资金运用查询页面跳转路径
	 */
	private static final String QUERY_PAGE_PATH = "fos/fundsapplymanagement/fundsApply_query.jsp";

	/**
	 * 资金运用查询列表页面跳转路径
	 */
	private static final String LIST_PAGEP_ATH = "fos/fundsapplymanagement/fundsApply_list.jsp";

	/**
	 * 资金运用编辑查询页面跳转路径(redirect方式)
	 */
	private static final String REDIRECT_QUERY_PATH = "redirect:fundsApply.do?actionMethod=editQuery";

	/**
	 * 导出页面
	 */
	private static final String EXPORT_PAGE_PATH = "fos/fundsapplymanagement/fundsApply_export_excel.jsp";

	/**
	 * 查询编辑资金运用页面初始化.
	 * 
	 * @param model
	 *            model对象
	 * @param request
	 *            请求对象
	 * @return 资金运用编辑页面跳转路径
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.GET)
	public String initPage(final Model model, final HttpServletRequest request)
			throws ParseException {
		// 统计日期（每月10日、20日或月底一天）
		String initDate = FosUtil.getInitDate();
		model.addAttribute("initDate", initDate);
		// 格式化当前系统时间，设置10日内日期及1个月内日期
		String systemDate = FosUtil.getStringDate(new Date());
		model.addAttribute("systemDate", systemDate);

		// 获取资金运用信息ID
		String id = request.getParameter("id");
		// 如果ID为空，则表示新增
		if (id == null) {
			model.addAttribute("sourceUseFunds", new SourceUseFunds());
		} else {
			// 获取copy操作标识
			String copy = request.getParameter("isCopy");
			// 如果操作表示不为空，则表示将把已录入数据复制到待录入页面元素中
			if (CommonUtil.isNotZeroLengthTrimString(copy)) {
				// 通过ID获取资金运用信息
				SourceUseFunds sourceUseFunds = (SourceUseFunds) fundsApplyService
						.getObjectById(SourceUseFunds.class, Long.valueOf(id));

				// 克隆资金运用信息对象
				SourceUseFunds copySourceUseFunds = new SourceUseFunds();
				BeanUtils.copyProperties(sourceUseFunds, copySourceUseFunds);
				// 清空资金运用信息ID，用来区分下次操作是编辑还是新增
				copySourceUseFunds.setId(null);
				copySourceUseFunds.setIsCopy("true");
				model.addAttribute("sourceUseFunds", copySourceUseFunds);
				// 否则，表示编辑资金运用信息
			} else {
				model.addAttribute("sourceUseFunds", fundsApplyService
						.getObjectById(SourceUseFunds.class, Long.valueOf(id)));
			}
		}
		String gatherDate = request.getParameter("gatherDate");
		Date date = FosUtil.getInitDate(gatherDate);
		model.addAttribute("gatherDate", date);
		// 获取查询项目类目
		model.addAttribute("categoriesList", baseProjectCategoriesService
				.getFirstCategory(Constant.FUNDS_APPLY_MOUDLE));

		return EDIT_PAGE_PATH;
	}

	/**
	 * 查询编辑资金运用页面初始化数据获取.
	 * 
	 * @param model
	 *            model对象
	 * @param request
	 *            request请求对象
	 * @return 资金运用查询列表页面跳转路径
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.POST)
	public String executeQuery(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		// 获取页面统计日期并格式化
		String initDate = request.getParameter("initDate");
		Date gatherDate = FosUtil.getInitDate(initDate);
		// 创建参数数组:统计日期,数据来源是资金运用
		Object[] params = new Object[] { gatherDate,
				Constant.DATA_SOURCES_FUNDS_APPLY };
		FwAccount account = ThreadLocalClient.get().getOperator();
		// 获取分页查询pageBean
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		// 获取查询结果
		model.addAttribute("pageBean", fundsApplyService.getFundsApply(
				pageBean, paramterList, params, account));
		return LIST_PAGEP_ATH;
	}

	/**
	 * 查询资金运用页面初始化.
	 * 
	 * @param model
	 *            model对象
	 * @param request
	 *            request请求对象
	 * @return 资金运用查询页面跳转路径
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.GET)
	public String queryInitPage(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 设置统计日期（每月10日、20日或月底一天）
		String initDate = FosUtil.getInitDate();
		model.addAttribute("initDate", initDate);
		return QUERY_PAGE_PATH;
	}

	/**
	 * 查询资金运用信息数据提交.
	 * 
	 * @param model
	 *            model对象
	 * @param request
	 *            request请求对象
	 * @return 资金运用查询列表页面跳转路径
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.POST)
	public String doSuperQuery(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 获取页面查询参数
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		// 查询页面执行数据提交请求标记（查询列表页面属于公共页面，部分按钮需要过滤）
		String superQuery = request.getParameter("superQuery");
		model.addAttribute("superQuery", superQuery);
		// 统计日期
		String initDate = request.getParameter("gatherDate");
		if (CommonUtil.isZeroLengthTrimString(initDate)) {
			return Util.printErrorString("请选择统计日期!");
		}
		// 格式化统计日期
		Date gatherDate = FosUtil.getInitDate(initDate);
		Object[] params = new Object[] { gatherDate,
				Constant.DATA_SOURCES_FUNDS_APPLY };
		FwAccount account = ThreadLocalClient.get().getOperator();
		// 获取分页查询pageBean
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		// 查询提交
		model.addAttribute("pageBean", fundsApplyService.getFundsApply(
				pageBean, parameterList, params, account));
		return LIST_PAGEP_ATH;
	}

	/***
	 * 新增或编辑资金运用数据信息.
	 * 
	 * @param model
	 *            model对象
	 * @param result
	 *            request请求对象
	 * @param status
	 *            session状态
	 * @return 资金运用编辑查询页面跳转路径(POST方式)
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEdit(final Model model,
			@ModelAttribute final SourceUseFunds sourceUseFunds,
			final BindingResult result, final SessionStatus status)
			throws ParseException {
		// 提交数据验证
		validate(sourceUseFunds, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,
					"sourceUseFundsForm"));
		}

		// 获取当前登录系统用户
		FwAccount account = ThreadLocalClient.get().getOperator();

		// 根据统计日期和报表名称获取该部门下的报表审核记录
		List<AuditReportRecord> auditReportRecordsList = fundsApplyService
				.getAuditReportRecord(sourceUseFunds.getGatherDate(),
						Constant.FUNDS_USE_REPORT_NAME, account);
		if (auditReportRecordsList != null
				&& auditReportRecordsList.size() != 0) {
			// 获取审核记录对象
			AuditReportRecord auditReportRecord = auditReportRecordsList.get(0);
			// 获取分管领导审核状态
			String leaderAuditState = auditReportRecord.getLeaderAuditState();
			// 如果审核状态是已完成
			if (leaderAuditState.equals(Constant.LEADER_AUDIT_STATE_YES)) {
				return Util.printErrorString("当前统计日期下的报表已经生成，无法执行操作!");
			}
		}

		// 根据查询条件获取所有部门报表汇总明细
		List<ReportsDetails> reportsDetailsList = fundsGatherService
				.getReportsDetails(Constant.REPORTS_USE_TOTAL,
						sourceUseFunds.getGatherDate());
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

		// 新增或编辑提交
		fundsApplyService.saveOrUpdateApplyFunds(sourceUseFunds, account);
		// 清空session
		status.setComplete();
		return REDIRECT_QUERY_PATH + "&gatherDate="
				+ FosUtil.getStringDate(sourceUseFunds.getGatherDate());
	}

	/***
	 * 删除资金运用数据信息.
	 * 
	 * @param id
	 *            资金运用ID
	 * @return 资金运用编辑查询页面跳转路径(POST方式)
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=delete")
	public String delete(@RequestParam("id") final Long id)
			throws ParseException {
		// 根据ID查询资金运用对象
		SourceUseFunds sourceUseFunds = (SourceUseFunds) fundsApplyService
				.getObjectById(SourceUseFunds.class, id);
		if (sourceUseFunds != null) {
			// 获取当前登录系统用户
			FwAccount account = ThreadLocalClient.get().getOperator();
			// 根据查询条件确认是否只有一条该统计日起下的资金运用数据
			List<SourceUseFunds> sourceUseFundsList = fundsApplyService
					.getFundsApplyByParam(sourceUseFunds, account);
			// 如果只有一条数据
			if (sourceUseFundsList != null && sourceUseFundsList.size() == 1) {
				// 则，获取报表审核信息
				List<AuditReportRecord> auditReportRecordsList = fundsApplyService
						.getAuditReportRecord(sourceUseFunds.getGatherDate(),
								Constant.FUNDS_USE_REPORT_NAME, account);
				// 如果信息存在，则删除审核表头信息
				if (auditReportRecordsList != null
						&& auditReportRecordsList.size() > 0) {
					fundsApplyService.delete(auditReportRecordsList.get(0));
				}
			}
			// 执行删除操作
			fundsApplyService.delete(sourceUseFunds);
		}
		return REDIRECT_QUERY_PATH + "&gatherDate="
				+ FosUtil.getStringDate(sourceUseFunds.getGatherDate());
	}

	/**
	 * 新增/编辑项目类目数据校验方法.
	 * 
	 * @param category
	 *            项目类目对象
	 * @param errors
	 *            错误信息
	 * 
	 */
	public static void validate(final SourceUseFunds sourceUseFunds,
			final Errors errors) {

		// 项目类别不能为空
		if (sourceUseFunds.getFirstCategory() == null) {
			errors.rejectValue("firstCategory", "required", "required");
		}
		// 统计日期不能为空
		if (sourceUseFunds.getGatherDate() == null) {
			errors.rejectValue("gatherDate", "required", "required");
		}
		// 项目名称不能为空
		if (CommonUtil.isZeroLengthTrimString(sourceUseFunds.getProjectName())) {
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
		// 如果金额为空，默认设置为0
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
		if (sourceUseFunds.getaMonthDate() != null
				&& sourceUseFunds.getGatherDate() != null) {
			if (sourceUseFunds.getaMonthDate().getTime() < sourceUseFunds
					.getGatherDate().getTime()) {
				throw new BusinessRuntimeException("一月内日期必须大于统计日期");
			}
		}
		// 数据长度校验
		ValidateFieldLength.validateMaxLength(errors, "projectName", 200,
				"maxLimitLength", "输入超长。");

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
		dataBinder.registerCustomEditor(Date.class, "tenDaysDate", dateEditor);
		dataBinder.registerCustomEditor(Date.class, "aMonthDate", dateEditor);
		dataBinder.registerCustomEditor(BaseProjectCategories.class,
				"firstCategory", new BaseEntityEditor(
						BaseProjectCategories.class));
	}

	/**
	 * 导出
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=export", method = RequestMethod.POST)
	public String exportAssemble(final Model model,
			final HttpServletRequest request,
			@RequestParam("gatherDate") final String gatherDate)
			throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		if (CommonUtil.isZeroLengthTrimString(gatherDate)) {
			return Util.printErrorString("请选择统计日期!");
		}
		Date date = FosUtil.getInitDate(gatherDate);
		Object[] params = new Object[] { date };
		FwAccount account = ThreadLocalClient.get().getOperator();
		List<AuditReportRecord> list = fundsApplyService.getAuditReportRecord(
				date, Constant.FUNDS_USE_REPORT_NAME, account);
		if (list != null && list.size() > 0) {
			AuditReportRecord auditReportRecord = list.get(0);
			if (Constant.LEADER_AUDIT_STATE_YES.equals(auditReportRecord
					.getLeaderAuditState())) {
				// 获取分页查询pageBean
				CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
				pageBean = fundsApplyService.getFundsApplyPreview(pageBean,
						parameterList, params, account);
				List dataList = pageBean.getDataList();
				if (dataList != null && dataList.size() > 0) {
					fundsApplyService.orgnizationFirstData(dataList);
				}
				model.addAttribute("depart", auditReportRecord.getGroup()
						.getName());
				model.addAttribute("org", auditReportRecord.getOrgUserName());
				model.addAttribute("leader",
						auditReportRecord.getMgLeaderUserName());
				model.addAttribute("pageBean", pageBean);
				model.addAttribute("fileName", "资金运用滚动计划信息.xls");

				fundsGatherService.saveExportReportsRecord(auditReportRecord,
						null, account, Constant.FUNDS_USE_REPORT_NAME,
						Constant.REPORTS_USE_ONE);
				fundsGatherService.saveOrUpdateReportsDetails(account,
						Constant.REPORTS_USE_ONE, date,
						Constant.DATA_SOURCES_FUNDS_APPLY);

				return EXPORT_PAGE_PATH;
			} else {
				return Util.printErrorString("报表未通过审核，无法导出!");
			}

		}
		return Util.printErrorString("无可导出的报表!");

	}
}
