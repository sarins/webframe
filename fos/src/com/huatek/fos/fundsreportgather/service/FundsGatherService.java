package com.huatek.fos.fundsreportgather.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.fos.basemanagement.entity.hibernate.InitSettlement;
import com.huatek.fos.fundsmanagement.entity.hibernate.AuditReportRecord;
import com.huatek.fos.fundsreportgather.entity.hibernate.ExportReportsRecord;
import com.huatek.fos.fundsreportgather.entity.hibernate.FundsApplyGather;
import com.huatek.fos.fundsreportgather.entity.hibernate.FundsOriginGather;
import com.huatek.fos.fundsreportgather.entity.hibernate.ReportsDetails;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 * 资金运用service类
 * 
 * @author alan_zhang
 * 
 */
public interface FundsGatherService extends BaseService {

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
	CutPageBean getAllFundsOriginGather(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params);

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
			List<CommonBean> parameterList, Object[] params);

	/**
	 * 通过部门级别获取所有该级别的部门信息
	 * 
	 * @param groupType
	 *            部门级别
	 * @return 部门列表
	 */
	List<FwGroup> getAllGroupByLevel(String groupType);

	/**
	 * 查询未汇总报表的部门列表.
	 * 
	 * @param level
	 *            部门级别
	 * @return 部门列表
	 */
	List<FwGroup> getUnGatherDepartMent(String dataSources, Date gatherDate);

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
	List<ExportReportsRecord> getExportReportsRecord(final String reportsName,
			String reportsUseType, Date gatherDate);

	/**
	 * 根据查询条件获取报表导出明细
	 * 
	 * @param fwAccount
	 *            当前登录用户
	 * @param reportsUseType
	 *            报表所属类型
	 * @param gatherDate
	 *            统计日期
	 * @param reportDataSources
	 *            报表数据来源
	 * @return 报表导出明细
	 */
	List<ReportsDetails> getReportsDetails(String reportsUseType,
			Date gatherDate);

	/**
	 * 添加报表导出明细
	 * 
	 * @param fwAccount
	 *            当前登录用户
	 * @param reportRecord
	 *            报表审核记录对象
	 * @param reportsUseType
	 *            报表所属类型
	 * @param reportsName
	 *            报表名称
	 * @param gatherDate
	 *            统计日期
	 * @param reportDataSources
	 *            报表数据来源
	 */
	void saveOrUpdateReportsDetails(final FwAccount fwAccount,
			String reportsUseType, Date gatherDate, String reportDataSources);

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
	void saveExportReportsRecord(final AuditReportRecord reportRecord,
			Date gatherDate, final FwAccount fwAccount, String reportsName,
			String reportsUseType);

	/**
	 * 设置资金平衡与分析汇总报表记录信息
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
	ReportsDetails setFundsGather(final ReportsDetails reportsDetails,
			final FwAccount fwAccount,
			final AuditReportRecord auditReportRecord, Date gatherDate,
			String reportDataSources);

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
	CutPageBean getFundsGatherPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList, Object[] params,
			final FwAccount fwAccount) throws ParseException;

	/**
	 * 获取汇总报表已审核部门数量
	 * 
	 * @param gatherDate
	 *            统计日期
	 * @param reportsName
	 *            报表名称
	 * @return 已审核数量
	 */
	int getAuditReportRecord(Date gatherDate, String reportsName);

	/**
	 * 通过统计日期获取期初结转金额
	 * 
	 * @param gatherDate
	 *            统计日期
	 * @return 期初结转金额列表
	 */
	List<InitSettlement> getInitSettlementByGatherDate(Date gatherDate,
			String useType);

	/**
	 * 组装资金运用一级项目分类信息（金额(包括一级品类合计)，信息条数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	List<FundsApplyGather> orgnizationApplyFirstData(
			List<FundsApplyGather> sourceList);

	/**
	 * 组装资金来源一级项目分类信息（金额(包括一级品类合计)，信息条数 firstProjectCount用于一级分类RowSpan行数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	List<FundsOriginGather> orgnizationOriginFirstData(
			List<FundsOriginGather> sourceList);

	/**
	 * 组装资金来源二级项目分类信息（金额(包括二级品类合计)，信息条数secondProjectCount 用于二级分类RowSpan行数）.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	List<FundsOriginGather> orgnizationOriginSecondData(
			List<FundsOriginGather> sourceList);
}
