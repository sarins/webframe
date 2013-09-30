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

public class FundsOriginServiceImpl extends BaseServiceImpl implements
		FundsOriginService {

	/**
	 * 查询资金来源信息.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	public CutPageBean getFundsOriPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList, Object[] params, FwAccount account) {
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		queryCondition.append(" and t.gatherDate= ?");
		paramArrayList.add((Date) params[0]);
		queryCondition.append(" and t.dataSources= ?");
		paramArrayList.add(Constant.DATA_SOURCES_FUNDS_RIO);
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (account.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(account.getFwGroup().getId());
		}
		String totalRowsHsql = " select count(t) from SourceUseFunds t where"
				+ queryCondition;
		String resultSql = "from SourceUseFunds t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.foundDate desc",
				paramArrayList.toArray(), pageBean, paramterList);
	}

	/**
	 * 查询资金来源信息（通过统计日期、数据类型、所属部门查询）.
	 * 
	 * @param sourceUseFunds
	 *            资金来源对象
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
	 * 新增或保存资金来源信息.
	 * 
	 * @param sourceUseFunds
	 *            资金来源
	 * @return 返回类型
	 */
	@SuppressWarnings("unchecked")
	public synchronized int saveSourceUseFunds(
			final SourceUseFunds sourceUseFunds, final FwAccount account) {
		if (sourceUseFunds.getId() == null) {
			FwGroup group = account.getFwGroup();
			sourceUseFunds.setGroup(group);
			// 取当前时间
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			// 取系统用户
			sourceUseFunds.setFoundDate(currentDate);
			sourceUseFunds.setOrganizationUserName(account.getAcctName());
			sourceUseFunds.setIsModify(Constant.MODIFY_FUNDS_YES);
			sourceUseFunds.setDataSources(Constant.DATA_SOURCES_FUNDS_RIO);
			save(sourceUseFunds);
			List<AuditReportRecord> AuditReportRecordList = hibernateTemplate
					.find("from AuditReportRecord t where t.gatherDate=? and t.reportsName=? and t.group.id=? order by t.id asc",
							new Object[] { sourceUseFunds.getGatherDate(),
									Constant.FUNDS_ORI_REPORT_NAME,
									sourceUseFunds.getGroup().getId() });
			if (AuditReportRecordList.size() == 0) {
				List<FwAccount> accountList = hibernateTemplate
						.find("from FwAccount t where t.position=? and t.fwGroup.id=? order by t.id asc",
								new Object[] { Constant.LEADER_CODE,
										group.getId() });
				AuditReportRecord auditReportRecord = new AuditReportRecord();
				auditReportRecord
						.setReportsName(Constant.FUNDS_ORI_REPORT_NAME);
				auditReportRecord.setOrgUserName(account.getUserName());
				auditReportRecord.setOrgAcctName(account.getAcctName());
				auditReportRecord.setForState(Constant.FOR_STATE_NOT_FINISH);
				if (accountList.size() > 0) {
					auditReportRecord.setMgLeaderShip(accountList.get(0)
							.getAcctName());
					auditReportRecord.setMgLeaderUserName(accountList.get(0)
							.getUserName());
				}
				auditReportRecord
						.setLeaderAuditState(Constant.LEADER_AUDIT_STATE_NO);
				auditReportRecord.setGatherDate(sourceUseFunds.getGatherDate());
				auditReportRecord.setFoundDate(currentDate);
				auditReportRecord.setGroup(group);
				save(auditReportRecord);
			}
		} else {
			merge(sourceUseFunds);
		}
		return 0;
	}

	/**
	 * 查询资金来源审核信息.
	 * 
	 * @param pageBean
	 *            对象
	 * @param paramterList
	 *            页面参数
	 * @param params
	 *            参数
	 * @return 返回类型
	 */
	public CutPageBean getFundsOriAuditPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList, Object[] params,
			final FwAccount account) throws ParseException {
		List<Object> paramArrayList = new ArrayList<Object>();
		StringBuffer queryCondition = new StringBuffer(
				" 1=1 and t.reportsName=? ");
		paramArrayList.add(Constant.FUNDS_ORI_REPORT_NAME);
		Object startDate = params[0];
		Object endDate = params[1];
		Object opType = params[2];
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
		if (opType != null && "editSubmit".equals(opType)) {
			paramArrayList.add(Constant.FOR_STATE_NOT_FINISH);
			queryCondition.append(" and t.forState=?");
		}
		if (opType != null && "audit".equals(opType)) {
			paramArrayList.add(Constant.FOR_STATE_FINISH);
			paramArrayList.add(Constant.LEADER_AUDIT_STATE_NO);
			queryCondition.append(" and t.forState=? and t.leaderAuditState=?");
		}
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (account.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(account.getFwGroup().getId());
		}
		String totalRowsHsql = " select count(t) from AuditReportRecord t where"
				+ queryCondition;
		String resultSql = "from AuditReportRecord t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.foundDate desc",
				paramArrayList.toArray(), pageBean, paramterList);
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
	public CutPageBean getFundsOriPreviewPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params,
			final FwAccount account) throws ParseException {
		Date gatherDate = (Date) params[0];
		StringBuffer queryCondition = new StringBuffer("1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		queryCondition.append(" and t.gatherDate= ?");
		paramArrayList.add(gatherDate);
		queryCondition.append(" and t.dataSources= ?");
		paramArrayList.add(Constant.DATA_SOURCES_FUNDS_RIO);
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (account.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(account.getFwGroup().getId());
		}

		String orderBySql = " t.firstCategory.id asc, t.sencondCategory.id asc";
		String totalRowSql = "select count(*) from SourceUseFunds t where "
				+ queryCondition;
		String resultSql = "select t from SourceUseFunds t where "
				+ queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowSql,
				resultSql, "order by " + orderBySql, paramArrayList.toArray(),
				pageBean, parameterList);
	}

	/**
	 * 编辑提交.
	 * 
	 * @param auditReportRecord
	 *            资金来源审核记录对象
	 * @return 返回类型
	 */
	public void confirmSubmit(final AuditReportRecord auditReportRecord) {
		String forState = getObjectByIdLock(AuditReportRecord.class,
				auditReportRecord.getId(), "forState");
		if (forState != null && !forState.equals(Constant.FOR_STATE_NOT_FINISH)) {
			throw new BusinessRuntimeException("该记录已经被处理，不能再操作");
		}
		auditReportRecord.setForState(Constant.FOR_STATE_FINISH);
		if (auditReportRecord.getLeaderAuditState() != null
				&& Constant.LEADER_AUDIT_STATE_REBUT.equals(auditReportRecord
						.getLeaderAuditState())) {
			auditReportRecord
					.setLeaderAuditState(Constant.LEADER_AUDIT_STATE_NO);
		}
		this.merge(auditReportRecord);
	}

	/**
	 * 审核通过或驳回.
	 * 
	 * @param auditReportRecord
	 *            资金来源审核记录对象
	 * @param status
	 *            审核通过或驳回
	 * @return 返回类型
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public void auditSubmit(final AuditReportRecord auditReportRecord,
			final String status, final String rejectReason,
			final FwAccount account) throws ParseException {
		String leaderAuditState = getObjectByIdLock(AuditReportRecord.class,
				auditReportRecord.getId(), "leaderAuditState");
		if (leaderAuditState != null
				&& !leaderAuditState.equals(Constant.LEADER_AUDIT_STATE_NO)) {
			throw new BusinessRuntimeException("该记录已经被处理，不能再操作");
		}
		auditReportRecord.setLeaderAuditState(status);
		if (status != null && Constant.LEADER_AUDIT_STATE_REBUT.equals(status)) {
			auditReportRecord.setForState(Constant.FOR_STATE_NOT_FINISH);
		}
		this.merge(auditReportRecord);
		if (status != null && Constant.LEADER_AUDIT_STATE_REBUT.equals(status)) {
			// 取当前时间
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			RejectReasonRecord rejectReasonRecord = new RejectReasonRecord();
			rejectReasonRecord.setRejUserName(account.getAcctName());
			rejectReasonRecord.setRejReason(rejectReason);
			rejectReasonRecord.setRejDate(currentDate);
			rejectReasonRecord.setFoundDate(currentDate);
			rejectReasonRecord.setAuditReportRecord(auditReportRecord);
			save(rejectReasonRecord);
		} else if (status != null
				&& Constant.LEADER_AUDIT_STATE_YES.equals(status)) {
			FwGroup group = account.getFwGroup();
			List<SourceUseFunds> sourceList = hibernateTemplate
					.find("from SourceUseFunds t where t.group.id=? and t.dataSources=? and t.gatherDate=? order by t.foundDate desc",
							new Object[] { group.getId(),
									Constant.DATA_SOURCES_FUNDS_RIO,
									auditReportRecord.getGatherDate() });
			for (int i = 0; i < sourceList.size(); i++) {
				SourceUseFunds sourceUse = sourceList.get(i);
				sourceUse.setIsModify(Constant.MODIFY_FUNDS_NO);
				this.update(sourceUse);
			}
		}
	}

	/**
	 * 驳回日志列表.
	 * 
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
	 * 组装二级项目分类信息（金额(包括二级品类合计)，信息条数secondProjectCount 用于二级分类RowSpan行数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	public List<SourceUseFunds> orgnizationSecondData(
			List<SourceUseFunds> sourceList) {
		Long sencondCategoryId = null;
		SourceUseFunds tempSourceUseFunds = null;
		BigDecimal projectMoneySummary = new BigDecimal("0");
		BigDecimal tenDaysMoneySummary = new BigDecimal("0");
		BigDecimal aMonthMoneySummary = new BigDecimal("0");
		BigDecimal twoMonthsMoneySummary = new BigDecimal("0");
		BigDecimal threeMonthsMoneySummary = new BigDecimal("0");
		BigDecimal sixMonthsMoneySummary = new BigDecimal("0");
		BigDecimal moreSixMonthsMoneySummary = new BigDecimal("0");
		int count = 1;
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
		return sourceList;
	}

	/**
	 * 组装一级项目分类信息（金额(包括一级品类合计)，信息条数 firstProjectCount用于一级分类RowSpan行数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	public List<SourceUseFunds> orgnizationFirstData(
			List<SourceUseFunds> sourceList) {
		Long firstCategoryId = null;
		Long secondCategoryId = null;
		Long tempSecondCategoryId = null;
		SourceUseFunds tempSourceUseFunds = null;
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
