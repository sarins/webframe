package com.huatek.fos.fundsreportgather.service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.huatek.authority.factory.DataAuthority;
import com.huatek.base.service.BaseServiceImpl;
import com.huatek.fos.basemanagement.entity.hibernate.InitSettlement;
import com.huatek.fos.fundsmanagement.entity.hibernate.AuditReportRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.fos.fundsreportgather.entity.hibernate.ExportReportsRecord;
import com.huatek.fos.fundsreportgather.entity.hibernate.FundsApplyGather;
import com.huatek.fos.fundsreportgather.entity.hibernate.FundsOriginGather;
import com.huatek.fos.fundsreportgather.entity.hibernate.ReportsDetails;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;

/**
 * 资金运用service
 * 
 * @author alan_zhang
 * 
 */
public class FundsGatherServiceImpl extends BaseServiceImpl implements
		FundsGatherService {

	/**
	 * 查询汇总资金来源报表.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	public CutPageBean getAllFundsOriginGather(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params) {
		Date gatherDate = (Date) params[0];
		String querySql = " 1=1 and t.gatherDate=? ";
		String orderBySql = " t.firstCategory.id asc, t.sencondCategory.id asc, t.projectName asc";
		String totalRowSql = "select count(*) from FundsOriginGather t where "
				+ querySql;
		String resultSql = "select t from FundsOriginGather t where "
				+ querySql;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowSql,
				resultSql, "order by " + orderBySql,
				new Object[] { gatherDate }, pageBean, parameterList);
	}

	/**
	 * 查询汇总资金运用报表.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	public CutPageBean getAllFundsApplyGather(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params) {
		Date gatherDate = (Date) params[0];
		String querySql = " 1=1 and t.gatherDate=? ";
		String orderBySql = " t.firstCategory.id asc, t.projectName asc";
		String totalRowSql = "select count(*) from FundsApplyGather t where "
				+ querySql;
		String resultSql = "select t from FundsApplyGather t where " + querySql;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowSql,
				resultSql, "order by " + orderBySql,
				new Object[] { gatherDate }, pageBean, parameterList);
	}

	/**
	 * 通过部门级别获取所有该级别的部门信息.
	 * 
	 * @param groupType
	 *            部门级别
	 * @return 部门列表
	 */
	@SuppressWarnings("unchecked")
	public List<FwGroup> getAllGroupByLevel(String groupType) {
		String sql = "from FwGroup t where t.status=?  and t.groupType=?  order by t.style asc";
		Object[] param = { Constant.STATUS_VALID, groupType };
		return hibernateTemplate.find(sql + " order by t.style asc", param);
	}

	/**
	 * 查询未汇总报表的部门列表.
	 * 
	 * @param level
	 *            部门级别
	 * @return 部门列表
	 */
	@SuppressWarnings("unchecked")
	public List<FwGroup> getUnGatherDepartMent(String reportsName,
			Date gatherDate) {
		List<AuditReportRecord> sourceList = hibernateTemplate
				.find("from AuditReportRecord t where t.reportsName=? and t.gatherDate=? and t.leaderAuditState=? order by t.foundDate desc",
						new Object[] { reportsName, gatherDate,
								Constant.LEADER_AUDIT_STATE_YES });
		List<FwGroup> groupList = getAllGroupByLevel(Constant.DEPARTMENT_GROUPTYPE);
		List<FwGroup> unGatherList = new ArrayList<FwGroup>();
		for (int i = 0; i < groupList.size(); i++) {
			int count = 0;
			for (int j = 0; j < sourceList.size(); j++) {
				if (groupList.get(i).getId().longValue() == sourceList.get(j)
						.getGroup().getId().longValue()) {
					count++;
				}
			}
			if (count == 0) {
				unGatherList.add(groupList.get(i));
			}
		}
		return unGatherList;
	}

	/**
	 * 根据查询条件获取报表导出明细
	 * 
	 * @param reportsUseType
	 *            报表所属类型
	 * @param gatherDate
	 *            统计日期
	 * @return 报表导出明细
	 */
	@SuppressWarnings("unchecked")
	public List<ReportsDetails> getReportsDetails(String reportsUseType,
			Date gatherDate) {
		// 暂时去掉该用户的权限分配(不按照部门查询)
		ThreadLocalClient.get().envParamMap.put(
				DataAuthority.IS_APPLY_AUTHORITY, false);
		String sql = "from ReportsDetails t where t.gatherDate= ? and t.reportsUseType=?";
		// 设置查询参数 统计日期、报表所属类型、所属部门
		Object[] param = { gatherDate, reportsUseType };
		// 根据条件查询报表导出明细并返回明细列表
		List<ReportsDetails> reportsDetailsList = hibernateTemplate.find(sql
				+ " order by t.gatherDate", param);
		// 添加该用户的权限分配
		ThreadLocalClient.get().envParamMap.put(
				DataAuthority.IS_APPLY_AUTHORITY, true);
		return reportsDetailsList;
	}

	/**
	 * 根据查询条件获取报表导出记录.
	 * 
	 * @param reportsName
	 *            报表名称
	 * @param reportsUseType
	 *            报表所属类型
	 * @param gatherDate
	 *            统计日期
	 * @return 报表导出明细
	 */
	@SuppressWarnings("unchecked")
	public List<ExportReportsRecord> getExportReportsRecord(
			final String reportsName, String reportsUseType, Date gatherDate) {
		String sql = "from ExportReportsRecord t where t.gatherDate=? and t.reportsUseType=? and t.reportsName=?";
		// 设置查询参数 统计日期、报表所属类型、报表名称
		Object[] param = { gatherDate, reportsUseType, reportsName };
		// 根据条件查询报表导出记录列表
		return hibernateTemplate.find(sql + " order by t.id", param);
	}

	/**
	 * 添加报表导出记录 统计单部门时传入reportRecord
	 * gatherDate为null。统计五部门时reportRecord为null，传入gatherDate.
	 * 
	 * @param reportRecord
	 *            报表审核记录对象
	 * @param fwAccount
	 *            当前登录用户
	 * @param reportsName
	 *            报表名称
	 * @param reportsUseType
	 *            报表所属类型
	 */
	@SuppressWarnings("unchecked")
	public void saveExportReportsRecord(final AuditReportRecord reportRecord,
			Date gatherDate, final FwAccount fwAccount, String reportsName,
			String reportsUseType) {
		String sql = "from ExportReportsRecord t where t.reportsName=? and t.gatherDate=? and t.reportsUseType=? and t.group.id=?";
		List<ExportReportsRecord> exportReportsRecordsList = null;
		// 如果当前报表类型是单部门
		if (reportsUseType.equals(Constant.REPORTS_USE_ONE)) {
			// 报表名称、统计日期、报表所属类型、所属部门
			Object[] param = { reportsName, reportRecord.getGatherDate(),
					reportsUseType, reportRecord.getGroup().getId() };
			// 根据条件获取报表导出记录
			exportReportsRecordsList = hibernateTemplate.find(sql
					+ " order by t.group.id", param);
		} else if (reportsUseType.equals(Constant.REPORTS_USE_TOTAL)) {
			// 报表名称、统计日期、报表所属类型、所属部门
			Object[] param = { reportsName, gatherDate, reportsUseType,
					fwAccount.getFwGroup().getId() };
			// 根据条件获取报表导出记录
			exportReportsRecordsList = hibernateTemplate.find(sql
					+ " order by t.group.id", param);
		}

		// 如果该报表之前操作过导出，则不再记录导出记录
		if (exportReportsRecordsList == null
				|| exportReportsRecordsList.size() == 0) {
			// 实例化报表导出记录对象
			ExportReportsRecord exportReportsRecord = new ExportReportsRecord();
			// 报表名称（资金运用）
			exportReportsRecord.setReportsName(reportsName);
			// 如果当前报表类型是单部门
			if (reportsUseType.equals(Constant.REPORTS_USE_ONE)) {
				// 编制单位（部门名称）
				exportReportsRecord.setGroupName(reportRecord.getGroup()
						.getName());
				// 编制人
				exportReportsRecord.setOrgUserName(reportRecord
						.getOrgUserName());
				exportReportsRecord.setOrgAcctName(reportRecord
						.getOrgAcctName());
				// 分管领导
				exportReportsRecord.setMgLeaderShip(reportRecord
						.getMgLeaderShip());
				exportReportsRecord.setMgLeaderUserName(reportRecord
						.getMgLeaderUserName());
				// 所属部门
				exportReportsRecord.setGroup(reportRecord.getGroup());
				// 统计日期
				exportReportsRecord.setGatherDate(reportRecord.getGatherDate());
				// 如果当前报表类型是部门总和
			} else if (reportsUseType.equals(Constant.REPORTS_USE_TOTAL)) {
				// 编制单位（部门名称）
				exportReportsRecord.setGroupName(fwAccount.getFwGroup()
						.getName());
				// 编制人
				exportReportsRecord.setOrgUserName(fwAccount.getUserName());
				exportReportsRecord.setOrgAcctName(fwAccount.getAcctName());
				// 所属部门
				exportReportsRecord.setGroup(fwAccount.getFwGroup());
				// 统计日期
				exportReportsRecord.setGatherDate(gatherDate);
				// 获取当前部门的分管领导
				List<FwAccount> accountList = hibernateTemplate
						.find("from FwAccount t where t.position=? and t.fwGroup.id=? order by t.id asc",
								new Object[] { Constant.LEADER_CODE,
										fwAccount.getFwGroup().getId() });
				// 如果当前部门的领导信息不为空
				if (accountList != null && accountList.size() > 0) {
					// 分管领导
					exportReportsRecord.setMgLeaderShip(accountList.get(0)
							.getAcctName());
					exportReportsRecord.setMgLeaderUserName(accountList.get(0)
							.getUserName());
				}
			}

			// 报表所属类型(单部门)
			exportReportsRecord.setReportsUseType(reportsUseType);
			// 获取当前系统时间
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			// 创建日期
			exportReportsRecord.setFoundDate(currentDate);
			// 保存报表导出记录
			save(exportReportsRecord);
		}
	}

	/**
	 * 添加报表导出明细.
	 * 
	 * @param fwAccount
	 *            当前登录用户
	 * @param reportsUseType
	 *            报表所属类型
	 * @param gatherDate
	 *            统计日期
	 * @param reportDataSources
	 *            报表数据来源
	 */
	@SuppressWarnings("unchecked")
	public void saveOrUpdateReportsDetails(final FwAccount fwAccount,
			String reportsUseType, Date gatherDate, String reportDataSources) {
		String sql = "from ReportsDetails t where t.gatherDate=? and t.reportsUseType=? and t.group.id=?";
		// 设置查询参数 统计日期、报表所属类型、所属部门
		Object[] param = { gatherDate, reportsUseType,
				fwAccount.getFwGroup().getId() };
		// 根据条件查询报表导出明细
		List<ReportsDetails> reportsDetailsList = hibernateTemplate.find(sql
				+ " order by t.group.id", param);
		// 如果导出明细不为空
		if (reportsDetailsList != null && reportsDetailsList.size() > 0) {
			ReportsDetails reportsDetails = reportsDetailsList.get(0);

			// 如果汇总报表是单部门
			if (reportsUseType.equals(Constant.REPORTS_USE_ONE)) {
				// 如果数据来源是资金来源
				if (reportDataSources.equals(Constant.DATA_SOURCES_FUNDS_RIO)) {
					// 如果已经存在则不执行更新操作
					if (CommonUtil.isNotZeroLengthTrimString(reportsDetails
							.getOneReportsName())) {
						return;
					}
					// 设置报表名称1为资金来源
					reportsDetails
							.setOneReportsName(Constant.FUNDS_ORI_REPORT_NAME);
					// 如果数据来源是资金运用
				} else if (reportDataSources
						.equals(Constant.DATA_SOURCES_FUNDS_APPLY)) {
					// 如果已经存在则不执行更新操作
					if (CommonUtil.isNotZeroLengthTrimString(reportsDetails
							.getTowReportsName())) {
						return;
					}
					// 设置报表名称2为资金运用
					reportsDetails
							.setTowReportsName(Constant.FUNDS_USE_REPORT_NAME);
				}
				// 如果汇总报表是部门总和
			} else if (reportsUseType.equals(Constant.REPORTS_USE_TOTAL)) {
				// 执行部门总和处理
				reportsDetails = this.setFundsGather(reportsDetails, fwAccount,
						null, gatherDate, reportDataSources);
			}
			// 执行报表名称更新操作
			this.merge(reportsDetails);
		} else {
			// 实例化报表明细对象
			ReportsDetails reportsDetail = new ReportsDetails();
			// 如果汇总报表是单部门
			if (reportsUseType.equals(Constant.REPORTS_USE_ONE)) {
				// 如果数据来源是资金来源
				if (reportDataSources.equals(Constant.DATA_SOURCES_FUNDS_RIO)) {
					// 设置报表名称1为资金来源
					reportsDetail
							.setOneReportsName(Constant.FUNDS_ORI_REPORT_NAME);
					// 如果数据来源是资金运用
				} else if (reportDataSources
						.equals(Constant.DATA_SOURCES_FUNDS_APPLY)) {
					// 设置报表名称2为资金运用
					reportsDetail
							.setTowReportsName(Constant.FUNDS_USE_REPORT_NAME);
				}
				// 如果汇总报表是部门总和
			} else if (reportsUseType.equals(Constant.REPORTS_USE_TOTAL)) {
				// 如果数据来源是资金来源
				if (reportDataSources.equals(Constant.DATA_SOURCES_FUNDS_RIO)) {
					// 设置报表名称1为资金来源汇总报表
					reportsDetail
							.setOneReportsName(Constant.FUNDS_ORI_GATHER_REPORT_NAME);
					// 如果数据来源是资金运用
				} else if (reportDataSources
						.equals(Constant.DATA_SOURCES_FUNDS_APPLY)) {
					// 设置报表名称2为资金运用汇总报表
					reportsDetail
							.setTowReportsName(Constant.FUNDS_USE_GATHER_REPORT_NAME);
				}
			}
			// 设置统计日期
			reportsDetail.setGatherDate(gatherDate);
			// 设置报表所属类型
			reportsDetail.setReportsUseType(reportsUseType);
			// 设置报表所属部门
			reportsDetail.setGroup(fwAccount.getFwGroup());
			// 获取当前系统时间
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			// 设置创建时间
			reportsDetail.setFoundDate(currentDate);
			save(reportsDetail);
		}
	}

	/**
	 * 设置资金平衡与分析汇总报表记录信息 统计五部门时auditReportRecord为null，传入gatherDate.
	 * 
	 * @param reportsDetails
	 *            报表导出明细对象
	 * @param fwAccount
	 *            当前登录用户
	 * @param auditReportRecord
	 *            报表审核记录对象
	 * @param reportDataSources
	 *            数据来源
	 * @return 报表导出明细对象
	 */
	public ReportsDetails setFundsGather(final ReportsDetails reportsDetails,
			final FwAccount fwAccount,
			final AuditReportRecord auditReportRecord, Date gatherDate,
			String reportDataSources) {
		// 资金来源报表名称
		String oneReportsName = reportsDetails.getOneReportsName();
		// 资金运用报表名称
		String twoReportsName = reportsDetails.getTowReportsName();
		// 如果数据来源是资金来源
		if (reportDataSources.equals(Constant.DATA_SOURCES_FUNDS_RIO)) {
			// 设置报表名称1为资金来源汇总报表
			reportsDetails
					.setOneReportsName(Constant.FUNDS_ORI_GATHER_REPORT_NAME);
			// 如果资金运用报表名称不为空
			if (twoReportsName != null
					&& CommonUtil.isNotZeroLengthTrimString(twoReportsName)) {
				// 设置报表名称3为 资金平衡汇总分析报表
				reportsDetails
						.setThreeReportsName(Constant.FUNDS_BALANCE_GATHER_REPORT_NAME);
				// 保存资金平衡汇总导出报表明细
				this.saveExportReportsRecord(auditReportRecord, gatherDate,
						fwAccount, Constant.FUNDS_BALANCE_GATHER_REPORT_NAME,
						Constant.REPORTS_USE_TOTAL);
			}
			// 如果数据来源是资金运用
		} else if (reportDataSources.equals(Constant.DATA_SOURCES_FUNDS_APPLY)) {
			// 设置报表名称2为资金运用汇总报表
			reportsDetails
					.setTowReportsName(Constant.FUNDS_USE_GATHER_REPORT_NAME);
			// 如果资金来源报表名称不为空
			if (oneReportsName != null
					&& CommonUtil.isNotZeroLengthTrimString(oneReportsName)) {
				// 设置报表名称3为 资金平衡汇总分析报表
				reportsDetails
						.setThreeReportsName(Constant.FUNDS_BALANCE_GATHER_REPORT_NAME);
				// 保存资金平衡汇总导出报表明细
				this.saveExportReportsRecord(auditReportRecord, gatherDate,
						fwAccount, Constant.FUNDS_BALANCE_GATHER_REPORT_NAME,
						Constant.REPORTS_USE_TOTAL);
			}
		}
		return reportsDetails;
	}

	/**
	 * 查询汇总报表信息列表.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	public CutPageBean getFundsGatherPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList, Object[] params,
			final FwAccount fwAccount) throws ParseException {
		List<Object> paramArrayList = new ArrayList<Object>();
		Object startDate = params[0];
		Object endDate = params[1];
		Object reportsUseType = params[2];
		StringBuffer queryCondition = new StringBuffer(
				" 1=1 and t.reportsUseType=?");
		paramArrayList.add(reportsUseType);
		if (startDate != null
				&& CommonUtil.isNotZeroLengthTrimString(startDate.toString())) {
			paramArrayList.add(FosUtil.getInitDate(startDate.toString()));
			queryCondition.append(" and t.gatherDate >= ?");
		}
		if (endDate != null
				&& CommonUtil.isNotZeroLengthTrimString(endDate.toString())) {
			paramArrayList.add(FosUtil.getInitDate(endDate.toString()));
			queryCondition.append(" and t.gatherDate <= ?");
		}
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (fwAccount != null
				&& fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(fwAccount.getFwGroup().getId());
		}
		String totalRowsHsql = " select count(t) from ReportsDetails t where"
				+ queryCondition;
		String resultSql = "from ReportsDetails t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.gatherDate desc",
				paramArrayList.toArray(), pageBean, paramterList);
	}

	/**
	 * 获取汇总报表已审核部门数量
	 * 
	 * @param gatherDate
	 *            统计日期
	 * @param reportsName
	 *            报表名称
	 * @return 已审核数量
	 */
	@SuppressWarnings("unchecked")
	public int getAuditReportRecord(Date gatherDate, String reportsName) {
		// 查询报表汇总审计记录信息
		String sql = "from AuditReportRecord t where t.gatherDate=? and t.reportsName=? order by t.foundDate desc";
		// 统计日期、报表名称、当前系统用户所属部门
		Object[] param = { gatherDate, reportsName };
		// 获取审核记录查询结果列表
		List<AuditReportRecord> auditReportRecordsList = hibernateTemplate
				.find(sql, param);
		// 未审核部门数量
		int count = 0;
		// 如果汇总审核记录表不为空
		if (auditReportRecordsList != null && auditReportRecordsList.size() > 0) {
			int size = auditReportRecordsList.size();
			for (int i = 0; i < size; i++) {
				// 获取审核记录对象
				AuditReportRecord auditReportRecord = auditReportRecordsList
						.get(i);
				// 如果存在已审核的部门
				if (auditReportRecord.getLeaderAuditState().equals(
						Constant.LEADER_AUDIT_STATE_YES)) {
					count++;
				}
			}
		}
		return count;
	}

	/**
	 * 通过统计日期获取期初结转金额
	 * 
	 * @param gatherDate
	 *            统计日期
	 * @return 期初结转金额列表
	 */
	@SuppressWarnings("unchecked")
	public List<InitSettlement> getInitSettlementByGatherDate(Date gatherDate,
			String useType) {
		String sql = "from InitSettlement t where t.gatherDate=? and t.useType=?";
		// 设置查询条件 统计日期，金额使用类型是平衡汇总分析
		Object[] param = { gatherDate, useType };
		return hibernateTemplate.find(sql + "order by t.gatherDate", param);
	}

	/**
	 * 组装资金运用一级项目分类信息（金额(包括一级品类合计)，信息条数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	public List<FundsApplyGather> orgnizationApplyFirstData(
			List<FundsApplyGather> sourceList) {
		Long firstCategoryId = null;
		FundsApplyGather tempSourceUseFunds = null;
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
		int count = 1;
		// 类目数量
		int categoryCount = 1;
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
					tempSourceUseFunds.setFirstProjectCount(count);
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
				// 获取当前资金运用一级项目类目
				firstCategoryId = sourceList.get(i).getFirstCategory().getId();
				// 如果当前一级类目与初始化资金运用类目相同
				if (firstCategoryId.longValue() == tempSourceUseFunds
						.getFirstCategory().getId().longValue()) {
					// 累加同一个一级类别的项目信息
					count++;
					projectMoneySummary = projectMoneySummary.add(sourceList
							.get(i).getSummaryMoney());
					tenDaysMoneySummary = tenDaysMoneySummary.add(sourceList
							.get(i).getTenDaysMoney());
					aMonthMoneySummary = aMonthMoneySummary.add(sourceList.get(
							i).getaMonthMoney());
					twoMonthsMoneySummary = twoMonthsMoneySummary
							.add(sourceList.get(i).getTwoMonthsMoney());
					threeMonthsMoneySummary = threeMonthsMoneySummary
							.add(sourceList.get(i).getThreeMonthsMoney());
					sixMonthsMoneySummary = sixMonthsMoneySummary
							.add(sourceList.get(i).getSixMonthsMoney());
					moreSixMonthsMoneySummary = moreSixMonthsMoneySummary
							.add(sourceList.get(i).getMoreSixMonthsMoney());
					// 对最后一条记录做处理
					if (i == sourceList.size() - 1) {
						tempSourceUseFunds.setFirstProjectCount(count);
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
					// 类别数量
					categoryCount++;
					// 将相同一级类别的项目信息累加
					tempSourceUseFunds.setFirstProjectCount(count);
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
					tempSourceUseFunds = sourceList.get(i);
					count = 1;
					projectMoneySummary = new BigDecimal("0");
					tenDaysMoneySummary = new BigDecimal("0");
					aMonthMoneySummary = new BigDecimal("0");
					twoMonthsMoneySummary = new BigDecimal("0");
					threeMonthsMoneySummary = new BigDecimal("0");
					sixMonthsMoneySummary = new BigDecimal("0");
					moreSixMonthsMoneySummary = new BigDecimal("0");
					// 第一次初始化金额信息
					projectMoneySummary = projectMoneySummary.add(sourceList
							.get(i).getSummaryMoney());
					tenDaysMoneySummary = tenDaysMoneySummary.add(sourceList
							.get(i).getTenDaysMoney());
					aMonthMoneySummary = aMonthMoneySummary.add(sourceList.get(
							i).getaMonthMoney());
					twoMonthsMoneySummary = twoMonthsMoneySummary
							.add(sourceList.get(i).getTwoMonthsMoney());
					threeMonthsMoneySummary = threeMonthsMoneySummary
							.add(sourceList.get(i).getThreeMonthsMoney());
					sixMonthsMoneySummary = sixMonthsMoneySummary
							.add(sourceList.get(i).getSixMonthsMoney());
					moreSixMonthsMoneySummary = moreSixMonthsMoneySummary
							.add(sourceList.get(i).getMoreSixMonthsMoney());
					// 对最后一条记录做处理
					if (i == sourceList.size() - 1) {
						tempSourceUseFunds.setFirstProjectCount(count);
						tempSourceUseFunds
								.setFirstProjectMoneySummary(sourceList.get(i)
										.getSummaryMoney());
						tempSourceUseFunds
								.setTenDaysMoneySummaryFirst(sourceList.get(i)
										.getTenDaysMoney());
						tempSourceUseFunds
								.setaMonthMoneySummaryFirst(sourceList.get(i)
										.getaMonthMoney());
						tempSourceUseFunds
								.setTwoMonthsMoneySummaryFirst(sourceList
										.get(i).getTwoMonthsMoney());
						tempSourceUseFunds
								.setThreeMonthsMoneySummaryFirst(sourceList
										.get(i).getThreeMonthsMoney());
						tempSourceUseFunds
								.setSixMonthsMoneySummaryFirst(sourceList
										.get(i).getSixMonthsMoney());
						tempSourceUseFunds
								.setMoreSixMonthsMoneySummaryFirst(sourceList
										.get(i).getMoreSixMonthsMoney());
					}
				}
			}
		}
		// 如果数据列表有值
		if (sourceList != null && sourceList.size() > 0) {
			// 将类目数量添加在列表展示对象的第一条记录中
			tempSourceUseFunds = sourceList.get(0);
			tempSourceUseFunds.setCategoryCount(categoryCount);
		}
		return sourceList;
	}

	/**
	 * 组装资金来源二级项目分类信息（金额(包括二级品类合计)，信息条数secondProjectCount 用于二级分类RowSpan行数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	public List<FundsOriginGather> orgnizationOriginSecondData(
			List<FundsOriginGather> sourceList) {
		Long sencondCategoryId = null;
		FundsOriginGather tempSourceUseFunds = null;
		BigDecimal projectMoneySummary = new BigDecimal("0");
		BigDecimal tenDaysMoneySummary = new BigDecimal("0");
		BigDecimal aMonthMoneySummary = new BigDecimal("0");
		BigDecimal twoMonthsMoneySummary = new BigDecimal("0");
		BigDecimal threeMonthsMoneySummary = new BigDecimal("0");
		BigDecimal sixMonthsMoneySummary = new BigDecimal("0");
		BigDecimal moreSixMonthsMoneySummary = new BigDecimal("0");
		int count = 1;
		// 类目数量
		int categoryCount = 1;
		for (int i = 0; i < sourceList.size(); i++) {
			if (i == 0) {
				tempSourceUseFunds = sourceList.get(i);
				// 第一次初始化金额信息
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
					tempSourceUseFunds.setSecondProjectCount(count);
					tempSourceUseFunds
							.setSecondProjectMoneySummary(projectMoneySummary);
					tempSourceUseFunds
							.setTenDaysMoneySummarySecond(tenDaysMoneySummary);
					tempSourceUseFunds
							.setaMonthMoneySummarySecond(aMonthMoneySummary);
					tempSourceUseFunds
							.setTwoMonthsMoneySummarySecond(twoMonthsMoneySummary);
					tempSourceUseFunds
							.setThreeMonthsMoneySummarySecond(threeMonthsMoneySummary);
					tempSourceUseFunds
							.setSixMonthsMoneySummarySecond(sixMonthsMoneySummary);
					tempSourceUseFunds
							.setMoreSixMonthsMoneySummarySecond(moreSixMonthsMoneySummary);
				}
			} else {
				sencondCategoryId = sourceList.get(i).getSencondCategory()
						.getId();
				if (sencondCategoryId.longValue() == tempSourceUseFunds
						.getSencondCategory().getId().longValue()) {
					// 累加同一个二级类别的项目信息
					count++;
					projectMoneySummary = projectMoneySummary.add(sourceList
							.get(i).getSummaryMoney());
					tenDaysMoneySummary = tenDaysMoneySummary.add(sourceList
							.get(i).getTenDaysMoney());
					aMonthMoneySummary = aMonthMoneySummary.add(sourceList.get(
							i).getaMonthMoney());
					twoMonthsMoneySummary = twoMonthsMoneySummary
							.add(sourceList.get(i).getTwoMonthsMoney());
					threeMonthsMoneySummary = threeMonthsMoneySummary
							.add(sourceList.get(i).getThreeMonthsMoney());
					sixMonthsMoneySummary = sixMonthsMoneySummary
							.add(sourceList.get(i).getSixMonthsMoney());
					moreSixMonthsMoneySummary = moreSixMonthsMoneySummary
							.add(sourceList.get(i).getMoreSixMonthsMoney());
					// 对最后一条记录做处理
					if (i == sourceList.size() - 1) {
						tempSourceUseFunds.setSecondProjectCount(count);
						tempSourceUseFunds
								.setSecondProjectMoneySummary(projectMoneySummary);
						tempSourceUseFunds
								.setTenDaysMoneySummarySecond(tenDaysMoneySummary);
						tempSourceUseFunds
								.setaMonthMoneySummarySecond(aMonthMoneySummary);
						tempSourceUseFunds
								.setTwoMonthsMoneySummarySecond(twoMonthsMoneySummary);
						tempSourceUseFunds
								.setThreeMonthsMoneySummarySecond(threeMonthsMoneySummary);
						tempSourceUseFunds
								.setSixMonthsMoneySummarySecond(sixMonthsMoneySummary);
						tempSourceUseFunds
								.setMoreSixMonthsMoneySummarySecond(moreSixMonthsMoneySummary);
					}
				} else {
					// 类目数量累加
					categoryCount++;
					// 将相同二级类别的项目信息累加
					tempSourceUseFunds.setSecondProjectCount(count);
					tempSourceUseFunds
							.setSecondProjectMoneySummary(projectMoneySummary);
					tempSourceUseFunds
							.setTenDaysMoneySummarySecond(tenDaysMoneySummary);
					tempSourceUseFunds
							.setaMonthMoneySummarySecond(aMonthMoneySummary);
					tempSourceUseFunds
							.setTwoMonthsMoneySummarySecond(twoMonthsMoneySummary);
					tempSourceUseFunds
							.setThreeMonthsMoneySummarySecond(threeMonthsMoneySummary);
					tempSourceUseFunds
							.setSixMonthsMoneySummarySecond(sixMonthsMoneySummary);
					tempSourceUseFunds
							.setMoreSixMonthsMoneySummarySecond(moreSixMonthsMoneySummary);
					tempSourceUseFunds = sourceList.get(i);
					count = 1;
					projectMoneySummary = new BigDecimal("0");
					tenDaysMoneySummary = new BigDecimal("0");
					aMonthMoneySummary = new BigDecimal("0");
					twoMonthsMoneySummary = new BigDecimal("0");
					threeMonthsMoneySummary = new BigDecimal("0");
					sixMonthsMoneySummary = new BigDecimal("0");
					moreSixMonthsMoneySummary = new BigDecimal("0");
					// 第一次初始化金额信息
					projectMoneySummary = projectMoneySummary.add(sourceList
							.get(i).getSummaryMoney());
					tenDaysMoneySummary = tenDaysMoneySummary.add(sourceList
							.get(i).getTenDaysMoney());
					aMonthMoneySummary = aMonthMoneySummary.add(sourceList.get(
							i).getaMonthMoney());
					twoMonthsMoneySummary = twoMonthsMoneySummary
							.add(sourceList.get(i).getTwoMonthsMoney());
					threeMonthsMoneySummary = threeMonthsMoneySummary
							.add(sourceList.get(i).getThreeMonthsMoney());
					sixMonthsMoneySummary = sixMonthsMoneySummary
							.add(sourceList.get(i).getSixMonthsMoney());
					moreSixMonthsMoneySummary = moreSixMonthsMoneySummary
							.add(sourceList.get(i).getMoreSixMonthsMoney());
					// 对最后一条记录做处理
					if (i == sourceList.size() - 1) {
						tempSourceUseFunds.setSecondProjectCount(count);
						tempSourceUseFunds
								.setSecondProjectMoneySummary(sourceList.get(i)
										.getSummaryMoney());
						tempSourceUseFunds
								.setTenDaysMoneySummarySecond(sourceList.get(i)
										.getTenDaysMoney());
						tempSourceUseFunds
								.setaMonthMoneySummarySecond(sourceList.get(i)
										.getaMonthMoney());
						tempSourceUseFunds
								.setTwoMonthsMoneySummarySecond(sourceList.get(
										i).getTwoMonthsMoney());
						tempSourceUseFunds
								.setThreeMonthsMoneySummarySecond(sourceList
										.get(i).getThreeMonthsMoney());
						tempSourceUseFunds
								.setSixMonthsMoneySummarySecond(sourceList.get(
										i).getSixMonthsMoney());
						tempSourceUseFunds
								.setMoreSixMonthsMoneySummarySecond(sourceList
										.get(i).getMoreSixMonthsMoney());
					}
				}
			}
		}
		// 如果展示列表对象有值
		if (sourceList != null && sourceList.size() > 0) {
			// 将类目数量添加在列表展示对象的第一条记录中
			tempSourceUseFunds = sourceList.get(0);
			tempSourceUseFunds.setCategoryCount(categoryCount);
		}
		return sourceList;
	}

	/**
	 * 组装资金来源一级项目分类信息（金额(包括一级品类合计)，信息条数 firstProjectCount用于一级分类RowSpan行数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	public List<FundsOriginGather> orgnizationOriginFirstData(
			List<FundsOriginGather> sourceList) {
		Long firstCategoryId = null;
		Long secondCategoryId = null;
		Long tempSecondCategoryId = null;
		FundsOriginGather tempSourceUseFunds = null;
		BigDecimal projectMoneySummary = new BigDecimal("0");
		BigDecimal tenDaysMoneySummary = new BigDecimal("0");
		BigDecimal aMonthMoneySummary = new BigDecimal("0");
		BigDecimal twoMonthsMoneySummary = new BigDecimal("0");
		BigDecimal threeMonthsMoneySummary = new BigDecimal("0");
		BigDecimal sixMonthsMoneySummary = new BigDecimal("0");
		BigDecimal moreSixMonthsMoneySummary = new BigDecimal("0");
		int count = 1;
		int sencondCatecount = 1;
		for (int i = 0; i < sourceList.size(); i++) {
			if (i == 0) {
				tempSourceUseFunds = sourceList.get(i);
				tempSecondCategoryId = tempSourceUseFunds.getSencondCategory()
						.getId();
				// 第一次初始化金额信息
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
					tempSourceUseFunds.setFirstProjectCount(count);
					tempSourceUseFunds
							.setSecondCountUnderFirst(sencondCatecount);
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
				firstCategoryId = sourceList.get(i).getFirstCategory().getId();
				secondCategoryId = sourceList.get(i).getSencondCategory()
						.getId();
				if (firstCategoryId.longValue() == tempSourceUseFunds
						.getFirstCategory().getId().longValue()) {
					// 累加同一个一级类别的项目信息
					count++;
					if (secondCategoryId.longValue() != tempSecondCategoryId) {
						sencondCatecount++;
						tempSecondCategoryId = secondCategoryId;
					}
					projectMoneySummary = projectMoneySummary.add(sourceList
							.get(i).getSummaryMoney());
					tenDaysMoneySummary = tenDaysMoneySummary.add(sourceList
							.get(i).getTenDaysMoney());
					aMonthMoneySummary = aMonthMoneySummary.add(sourceList.get(
							i).getaMonthMoney());
					twoMonthsMoneySummary = twoMonthsMoneySummary
							.add(sourceList.get(i).getTwoMonthsMoney());
					threeMonthsMoneySummary = threeMonthsMoneySummary
							.add(sourceList.get(i).getThreeMonthsMoney());
					sixMonthsMoneySummary = sixMonthsMoneySummary
							.add(sourceList.get(i).getSixMonthsMoney());
					moreSixMonthsMoneySummary = moreSixMonthsMoneySummary
							.add(sourceList.get(i).getMoreSixMonthsMoney());
					// 对最后一条记录做处理
					if (i == sourceList.size() - 1) {
						tempSourceUseFunds.setFirstProjectCount(count);
						tempSourceUseFunds
								.setSecondCountUnderFirst(sencondCatecount);
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
					// 将相同一级类别的项目信息累加
					tempSourceUseFunds.setFirstProjectCount(count);
					tempSourceUseFunds
							.setSecondCountUnderFirst(sencondCatecount);
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
					tempSourceUseFunds = sourceList.get(i);
					tempSecondCategoryId = tempSourceUseFunds
							.getSencondCategory().getId();
					count = 1;
					sencondCatecount = 1;
					projectMoneySummary = new BigDecimal("0");
					tenDaysMoneySummary = new BigDecimal("0");
					aMonthMoneySummary = new BigDecimal("0");
					twoMonthsMoneySummary = new BigDecimal("0");
					threeMonthsMoneySummary = new BigDecimal("0");
					sixMonthsMoneySummary = new BigDecimal("0");
					moreSixMonthsMoneySummary = new BigDecimal("0");
					// 第一次初始化金额信息
					projectMoneySummary = projectMoneySummary.add(sourceList
							.get(i).getSummaryMoney());
					tenDaysMoneySummary = tenDaysMoneySummary.add(sourceList
							.get(i).getTenDaysMoney());
					aMonthMoneySummary = aMonthMoneySummary.add(sourceList.get(
							i).getaMonthMoney());
					twoMonthsMoneySummary = twoMonthsMoneySummary
							.add(sourceList.get(i).getTwoMonthsMoney());
					threeMonthsMoneySummary = threeMonthsMoneySummary
							.add(sourceList.get(i).getThreeMonthsMoney());
					sixMonthsMoneySummary = sixMonthsMoneySummary
							.add(sourceList.get(i).getSixMonthsMoney());
					moreSixMonthsMoneySummary = moreSixMonthsMoneySummary
							.add(sourceList.get(i).getMoreSixMonthsMoney());
					// 对最后一条记录做处理
					if (i == sourceList.size() - 1) {
						tempSourceUseFunds.setFirstProjectCount(count);
						tempSourceUseFunds
								.setSecondCountUnderFirst(sencondCatecount);
						tempSourceUseFunds
								.setFirstProjectMoneySummary(sourceList.get(i)
										.getSummaryMoney());
						tempSourceUseFunds
								.setTenDaysMoneySummaryFirst(sourceList.get(i)
										.getTenDaysMoney());
						tempSourceUseFunds
								.setaMonthMoneySummaryFirst(sourceList.get(i)
										.getaMonthMoney());
						tempSourceUseFunds
								.setTwoMonthsMoneySummaryFirst(sourceList
										.get(i).getTwoMonthsMoney());
						tempSourceUseFunds
								.setThreeMonthsMoneySummaryFirst(sourceList
										.get(i).getThreeMonthsMoney());
						tempSourceUseFunds
								.setSixMonthsMoneySummaryFirst(sourceList
										.get(i).getSixMonthsMoney());
						tempSourceUseFunds
								.setMoreSixMonthsMoneySummaryFirst(sourceList
										.get(i).getMoreSixMonthsMoney());
					}
				}
			}
		}
		return sourceList;
	}
}
