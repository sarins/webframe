package com.huatek.fos.fundsreportgather.action;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huatek.fos.fundsmanagement.entity.hibernate.AuditReportRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.fos.fundsmanagement.service.FundsApplyService;
import com.huatek.fos.fundsmanagement.service.FundsOriginService;
import com.huatek.fos.fundsreportgather.entity.hibernate.ExportReportsRecord;
import com.huatek.fos.fundsreportgather.entity.hibernate.FundsOriginGather;
import com.huatek.fos.fundsreportgather.service.FundsGatherService;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;

/**
 * 资金来源汇总action类
 * 
 * @author: Marvin Liu and Alan Zhang
 */
@Controller
@RequestMapping("/fundsOriginGather.do")
@SessionAttributes(types = FundsOriginGather.class)
public class FundsOriginGatherAction {

	/**
	 * 资金来源运用汇总service类
	 */
	@Autowired
	private FundsGatherService fundsGatherService;
	/**
	 * 资金来源service类
	 */
	@Autowired
	private FundsOriginService fundsOriginService;

	/**
	 * 资金运用service类
	 */
	@Autowired
	private FundsApplyService fundsApplyService;

	/**
	 * 资金来源汇总预览
	 */
	private static final String LIST_GATHER_PAGEP_PATH = "fos/fundsGathermanagement/fundsOriginGather.jsp";

	/**
	 * 资金来源查询列表页面跳转路径
	 */
	private static final String LIST_PAGEP_PATH = "fos/fundsGathermanagement/fundsOriginPreview.jsp";

	/**
	 * 资金来源汇总导出.
	 */
	private static final String GATHER_EXPORT_PAGE_PATH = "fos/fundsGathermanagement/fundsOrigin_gather_export_excel.jsp";

	/**
	 * 资金来源报表导出（单部门）
	 */
	private static final String EXPORT_PAGE_PATH = "fos/fundsmanagement/fundsOrigin_export_excel.jsp";

	/**
	 * 汇总报表预览(部门汇总).
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=gatherOriginPreview")
	public String gatherApplyPreview(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, FundsOriginGather.class);
		String gatherDate = request.getParameter("gatherDate");
		Date date = FosUtil.getInitDate(gatherDate);
		Object[] params = new Object[] { date };
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		pageBean = fundsGatherService.getAllFundsOriginGather(pageBean,
				parameterList, params);
		List dataList = pageBean.getDataList();
		if (dataList != null && dataList.size() > 0) {
			fundsGatherService.orgnizationOriginFirstData(dataList);
			fundsGatherService.orgnizationOriginSecondData(dataList);
		}
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("gatherDate", gatherDate);
		return LIST_GATHER_PAGEP_PATH;
	}

	/**
	 * 汇总报表预览（单部门预览）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=originPreview")
	public String auditPreview(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		String gatherDate = request.getParameter("gatherDate");
		Date date = FosUtil.getInitDate(gatherDate);
		Object[] params = new Object[] { date };
		FwAccount account = ThreadLocalClient.get().getOperator();
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		pageBean = fundsOriginService.getFundsOriPreviewPageBean(pageBean,
				parameterList, params, account);
		List dataList = pageBean.getDataList();
		if (dataList != null && dataList.size() > 0) {
			fundsOriginService.orgnizationFirstData(dataList);
			fundsOriginService.orgnizationSecondData(dataList);
		}
		model.addAttribute("initDate", gatherDate);
		model.addAttribute("pageBean", pageBean);
		return LIST_PAGEP_PATH;
	}

	/**
	 * 资金运用报表导出（部门汇总导出)
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=gatherExport", method = RequestMethod.POST)
	public String exportAssembleGather(final Model model,
			final HttpServletRequest request,
			@RequestParam("gatherDate") final String gatherDate)
			throws ParseException {
		Date date = FosUtil.getInitDate(gatherDate);
		List<ExportReportsRecord> list = fundsGatherService
				.getExportReportsRecord(Constant.FUNDS_ORI_GATHER_REPORT_NAME,
						Constant.REPORTS_USE_TOTAL, date);
		if (list != null && list.size() > 0) {
			ExportReportsRecord exportReportsRecord = list.get(0);
			Object[] params = new Object[] { date };
			List<CommonBean> parameterList = QueryCondition.getQueryCondition(
					request, SourceUseFunds.class);
			// 获取分页查询pageBean
			CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
			pageBean = fundsGatherService.getAllFundsOriginGather(pageBean,
					parameterList, params);
			List dataList = pageBean.getDataList();
			if (dataList != null && dataList.size() > 0) {
				fundsGatherService.orgnizationOriginFirstData(dataList);
				fundsGatherService.orgnizationOriginSecondData(dataList);
			}
			List<FwGroup> groupList = fundsGatherService.getUnGatherDepartMent(
					Constant.FUNDS_ORI_REPORT_NAME, date);
			model.addAttribute("depart", exportReportsRecord.getGroup()
					.getName());
			model.addAttribute("org", exportReportsRecord.getOrgUserName());
			model.addAttribute("leader",
					exportReportsRecord.getMgLeaderUserName());
			model.addAttribute("pageBean", pageBean);
			model.addAttribute("groupList", groupList);
			model.addAttribute("fileName",
					Constant.FUNDS_ORI_GATHER_REPORT_NAME + ".xls");
			return GATHER_EXPORT_PAGE_PATH;
		} else {
			return Util.printErrorString("报表未生成，无法导出!");
		}
	}

	/**
	 * 资金运用报表导出（单部门导出)
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

		// 获取查询条件
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		// 格式化日期
		Date date = FosUtil.getInitDate(gatherDate);
		// 设置查询参数
		Object[] params = new Object[] { date };
		// 获取当前登录系统用户
		FwAccount account = ThreadLocalClient.get().getOperator();
		// 获取分页pageBean
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		// 获取查询结果
		pageBean = fundsOriginService.getFundsOriPreviewPageBean(pageBean,
				parameterList, params, account);
		List dataList = pageBean.getDataList();
		if (dataList != null && dataList.size() > 0) {
			// 组装预览信息
			fundsOriginService.orgnizationFirstData(dataList);
			fundsOriginService.orgnizationSecondData(dataList);
			// 获取审核记录信息
			List<AuditReportRecord> auditReportRecordList = fundsApplyService
					.getAuditReportRecord(date, Constant.FUNDS_ORI_REPORT_NAME,
							account);
			if (auditReportRecordList != null
					&& auditReportRecordList.size() > 0) {
				AuditReportRecord auditReportRecord = auditReportRecordList
						.get(0);
				// 设置编制部门
				model.addAttribute("depart", auditReportRecord.getGroup()
						.getName());
				// 设置编制人
				model.addAttribute("org", auditReportRecord.getOrgUserName());
				// 设置分管领导
				model.addAttribute("leader",
						auditReportRecord.getMgLeaderUserName());
				model.addAttribute("pageBean", pageBean);
				// 设置报表名称
				model.addAttribute("fileName", Constant.FUNDS_ORI_REPORT_NAME
						+ ".xls");
			}
		} else {
			return Util.printErrorString("报表未生成，无法导出!");
		}
		return EXPORT_PAGE_PATH;
	}
}
