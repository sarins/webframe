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
import com.huatek.fos.fundsreportgather.entity.hibernate.ExportReportsRecord;
import com.huatek.fos.fundsreportgather.entity.hibernate.FundsApplyGather;
import com.huatek.fos.fundsreportgather.service.FundsGatherService;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;

/**
 * 资金运用汇总action类
 * 
 * @author: Marvin Liu and Alan Zhang
 */
@Controller
@RequestMapping("/fundsApplyGather.do")
@SessionAttributes(types = FundsApplyGather.class)
public class FundsApplyGatherAction {

	/**
	 * 资金来源运用汇总service类
	 */
	@Autowired
	private FundsGatherService fundsGatherService;

	/**
	 * 资金运用service类
	 */
	@Autowired
	private FundsApplyService fundsApplyService;

	/**
	 * 资金运用单部门预览
	 */
	private static final String LIST_PAGEP_PATH = "fos/fundsGathermanagement/fundsApplyPreview.jsp";

	/**
	 * 资金运用汇总预览
	 */
	private static final String LIST_GATHER_PAGEP_PATH = "fos/fundsGathermanagement/fundsApplyGather.jsp";

	/**
	 * 资金运用汇总导出.
	 */
	private static final String GATHER_EXPORT_PAGE_PATH = "fos/fundsGathermanagement/fundsApply_gather_export_excel.jsp";

	/**
	 * 资金运用报表导出（单部门）
	 */
	private static final String EXPORT_PAGE_PATH = "fos/fundsapplymanagement/fundsApply_export_excel.jsp";

	/**
	 * 汇总报表预览（部门汇总）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=gatherApplyPreview")
	public String gatherApplyPreview(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, FundsApplyGather.class);
		String gatherDate = request.getParameter("gatherDate");
		Date date = FosUtil.getInitDate(gatherDate);
		Object[] params = new Object[] { date };
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		pageBean = fundsGatherService.getAllFundsApplyGather(pageBean,
				parameterList, params);
		List dataList = pageBean.getDataList();
		if (dataList != null && dataList.size() > 0) {
			fundsGatherService.orgnizationApplyFirstData(dataList);
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
	@RequestMapping(params = "actionMethod=applyPreview")
	public String auditPreview(final Model model,
			final HttpServletRequest request) throws ParseException {
		// 获取查询条件
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, SourceUseFunds.class);
		// 获取统计日期
		String gatherDate = request.getParameter("gatherDate");
		// 格式化日期
		Date date = FosUtil.getInitDate(gatherDate);
		// 设置查询参数
		Object[] params = new Object[] { date };

		// 获取当前登录系统用户
		FwAccount account = ThreadLocalClient.get().getOperator();

		// 获取分页pageBean
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		// 获取查询结果
		pageBean = fundsApplyService.getFundsApplyPreview(pageBean,
				parameterList, params, account);
		List dataList = pageBean.getDataList();

		if (dataList != null && dataList.size() > 0) {
			// 预览结果组装
			fundsApplyService.orgnizationFirstData(dataList);
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
				.getExportReportsRecord(Constant.FUNDS_USE_GATHER_REPORT_NAME,
						Constant.REPORTS_USE_TOTAL, date);
		if (list != null && list.size() > 0) {
			ExportReportsRecord exportReportsRecord = list.get(0);
			Object[] params = new Object[] { date };
			List<CommonBean> parameterList = QueryCondition.getQueryCondition(
					request, SourceUseFunds.class);
			// 获取分页查询pageBean
			CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
			pageBean = fundsGatherService.getAllFundsApplyGather(pageBean,
					parameterList, params);
			List dataList = pageBean.getDataList();
			if (dataList != null && dataList.size() > 0) {
				fundsGatherService.orgnizationApplyFirstData(dataList);
			}
			List<FwGroup> groupList = fundsGatherService.getUnGatherDepartMent(
					Constant.FUNDS_USE_REPORT_NAME, date);
			model.addAttribute("depart", exportReportsRecord.getGroup()
					.getName());
			model.addAttribute("org", exportReportsRecord.getOrgUserName());
			model.addAttribute("leader",
					exportReportsRecord.getMgLeaderUserName());
			model.addAttribute("pageBean", pageBean);
			model.addAttribute("groupList", groupList);
			model.addAttribute("fileName",
					Constant.FUNDS_USE_GATHER_REPORT_NAME + ".xls");
			return GATHER_EXPORT_PAGE_PATH;
		} else {
			return Util.printErrorString("报表未生成，无法导出!");
		}
	}

	/**
	 * 资金运用报表导出（单部门）
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
		pageBean = fundsApplyService.getFundsApplyPreview(pageBean,
				parameterList, params, account);
		List dataList = pageBean.getDataList();
		if (dataList != null && dataList.size() > 0) {
			// 组装预览内容
			fundsApplyService.orgnizationFirstData(dataList);
			// 获取报表审核记录
			List<AuditReportRecord> auditReportRecordList = fundsApplyService
					.getAuditReportRecord(date, Constant.FUNDS_USE_REPORT_NAME,
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
				model.addAttribute("fileName", Constant.FUNDS_USE_REPORT_NAME
						+ ".xls");
			}
		} else {
			return Util.printErrorString("报表未生成，无法导出!");
		}
		return EXPORT_PAGE_PATH;
	}
}
