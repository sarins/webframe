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
import com.huatek.fos.fundsmanagement.service.FundsOriginService;
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
 * 
 * 
 * @author: marvin_liu
 * 
 * @version $Id: FundsOriginAction.java, v 0.1 2013-5-21 下午04:16:10 $
 * 
 *          Comment: 资金来源控制层
 */
@Controller
@RequestMapping("/fundsOrigin.do")
@SessionAttributes(types = SourceUseFunds.class)
public class FundsOriginAction {

	/**
	 * 资金来源管理的service.
	 */
	@Autowired
	private FundsOriginService fundsOriginService;

	/**
	 * 资金运用service类
	 */
	@Autowired
	private FundsApplyService fundsApplyService;

	/**
	 * 项目管理的service.
	 */
	@Autowired
	private BaseProjectCategoriesService projectCategoriesService;

	/**
	 * 资金统计service.
	 */
	@Autowired
	private FundsGatherService fundsGatherService;
	/**
	 * 资金来源录入页面.
	 */
	private static final String QUERYPAGEPATH = "fos/fundsmanagement/fundsOrigin_edit_query.jsp";
	/**
	 * 资金来源查询页面.
	 */
	private static final String SUPERQUERYPAGEPATH = "fos/fundsmanagement/fundsOrigin_query.jsp";
	/**
	 * 资金来源列表页面.
	 */
	private static final String LISTPAGEPATH = "fos/fundsmanagement/fundsOrigin_list.jsp";

	/**
	 * 重定向至资金来源查询页面.
	 */
	private static final String REDIRECTQUERYPATH = "redirect:fundsOrigin.do?actionMethod=editQuery";

	private static final String EXPORT_PAGE_PATH = "fos/fundsmanagement/fundsOrigin_export_excel.jsp";

	/**
	 * 录入表头.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.GET)
	public String query(final Model model, final HttpServletRequest request)
			throws ParseException {
		String initDate = FosUtil.getInitDate();
		model.addAttribute("initDate", initDate);
		String systemDate = FosUtil.getStringDate(new Date());
		model.addAttribute("systemDate", systemDate);
		String id = request.getParameter("id");
		if (id == null) {
			model.addAttribute("sourceUseFunds", new SourceUseFunds());
		} else {
			String copy = request.getParameter("iscopy");
			if (CommonUtil.isNotZeroLengthTrimString(copy)) {
				SourceUseFunds sourceUseFunds = (SourceUseFunds) fundsOriginService
						.getObjectById(SourceUseFunds.class, Long.valueOf(id));
				SourceUseFunds copySourceUseFunds = new SourceUseFunds();
				BeanUtils.copyProperties(sourceUseFunds, copySourceUseFunds);
				copySourceUseFunds.setId(null);
				copySourceUseFunds.setIsCopy("true");
				model.addAttribute("sourceUseFunds", copySourceUseFunds);
			} else {
				model.addAttribute("sourceUseFunds", fundsOriginService
						.getObjectById(SourceUseFunds.class, Long.valueOf(id)));
			}
		}
		String gatherDate = request.getParameter("gatherDate");
		Date date = FosUtil.getInitDate(gatherDate);
		model.addAttribute("gatherDate", date);
		List<BaseProjectCategories> cateList = projectCategoriesService
				.getFirstCategory(Constant.FUNDS_ORIGIN_MOUDLE);
		model.addAttribute("cateList", cateList);
		return QUERYPAGEPATH;
	}

	/**
	 * 查询表头.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.GET)
	public String superQuery(final Model model, final HttpServletRequest request)
			throws ParseException {
		String initDate = FosUtil.getInitDate();
		model.addAttribute("initDate", initDate);
		return SUPERQUERYPAGEPATH;
	}

	/**
	 * 查询列表.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=editQuery", method = RequestMethod.POST)
	public String doQuery(final Model model, final HttpServletRequest request)
			throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		String initDate = request.getParameter("initDate");
		Date gatherDate = FosUtil.getInitDate(initDate);
		Object[] params = new Object[] { gatherDate };
		FwAccount account = ThreadLocalClient.get().getOperator();
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("pageBean", fundsOriginService.getFundsOriPageBean(
				pageBean, parameterList, params, account));
		return LISTPAGEPATH;
	}

	/**
	 * 查询列表.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.POST)
	public String doSuperQuery(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		String superQuery = request.getParameter("superQuery");
		model.addAttribute("superQuery", superQuery);
		String initDate = request.getParameter("gatherDate");
		if (CommonUtil.isZeroLengthTrimString(initDate)) {
			return Util.printErrorString("请首先选择统计日期！");
		}
		Date gatherDate = FosUtil.getInitDate(initDate);
		Object[] params = new Object[] { gatherDate };
		FwAccount account = ThreadLocalClient.get().getOperator();
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("pageBean", fundsOriginService.getFundsOriPageBean(
				pageBean, parameterList, params, account));
		return LISTPAGEPATH;
	}

	/***
	 * 保存.
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
			final BindingResult result, final SessionStatus status)
			throws ParseException {
		validate(sourceUseFunds, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,
					"sourceUseFundsForm"));
		}
		FwAccount account = ThreadLocalClient.get().getOperator();

		// 根据统计日期和报表名称获取该部门下的报表审核记录
		List<AuditReportRecord> auditReportRecordsList = fundsApplyService
				.getAuditReportRecord(sourceUseFunds.getGatherDate(),
						Constant.FUNDS_ORI_REPORT_NAME, account);
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
					.getOneReportsName())) {
				return Util
						.printErrorString("当前统计日期下的所有部门资金来源汇总报表已经生成，无法执行该操作！");
			}
		}

		fundsOriginService.saveSourceUseFunds(sourceUseFunds, account);
		status.setComplete();
		return REDIRECTQUERYPATH + "&gatherDate="
				+ FosUtil.getStringDate(sourceUseFunds.getGatherDate());
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
		dataBinder.registerCustomEditor(BaseProjectCategories.class,
				"sencondCategory", new BaseEntityEditor(
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
		SourceUseFunds sourceUseFunds = (SourceUseFunds) fundsOriginService
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
								Constant.FUNDS_ORI_REPORT_NAME, account);
				// 如果信息存在，则删除审核表头信息
				if (auditReportRecordsList != null
						&& auditReportRecordsList.size() > 0) {
					fundsApplyService.delete(auditReportRecordsList.get(0));
				}
			}
			fundsOriginService.delete(sourceUseFunds);
		}
		return REDIRECTQUERYPATH + "&gatherDate="
				+ FosUtil.getStringDate(sourceUseFunds.getGatherDate());
	}

	/**
	 * 新增/编辑项目类目数据校验方法.
	 * 
	 * @param sourceUseFunds
	 *            资金来源对象
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
		if (sourceUseFunds.getSencondCategory() == null) {
			errors.rejectValue("sencondCategory", "required", "required");
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

		if (CommonUtil.isZeroLengthTrimString(gatherDate)) {
			return Util.printErrorString("请选择统计日期!");
		}
		Date date = FosUtil.getInitDate(gatherDate);
		FwAccount account = ThreadLocalClient.get().getOperator();
		List<AuditReportRecord> list = fundsApplyService.getAuditReportRecord(
				date, Constant.FUNDS_ORI_REPORT_NAME, account);
		if (list != null && list.size() > 0) {
			AuditReportRecord auditReportRecord = list.get(0);
			if (Constant.LEADER_AUDIT_STATE_YES.equals(auditReportRecord
					.getLeaderAuditState())) {
				Object[] params = new Object[] { date };
				List<CommonBean> parameterList = QueryCondition
						.getQueryCondition(request, SourceUseFunds.class);

				// 获取分页查询pageBean
				CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
				pageBean = fundsOriginService.getFundsOriPreviewPageBean(
						pageBean, parameterList, params, account);
				List dataList = pageBean.getDataList();
				if (dataList != null && dataList.size() > 0) {
					fundsOriginService.orgnizationFirstData(dataList);
					fundsOriginService.orgnizationSecondData(dataList);
				}
				model.addAttribute("depart", auditReportRecord.getGroup()
						.getName());
				model.addAttribute("org", auditReportRecord.getOrgUserName());
				model.addAttribute("leader",
						auditReportRecord.getMgLeaderUserName());
				model.addAttribute("pageBean", pageBean);
				model.addAttribute("fileName", "资金来源滚动计划信息.xls");

				fundsGatherService.saveExportReportsRecord(auditReportRecord,
						null, account, Constant.FUNDS_ORI_REPORT_NAME,
						Constant.REPORTS_USE_ONE);
				fundsGatherService.saveOrUpdateReportsDetails(account,
						Constant.REPORTS_USE_ONE, date,
						Constant.DATA_SOURCES_FUNDS_RIO);
				return EXPORT_PAGE_PATH;
			} else {
				return Util.printErrorString("报表未通过审核，无法导出!");
			}
		}
		return Util.printErrorString("无可导出的报表!");

	}

}
