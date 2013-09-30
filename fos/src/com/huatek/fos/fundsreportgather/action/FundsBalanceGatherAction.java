package com.huatek.fos.fundsreportgather.action;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huatek.fos.basemanagement.entity.hibernate.InitSettlement;
import com.huatek.fos.fundsreportgather.entity.hibernate.ExportReportsRecord;
import com.huatek.fos.fundsreportgather.entity.hibernate.FundsApplyGather;
import com.huatek.fos.fundsreportgather.entity.hibernate.FundsOriginGather;
import com.huatek.fos.fundsreportgather.service.FundsGatherService;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwGroup;
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
@RequestMapping("/fundsBalanceGather.do")
@SessionAttributes(types = FundsApplyGather.class)
public class FundsBalanceGatherAction {

	/**
	 * 资金来源运用汇总service类
	 */
	@Autowired
	private FundsGatherService fundsGatherService;

	/**
	 * 资金运用单部门预览
	 */
	private static final String LIST_EXPORT_PAGEP_PATH = "fos/fundsGathermanagement/fundsBalance_gather_export_excel.jsp";

	/**
	 * 资金平衡分析汇总预览
	 */
	private static final String LIST_GATHER_PAGEP_PATH = "fos/fundsGathermanagement/fundsBalanceGather.jsp";

	/**
	 * 汇总报表预览(部门汇总).
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=gatherBalancePreview")
	public String gatherApplyPreview(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, FundsOriginGather.class);
		String gatherDate = request.getParameter("gatherDate");
		Date date = FosUtil.getInitDate(gatherDate);
		Object[] params = new Object[] { date };
		CutPageBean pageBeanOri = QueryCondition.getQueryPageBean(request);
		CutPageBean pageBeanApply = QueryCondition.getQueryPageBean(request);
		pageBeanOri = fundsGatherService.getAllFundsOriginGather(pageBeanOri,
				parameterList, params);
		List originDataList = pageBeanOri.getDataList();
		if (originDataList != null && originDataList.size() > 0) {
			fundsGatherService.orgnizationOriginSecondData(originDataList);
		}

		pageBeanApply = fundsGatherService.getAllFundsApplyGather(
				pageBeanApply, parameterList, params);
		List applyDataList = pageBeanApply.getDataList();
		if (applyDataList != null && applyDataList.size() > 0) {
			fundsGatherService.orgnizationApplyFirstData(applyDataList);
		}

		// 获取资金收入、资金支出
		Map<String, BigDecimal> totalOriginMap = this
				.getFundsOriginTotalMoney(originDataList);
		Map<String, BigDecimal> totalApplyMap = this
				.getFundsApplyTotalMoney(applyDataList);
		// 自有资金期初结转金额、财政专户期初结转金额
		Map<String, BigDecimal> ownSettlementMoneyMap = this
				.setInitSettlementMoney(date, totalApplyMap, totalOriginMap,
						Constant.INIT_SETTLEMENT_MONEY_OWN);
		Map<String, BigDecimal> financeSettlementMoneyMap = this
				.setInitSettlementMoney(date, totalApplyMap, totalOriginMap,
						Constant.INIT_SETTLEMENT_MONEY_FINANCE);
		model.addAttribute("totalOriginMap", totalOriginMap);
		model.addAttribute("totalApplyMap", totalApplyMap);
		model.addAttribute("ownSettlementMoneyMap", ownSettlementMoneyMap);
		model.addAttribute("financeSettlementMoneyMap",
				financeSettlementMoneyMap);
		model.addAttribute("fundsOriList", originDataList);
		model.addAttribute("applyDataList", applyDataList);
		model.addAttribute("gatherDate", gatherDate);
		return LIST_GATHER_PAGEP_PATH;
	}

	/**
	 * 设置平衡分析期初结转金额
	 * 
	 * @param fundsApplyGather
	 *            查询资金运用视图对象
	 * @param fundsOriginGather
	 *            查询资金来源视图对象
	 * @param totalApplyMap
	 *            资金收入汇总金额Map
	 * @param totalOriginMap
	 *            资金支出汇总金额Map return 期初结转金额
	 */
	private Map<String, BigDecimal> setInitSettlementMoney(Date gatherDate,
			Map<String, BigDecimal> totalApplyMap,
			Map<String, BigDecimal> totalOriginMap, String useType) {
		// 根据统计日期获取平衡分析期初结转金额
		List<InitSettlement> initSettlementList = fundsGatherService
				.getInitSettlementByGatherDate(gatherDate, useType);
		// 设置期初结转金额Map
		Map<String, BigDecimal> settlementMoneyMap = new HashMap<String, BigDecimal>();
		// 如果期初结转金额列表不为空
		if (initSettlementList != null && initSettlementList.size() > 0) {
			// 设置期初结转金额
			BigDecimal totalSettlement = new BigDecimal(0);
			BigDecimal tenDaysSettlement = new BigDecimal(0);
			BigDecimal aMonthSettlement = new BigDecimal(0);
			BigDecimal twoMonthsSettlement = new BigDecimal(0);
			BigDecimal threeMonthsSettlement = new BigDecimal(0);
			BigDecimal sixMonthsSettlement = new BigDecimal(0);
			BigDecimal moreSixMonthsSettlement = new BigDecimal(0);
			// 获取当前统计日期下的期初结转金额
			InitSettlement initSettlement = initSettlementList.get(0);
			BigDecimal settlementMoney = initSettlement.getSettlementMoney();
			// 分别设置不同时期的期初期初结转金额
			tenDaysSettlement = settlementMoney;
			aMonthSettlement = tenDaysSettlement.add(
					totalOriginMap.get("aMonthTotal")).subtract(
					totalApplyMap.get("aMonthTotal"));
			twoMonthsSettlement = aMonthSettlement.add(
					totalOriginMap.get("twoMonthsTotal")).subtract(
					totalApplyMap.get("twoMonthsTotal"));
			threeMonthsSettlement = twoMonthsSettlement.add(
					totalOriginMap.get("threeMonthsTotal")).subtract(
					totalApplyMap.get("threeMonthsTotal"));
			sixMonthsSettlement = threeMonthsSettlement.add(
					totalOriginMap.get("sixMonthsTotal")).subtract(
					totalApplyMap.get("sixMonthsTotal"));
			moreSixMonthsSettlement = sixMonthsSettlement.add(
					totalOriginMap.get("moreSixMonthsTotal")).subtract(
					totalApplyMap.get("moreSixMonthsTotal"));
			// 设置期初结转金额总和
			totalSettlement = tenDaysSettlement.add(aMonthSettlement)
					.add(twoMonthsSettlement).add(threeMonthsSettlement)
					.add(sixMonthsSettlement).add(moreSixMonthsSettlement);
			// 添加设置完成的期初结转金额
			settlementMoneyMap.put("totalSettlement", totalSettlement);
			settlementMoneyMap.put("tenDaysSettlement", tenDaysSettlement);
			settlementMoneyMap.put("aMonthSettlement", aMonthSettlement);
			settlementMoneyMap.put("twoMonthsSettlement", twoMonthsSettlement);
			settlementMoneyMap.put("threeMonthsSettlement",
					threeMonthsSettlement);
			settlementMoneyMap.put("sixMonthsSettlement", sixMonthsSettlement);
			settlementMoneyMap.put("moreSixMonthsSettlement",
					moreSixMonthsSettlement);
		}
		return settlementMoneyMap;
	}

	/**
	 * 计算资金支出合计金额
	 * 
	 * @param fundsApplyGatherList
	 *            资金运用视图对象列表
	 * @return 资金支出合计金额Map
	 */
	private Map<String, BigDecimal> getFundsApplyTotalMoney(
			List<FundsApplyGather> fundsApplyGatherList) {
		Map<String, BigDecimal> totalApplyMap = new HashMap<String, BigDecimal>();
		if (fundsApplyGatherList != null && fundsApplyGatherList.size() > 0) {
			// 初始化合计金额
			BigDecimal total = new BigDecimal(0);
			BigDecimal tenDaysTotal = new BigDecimal(0);
			BigDecimal aMonthTotal = new BigDecimal(0);
			BigDecimal twoMonthsTotal = new BigDecimal(0);
			BigDecimal threeMonthsTotal = new BigDecimal(0);
			BigDecimal sixMonthsTotal = new BigDecimal(0);
			BigDecimal moreSixMonthsTotal = new BigDecimal(0);
			for (int i = 0; i < fundsApplyGatherList.size(); i++) {
				// 获取资金运用视图对象
				FundsApplyGather fundsApplyGather = fundsApplyGatherList.get(i);
				// 由于合计金额存储在同一个一级分类的第一条记录上，所以每个不同的分类只有存在合计的那条记录才获取合计信息
				if (fundsApplyGather.getFirstProjectCount() != null) {
					// 获取每个分类的合计金额
					BigDecimal tenDaysMoney = fundsApplyGather
							.getTenDaysMoneySummaryFirst();
					BigDecimal aMonthMoney = fundsApplyGather
							.getaMonthMoneySummaryFirst();
					BigDecimal twoMonthsMoney = fundsApplyGather
							.getTwoMonthsMoneySummaryFirst();
					BigDecimal threeMonthsMoney = fundsApplyGather
							.getThreeMonthsMoneySummaryFirst();
					BigDecimal sixMonthsMoney = fundsApplyGather
							.getSixMonthsMoneySummaryFirst();
					BigDecimal moreSixMonthsMoney = fundsApplyGather
							.getMoreSixMonthsMoneySummaryFirst();
					// 设置资金收入合计金额
					BigDecimal totalMoney = fundsApplyGather
							.getFirstProjectMoneySummary();
					// 计算资金支出合计金额
					tenDaysTotal = tenDaysTotal.add(tenDaysMoney);
					aMonthTotal = aMonthTotal.add(aMonthMoney);
					twoMonthsTotal = twoMonthsTotal.add(twoMonthsMoney);
					threeMonthsTotal = threeMonthsTotal.add(threeMonthsMoney);
					sixMonthsTotal = sixMonthsTotal.add(sixMonthsMoney);
					moreSixMonthsTotal = moreSixMonthsTotal
							.add(moreSixMonthsMoney);
					total = total.add(totalMoney);
				}
			}

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
	 * 计算资金收入合计金额
	 * 
	 * @param fundsApplyGatherList
	 *            资金来源视图对象列表
	 * @return 资金收入合计金额Map
	 */
	private Map<String, BigDecimal> getFundsOriginTotalMoney(
			List<FundsOriginGather> fundsOriginGatherList) {
		Map<String, BigDecimal> totalOriginMap = new HashMap<String, BigDecimal>();
		if (fundsOriginGatherList != null && fundsOriginGatherList.size() > 0) {
			// 初始化合计金额
			BigDecimal total = new BigDecimal(0);
			BigDecimal tenDaysTotal = new BigDecimal(0);
			BigDecimal aMonthTotal = new BigDecimal(0);
			BigDecimal twoMonthsTotal = new BigDecimal(0);
			BigDecimal threeMonthsTotal = new BigDecimal(0);
			BigDecimal sixMonthsTotal = new BigDecimal(0);
			BigDecimal moreSixMonthsTotal = new BigDecimal(0);
			for (int i = 0; i < fundsOriginGatherList.size(); i++) {
				// 获取资金来源视图对象
				FundsOriginGather fundsOriginGather = fundsOriginGatherList
						.get(i);
				// 由于合计金额存储在同一个二级分类的第一条记录上，所以每个不同的分类只有存在合计的那条记录才获取合计信息
				if (fundsOriginGather.getSecondProjectCount() != null) {
					// 获取每个分类的合计金额
					BigDecimal tenDaysMoney = fundsOriginGather
							.getTenDaysMoneySummarySecond();
					BigDecimal aMonthMoney = fundsOriginGather
							.getaMonthMoneySummarySecond();
					BigDecimal twoMonthsMoney = fundsOriginGather
							.getTwoMonthsMoneySummarySecond();
					BigDecimal threeMonthsMoney = fundsOriginGather
							.getThreeMonthsMoneySummarySecond();
					BigDecimal sixMonthsMoney = fundsOriginGather
							.getSixMonthsMoneySummarySecond();
					BigDecimal moreSixMonthsMoney = fundsOriginGather
							.getMoreSixMonthsMoneySummarySecond();
					// 设置资金收入合计金额
					BigDecimal totalMoney = fundsOriginGather
							.getSecondProjectMoneySummary();
					// 计算资金收入合计金额
					tenDaysTotal = tenDaysTotal.add(tenDaysMoney);
					aMonthTotal = aMonthTotal.add(aMonthMoney);
					twoMonthsTotal = twoMonthsTotal.add(twoMonthsMoney);
					threeMonthsTotal = threeMonthsTotal.add(threeMonthsMoney);
					sixMonthsTotal = sixMonthsTotal.add(sixMonthsMoney);
					moreSixMonthsTotal = moreSixMonthsTotal
							.add(moreSixMonthsMoney);
					total = total.add(totalMoney);
				}
			}

			// 添加合金金额
			totalOriginMap.put("total", total);
			totalOriginMap.put("tenDaysTotal", tenDaysTotal);
			totalOriginMap.put("aMonthTotal", aMonthTotal);
			totalOriginMap.put("twoMonthsTotal", twoMonthsTotal);
			totalOriginMap.put("threeMonthsTotal", threeMonthsTotal);
			totalOriginMap.put("sixMonthsTotal", sixMonthsTotal);
			totalOriginMap.put("moreSixMonthsTotal", moreSixMonthsTotal);
		}
		return totalOriginMap;
	}

	/**
	 * 资金平衡分析报表导出
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=balanceExport", method = RequestMethod.POST)
	public String exportBalanceAssemble(final Model model,
			final HttpServletRequest request,
			@RequestParam("gatherDate") final String gatherDate)
			throws ParseException {
		// 格式化统计日期
		Date date = FosUtil.getInitDate(gatherDate);
		Object[] params = new Object[] { date };
		// 获取报表导出记录
		List<ExportReportsRecord> exportReportsRecordlist = fundsGatherService
				.getExportReportsRecord(Constant.FUNDS_USE_GATHER_REPORT_NAME,
						Constant.REPORTS_USE_TOTAL, date);
		if (exportReportsRecordlist != null
				&& exportReportsRecordlist.size() > 0) {
			// 获取查询参数
			List<CommonBean> parameterList = QueryCondition.getQueryCondition(
					request, FundsOriginGather.class);
			// 获取资金来源、资金运用pageBean
			CutPageBean pageBeanOri = QueryCondition.getQueryPageBean(request);
			CutPageBean pageBeanApply = QueryCondition
					.getQueryPageBean(request);
			// 获取资金来源汇总数据查询结果
			pageBeanOri = fundsGatherService.getAllFundsOriginGather(
					pageBeanOri, parameterList, params);
			List originDataList = pageBeanOri.getDataList();
			if (originDataList != null && originDataList.size() > 0) {
				// 组装资金来源汇总数据
				fundsGatherService.orgnizationOriginSecondData(originDataList);
			}
			// 获取资金运用汇总数据查询结果
			pageBeanApply = fundsGatherService.getAllFundsApplyGather(
					pageBeanApply, parameterList, params);
			List applyDataList = pageBeanApply.getDataList();
			if (applyDataList != null && applyDataList.size() > 0) {
				// 组装资金运用汇总数据
				fundsGatherService.orgnizationApplyFirstData(applyDataList);
			}

			// 获取资金收入、资金支出汇总金额
			Map<String, BigDecimal> totalOriginMap = this
					.getFundsOriginTotalMoney(originDataList);
			Map<String, BigDecimal> totalApplyMap = this
					.getFundsApplyTotalMoney(applyDataList);
			// 自有资金期初结转金额、财政专户期初结转金额
			Map<String, BigDecimal> ownSettlementMoneyMap = this
					.setInitSettlementMoney(date, totalApplyMap,
							totalOriginMap, Constant.INIT_SETTLEMENT_MONEY_OWN);
			Map<String, BigDecimal> financeSettlementMoneyMap = this
					.setInitSettlementMoney(date, totalApplyMap,
							totalOriginMap,
							Constant.INIT_SETTLEMENT_MONEY_FINANCE);

			// 获取为上报汇总数据的部门
			List<FwGroup> groupList = fundsGatherService.getUnGatherDepartMent(
					Constant.FUNDS_USE_REPORT_NAME, date);
			ExportReportsRecord exportReportsRecord = exportReportsRecordlist
					.get(0);
			// 设置页面参数
			model.addAttribute("totalOriginMap", totalOriginMap);
			model.addAttribute("totalApplyMap", totalApplyMap);
			model.addAttribute("ownSettlementMoneyMap", ownSettlementMoneyMap);
			model.addAttribute("financeSettlementMoneyMap",
					financeSettlementMoneyMap);
			model.addAttribute("fundsOriList", originDataList);
			model.addAttribute("applyDataList", applyDataList);
			model.addAttribute("depart", exportReportsRecord.getGroup()
					.getName());
			model.addAttribute("org", exportReportsRecord.getOrgUserName());
			model.addAttribute("leader",
					exportReportsRecord.getMgLeaderUserName());
			model.addAttribute("fileName",
					Constant.FUNDS_BALANCE_GATHER_REPORT_NAME + ".xls");
			model.addAttribute("groupList", groupList);
			return LIST_EXPORT_PAGEP_PATH;
		} else {
			return Util.printErrorString("报表未生成，无法导出!");
		}
	}
}
