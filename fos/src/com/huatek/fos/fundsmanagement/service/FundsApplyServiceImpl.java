package com.huatek.fos.fundsmanagement.service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.fos.fundsmanagement.entity.hibernate.AuditReportRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.RejectReasonRecord;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.exception.BusinessRuntimeException;
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
public class FundsApplyServiceImpl extends BaseServiceImpl implements
		FundsApplyService {

	/**
	 * 查询资金运用信息.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	public CutPageBean getFundsApply(CutPageBean pageBean,
			List<CommonBean> paramterList, Object[] params, FwAccount account) {
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (account.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(account.getFwGroup().getId());
		}
		queryCondition.append(" and t.gatherDate= ?");
		paramArrayList.add((Date) params[0]);
		queryCondition.append(" and t.dataSources= ?");
		paramArrayList.add(params[1]);

		String totalRowsHsql = " select count(t) from SourceUseFunds t where"
				+ queryCondition;
		String resultSql = "from SourceUseFunds t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.foundDate desc",
				paramArrayList.toArray(), pageBean, paramterList);
	}

	/**
	 * 查询资金运用信息（通过统计日期、数据类型、所属部门查询）.
	 * 
	 * @param sourceUseFunds
	 *            资金运用对象
	 * @param account
	 *            当前登录用户
	 * @return 返回类型
	 */
	@SuppressWarnings("unchecked")
	public List<SourceUseFunds> getFundsApplyByParam(
			final SourceUseFunds sourceUseFunds, FwAccount account) {
		StringBuffer queryCondition = new StringBuffer();
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		queryCondition.append(" t.gatherDate= ?");
		paramArrayList.add(sourceUseFunds.getGatherDate());
		queryCondition.append(" and t.dataSources= ?");
		paramArrayList.add(sourceUseFunds.getDataSources());

		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (account.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(account.getFwGroup().getId());
		}
		String sql = "from SourceUseFunds t where " + queryCondition;
		return hibernateTemplate.find(sql + "order by t.gatherDate desc",
				paramArrayList.toArray());
	}

	/**
	 * 新增或保存资金运用信息.
	 * 
	 * @param sourceUseFunds
	 *            资金运用对象
	 * @return 返回类型
	 */
	@SuppressWarnings("unchecked")
	public synchronized void saveOrUpdateApplyFunds(
			final SourceUseFunds sourceUseFunds, final FwAccount account) {
		// 新增资金运用信息
		if (sourceUseFunds.getId() == null) {
			// 设置当前登录用户所属部门
			FwGroup group = account.getFwGroup();
			sourceUseFunds.setGroup(group);
			// 获取当前系统时间
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			// 当前登录系统用户
			sourceUseFunds.setFoundDate(currentDate);
			sourceUseFunds.setOrganizationUserName(account.getAcctName());
			// 报表导出后，资金运用数据是否可以再次被修改，默认是
			sourceUseFunds.setIsModify(Constant.MODIFY_FUNDS_YES);
			// 数据来源:资金运用
			sourceUseFunds.setDataSources(Constant.DATA_SOURCES_FUNDS_APPLY);
			save(sourceUseFunds);
			// 在报表审核记录表中添加资金运用审核表头信息
			List<AuditReportRecord> AuditReportRecordList = hibernateTemplate
					.find("from AuditReportRecord t where t.gatherDate=? and t.reportsName=? and t.group.id=? order by t.id asc",
							new Object[] { sourceUseFunds.getGatherDate(),
									Constant.FUNDS_USE_REPORT_NAME,
									sourceUseFunds.getGroup().getId() });

			// 如果当前是第一次增加资金运用数据，那么需要往报表审核记录表中记录审核表头信息
			if (AuditReportRecordList.size() == 0) {
				// 获取当前部门的分管领导
				List<FwAccount> accountList = hibernateTemplate
						.find("from FwAccount t where t.position=? and t.fwGroup.id=? order by t.id asc",
								new Object[] { Constant.LEADER_CODE,
										group.getId() });

				AuditReportRecord auditReportRecord = new AuditReportRecord();
				// 报表名称
				auditReportRecord
						.setReportsName(Constant.FUNDS_USE_REPORT_NAME);
				// 编制人（当前登录用户）
				auditReportRecord.setOrgUserName(account.getUserName());
				auditReportRecord.setOrgAcctName(account.getAcctName());
				// 编制状态 默认未完成
				auditReportRecord.setForState(Constant.FORMATION_STATE_NO);
				// 如果当前部门的领导信息不为空
				if (accountList != null && accountList.size() > 0) {
					// 设置分管领导
					auditReportRecord.setMgLeaderShip(accountList.get(0)
							.getAcctName());
					auditReportRecord.setMgLeaderUserName(accountList.get(0)
							.getUserName());
				}

				// 分管领导审核状态默认未审核
				auditReportRecord
						.setLeaderAuditState(Constant.LEADER_AUDIT_STATE_NO);
				auditReportRecord.setGatherDate(sourceUseFunds.getGatherDate());
				auditReportRecord.setFoundDate(currentDate);
				// 报表所属部门
				auditReportRecord.setGroup(group);
				save(auditReportRecord);
			}
			// 更新资金运用信息
		} else {
			merge(sourceUseFunds);
		}
	}

	/**
	 * 查询资金来源报表审核信息.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 * @throws ParseException
	 */
	public CutPageBean getFundsApplyAudit(CutPageBean pageBean,
			List<CommonBean> paramterList, Object[] params,
			final FwAccount account) throws ParseException {
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 获取查询条件
		Object startDate = params[0];
		Object endDate = params[1];
		// 是否提交审核
		Object submitType = params[2];
		// 如果起始日期不为空
		if (startDate != null
				&& CommonUtil.isNotZeroLengthTrimString(startDate.toString())) {
			// 统计日期大于等于起始日期
			queryCondition.append(" and t.gatherDate >= ?");
			paramArrayList.add(FosUtil.getInitDate(startDate.toString()));
		}
		// 如果截至日期不为空
		if (endDate != null
				&& CommonUtil.isNotZeroLengthTrimString(endDate.toString())) {
			// 统计日期小于等于截至日期
			queryCondition.append(" and t.gatherDate <= ?");
			paramArrayList.add(FosUtil.getInitDate(endDate.toString()));
		}

		// 如果提交类型为报表提交
		if (submitType != null && "sbReport".equals(submitType)) {
			// 查询报表编辑状态为未完成
			queryCondition.append(" and t.forState = ?");
			paramArrayList.add(Constant.FORMATION_STATE_NO);
		}
		// 如果提交类型为报表审核
		if (submitType != null && "sbAudit".equals(submitType)) {
			// 查询报表编辑状态为已完成，分管领导状态为未审核
			queryCondition
					.append(" and t.forState= ? and t.leaderAuditState = ? ");
			paramArrayList.add(Constant.FORMATION_STATE_YES);
			paramArrayList.add(Constant.LEADER_AUDIT_STATE_NO);
		}

		// 获取当前部门
		FwGroup group = account.getFwGroup();
		// 报表名称："资金运用滚动计划表"
		queryCondition.append(" and t.reportsName= ? ");
		paramArrayList.add(Constant.FUNDS_USE_REPORT_NAME);
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (account.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id=? ");
			paramArrayList.add(group.getId());
		}

		// 获取总条数
		String totalRowsHsql = " select count(t) from AuditReportRecord t where"
				+ queryCondition;
		// 组装SQL
		String resultSql = "from AuditReportRecord t where " + queryCondition;

		// 返回分页查询结果
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.foundDate desc",
				paramArrayList.toArray(), pageBean, paramterList);
	}

	/**
	 * 报表审核确认提交.
	 * 
	 * @param auditReportRecord
	 *            资金来源审核记录对象
	 * @return 返回类型
	 */
	public void confirmSubmit(final AuditReportRecord auditReportRecord) {
		// 根据审核记录ID获取该审核记录的编制状态
		String forState = getObjectByIdLock(AuditReportRecord.class,
				auditReportRecord.getId(), "forState");
		// 如果编制状态不为空并且编制状态不是“未完成”
		if (forState != null && !forState.equals(Constant.FORMATION_STATE_NO)) {
			throw new BusinessRuntimeException("该记录已经被处理，不能再操作");
		}
		// 报表编制状态为已完成
		auditReportRecord.setForState(Constant.FORMATION_STATE_YES);
		// 如果当前提交审核数据的分管领导审核状态不为空并且审核状态是驳回
		if (auditReportRecord.getLeaderAuditState() != null
				&& Constant.LEADER_AUDIT_STATE_REBUT.equals(auditReportRecord
						.getLeaderAuditState())) {
			// 将分管领导审核状态设置成未审核
			auditReportRecord
					.setLeaderAuditState(Constant.LEADER_AUDIT_STATE_NO);
		}
		// 执行数据更新操作
		this.merge(auditReportRecord);
	}

	/**
	 * 审核通过或驳回提交.
	 * 
	 * @param auditReportRecord
	 *            资金来源报表审核记录对象
	 * @param status
	 *            审核通过或驳回
	 * @return 返回类型
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public void auditSubmit(final AuditReportRecord auditReportRecord,
			final String status, final String rejectReason,
			final FwAccount account) {
		// 根据审核记录ID获取该审核记录的领导审核状态
		String leaderAuditState = getObjectByIdLock(AuditReportRecord.class,
				auditReportRecord.getId(), "leaderAuditState");
		// 如果领导审核状态不是“未审核”
		if (leaderAuditState != null
				&& !leaderAuditState.equals(Constant.LEADER_AUDIT_STATE_NO)) {
			throw new BusinessRuntimeException("该记录已经被处理，不能再操作");
		}

		// 设置分管领导审核状态
		auditReportRecord.setLeaderAuditState(status);
		// 如果分管领导审核状态不为空并且审核状态是驳回
		if (status != null && Constant.LEADER_AUDIT_STATE_REBUT.equals(status)) {
			// 设置编制状态未完成
			auditReportRecord.setForState(Constant.FOR_STATE_NOT_FINISH);
		}
		// 执行状态更新操作
		this.merge(auditReportRecord);

		// 如果分管领导审核状态不为空并且审核状态是驳回
		if (status != null && Constant.LEADER_AUDIT_STATE_REBUT.equals(status)) {
			// 取当前时间
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			// 实例化驳回原因记录对象
			RejectReasonRecord rejectReasonRecord = new RejectReasonRecord();
			// 获取当前登录用户
			rejectReasonRecord.setRejUserName(account.getAcctName());
			// 驳回原因
			rejectReasonRecord.setRejReason(rejectReason);
			// 驳回日期
			rejectReasonRecord.setRejDate(currentDate);
			// 创建日期
			rejectReasonRecord.setFoundDate(currentDate);
			// 审核记录
			rejectReasonRecord.setAuditReportRecord(auditReportRecord);
			// 执行驳回记录数据保存
			save(rejectReasonRecord);
			// 如果审核状态不为空并且审核状态是已审核
		} else if (status != null
				&& Constant.LEADER_AUDIT_STATE_YES.equals(status)) {
			// 获取当前报表部门
			FwGroup group = account.getFwGroup();
			List<SourceUseFunds> sourceList = hibernateTemplate
					.find("from SourceUseFunds t where t.group.id=? and t.dataSources=? and t.gatherDate=? order by t.foundDate desc",
							new Object[] { group.getId(),
									Constant.DATA_SOURCES_FUNDS_APPLY,
									auditReportRecord.getGatherDate() });
			// 如果查询资金运用信息不为空，则循环更新是否可修改状态
			for (int i = 0; i < sourceList.size(); i++) {
				SourceUseFunds sourceUseFunds = sourceList.get(i);
				// 设置是否可修改装填为否
				sourceUseFunds.setIsModify(Constant.MODIFY_FUNDS_NO);
				// 执行状态更新操作
				this.update(sourceUseFunds);
			}
		}
	}

	/**
	 * 查询驳回日志列表.
	 * 
	 * @param auditReportRecordId
	 *            审核记录ID
	 * @return 返回类型
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public List<RejectReasonRecord> getRejectReasonRecord(
			Long auditReportRecordId) {
		return hibernateTemplate
				.find("from RejectReasonRecord t where t.auditReportRecord.id=? order by t.rejDate desc",
						new Object[] { auditReportRecordId });
	}

	/**
	 * 预览资金来源报表信息.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	public CutPageBean getFundsApplyPreview(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params, FwAccount account) {
		Date gatherDate = (Date) params[0];
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (account.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(account.getFwGroup().getId());
		}
		queryCondition.append(" and t.gatherDate= ?");
		paramArrayList.add(gatherDate);
		queryCondition.append(" and t.dataSources= ?");
		paramArrayList.add(Constant.DATA_SOURCES_FUNDS_APPLY);

		// 设置排序条件
		String orderBySql = " t.firstCategory.id ";
		// 获取总条数
		String totalRowSql = "select count(*) from SourceUseFunds t where "
				+ queryCondition;
		// 组装SQL
		String resultSql = "from SourceUseFunds t where " + queryCondition;
		// 获取查询结果
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowSql,
				resultSql, "order by " + orderBySql, paramArrayList.toArray(),
				pageBean, parameterList);
	}

	/**
	 * 通过统计日期和报表名称获取审核记录
	 * 
	 * @param gatherDate
	 *            统计日期
	 * @param reportsName
	 *            报表名称
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<AuditReportRecord> getAuditReportRecord(Date gatherDate,
			String reportsName, FwAccount account) {
		StringBuffer queryCondition = new StringBuffer();
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 统计日期、报表名称
		queryCondition.append(" t.gatherDate= ?");
		paramArrayList.add(gatherDate);
		queryCondition.append(" and t.reportsName= ?");
		paramArrayList.add(reportsName);

		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (account.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(account.getFwGroup().getId());
		}
		String sql = "from AuditReportRecord t where " + queryCondition;
		return hibernateTemplate.find(sql + " order by t.group.id",
				paramArrayList.toArray());
	}

	/**
	 * 组装一级项目分类信息（金额(包括一级品类合计)，信息条数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	public List<SourceUseFunds> orgnizationFirstData(
			List<SourceUseFunds> sourceList) {
		Long firstCategoryId = null;
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
		int count = 1;
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
		return sourceList;
	}
}
