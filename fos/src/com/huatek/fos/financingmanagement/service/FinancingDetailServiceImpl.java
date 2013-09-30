/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-21 下午03:05:25
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.financingmanagement.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.fos.financingmanagement.entity.hibernate.FinancingDetail;
import com.huatek.fos.homepage.entity.hibernate.FusionCharts;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;

/**
 * 
 * @author: apple_liu
 * 
 * @version $Id: FinancingDetailServiceImpl.java, v 0.1 2013-5-21 下午03:05:25 $
 * 
 *          Comment: 请类用来操作融资管理相关数据.
 */
public class FinancingDetailServiceImpl extends BaseServiceImpl implements
		FinancingDetailService {

	/**
	 * 获取当前登录用户录入融资分页查询数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 */
	public CutPageBean getCurrAcctFinancingPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, final FwAccount fwAccount) {
		StringBuffer queryCondition = new StringBuffer("1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果当前登录用户不是领导或管理员，需要根据登录用户名过滤数据
		if (fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.trasactUser=? ");
			paramArrayList.add(fwAccount.getAcctName());
		}
		queryCondition.append(" and t.isNewest =? ");
		paramArrayList.add("1");

		String totalRowHsql = "select count(t) from FinancingDetail t where "
				+ queryCondition;
		String resultHsql = "from FinancingDetail t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultHsql, "order by t.id desc", paramArrayList.toArray(),
				pageBean, parameterList);
	}

	/**
	 * 获取登录用户所在部门融资分页查询数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 * @throws ParseException
	 */
	public CutPageBean getDepartmentFinancingPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount,
			String startDate, String endDate) throws ParseException {
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果起始日期不为空
		if (startDate != null
				&& CommonUtil.isNotZeroLengthTrimString(startDate)) {
			// 起息日期大于等于起始日期
			queryCondition.append(" and t.startDate >= ?");
			paramArrayList.add(FosUtil.getInitDate(startDate));
		}
		// 如果截至日期不为空
		if (endDate != null && CommonUtil.isNotZeroLengthTrimString(endDate)) {
			// 统计日期小于等于结息日期
			queryCondition.append(" and t.endDate <= ?");
			paramArrayList.add(FosUtil.getInitDate(endDate));
		}
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(fwAccount.getFwGroup().getId());
		}
		String totalRowHsql = "select count(t) from FinancingDetail t where "
				+ queryCondition;
		String resultRowHsql = "from FinancingDetail t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultRowHsql, "order by t.mecName desc,t.id desc",
				paramArrayList.toArray(), pageBean, parameterList);
	}

	/**
	 * 获取登录用户所在部门融资分页查询数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 * @throws ParseException
	 */
	public CutPageBean getExportPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount,
			String startDate, String endDate) throws ParseException {
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果起始日期不为空
		if (startDate != null
				&& CommonUtil.isNotZeroLengthTrimString(startDate)) {
			// 起息日期大于等于起始日期
			queryCondition.append(" and t.startDate >= ?");
			paramArrayList.add(FosUtil.getInitDate(startDate));
		}
		// 如果截至日期不为空
		if (endDate != null && CommonUtil.isNotZeroLengthTrimString(endDate)) {
			// 统计日期小于等于结息日期
			queryCondition.append(" and t.endDate <= ?");
			paramArrayList.add(FosUtil.getInitDate(endDate));
		}
		// 如果当前登录用户不是领导或管理员，怎需要根据部门过滤数据
		if (fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(fwAccount.getFwGroup().getId());
		}
		String totalRowHsql = "select count(t) from FinancingDetail t where  t.id = t.originalId and "
				+ queryCondition;
		String resultRowHsql = "from FinancingDetail t where  t.id = t.originalId and "
				+ queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultRowHsql, "order by t.mecName desc,t.id desc",
				paramArrayList.toArray(), pageBean, parameterList);
	}

	/**
	 * 新增或者修改融资数据.
	 * 
	 */
	@SuppressWarnings("unchecked")
	public synchronized int saveOrUpdateFinancing(
			FinancingDetail financingDetail) {

		if (financingDetail.getId() == null) {
			// 如果合同编码重复
			if (isDuplicate(
					"From FinancingDetail t where t.infoCategory='1' and t.contactNumber=?",
					new Object[] { financingDetail.getContactNumber() },
					financingDetail.getId())) {
				return 1;
			}
			FwAccount fwAccount = ThreadLocalClient.get().getOperator();
			financingDetail.setTrasactUser(fwAccount.getAcctName());
			financingDetail.setGroup(fwAccount.getFwGroup());
			financingDetail.setCreateDate(new Date());
			// 代表是最新数据
			financingDetail.setIsNewest(Constant.FINANNCING_IS_NEWEST);
			financingDetail.setOriginalId(Long.valueOf(1));
			financingDetail.setRealEndDate(null);
			if (financingDetail.getEarlyReplyDate() != null) {
				if (financingDetail.getEarlyReplyDate().getTime() < financingDetail
						.getStartDate().getTime()
						|| financingDetail.getEarlyReplyDate().getTime() > financingDetail
								.getEndDate().getTime()) {
					throw new BusinessRuntimeException("提前还款日期必须介于开始日和结束日之间！");
				}
			}
			hibernateTemplate.save(financingDetail);
			financingDetail.setOriginalId(financingDetail.getId());
		} else {
			// 如果变更利率
			if (financingDetail.getIsChangeRate().equals(
					Constant.IS_CHANGE_RATE_YES)) {
				// 保存新数据
				FinancingDetail financingDetailNew = new FinancingDetail();
				BeanUtils.copyProperties(financingDetail, financingDetailNew);
				financingDetailNew.setId(null);
				financingDetailNew.setIsNewest(Constant.FINANNCING_IS_NEWEST);
				FinancingDetail financingOld = (FinancingDetail) super
						.getObjectById(FinancingDetail.class,
								financingDetail.getId());
				financingDetailNew.setOriginalId(financingOld.getOriginalId());
				financingDetailNew.setTrasactUser(ThreadLocalClient.get()
						.getOperator().getAcctName());
				financingDetailNew.setGroup(ThreadLocalClient.get()
						.getOperator().getFwGroup());
				financingDetailNew.setCreateDate(new Date());
				financingDetailNew.setRealEndDate(null);
				financingDetailNew.setIsChangeRate(Constant.IS_CHANGE_RATE_NO);
				if (financingDetailNew.getEarlyReplyDate() != null) {
					if (financingDetailNew.getEarlyReplyDate().getTime() < financingDetailNew
							.getStartDate().getTime()
							|| financingDetailNew.getEarlyReplyDate().getTime() > financingDetailNew
									.getEndDate().getTime()) {
						throw new BusinessRuntimeException(
								"提前还款日期必须介于开始日和结束日之间！");
					}
				}
				if (!financingOld.getInfoCategory().equals(
						financingDetail.getInfoCategory())) {
					throw new BusinessRuntimeException("信息类别不能更改！");
				}
				if (!financingOld.getMecName().equals(
						financingDetail.getMecName())) {
					throw new BusinessRuntimeException("机构名称不能更改！");
				}
				if (!financingOld.getMecCategory().equals(
						financingDetail.getMecCategory())) {
					throw new BusinessRuntimeException("机构种类不能更改！");
				}
				Date endDate = financingDetail.getEndDate();
				SimpleDateFormat df = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");
				String endDate1 = df.format(endDate);
				Timestamp ts = Timestamp.valueOf(endDate1);
				if (!financingOld.getEndDate().equals(ts)) {
					throw new BusinessRuntimeException("截止日不能更改！");
				}
				if (!financingOld.getEndIntMode().equals(
						financingDetail.getEndIntMode())) {
					throw new BusinessRuntimeException("结息方式不能更改！");
				}
				if (!financingOld.getEndIntDate().equals(
						financingDetail.getEndIntDate())) {
					throw new BusinessRuntimeException("结息日不能更改！");
				}
				if (!financingOld.getIsAdvanceReply().equals(
						financingDetail.getIsAdvanceReply())) {
					throw new BusinessRuntimeException("是否提前还款不能更改！");
				}
				if (!financingOld.getReplyPeriod().equals(
						financingDetail.getReplyPeriod())) {
					throw new BusinessRuntimeException("还款周期不能更改！");
				}
				// 当为融资的时候有合同编码
				if (financingDetail.getInfoCategory().equals("1")) {
					if (!financingOld.getContactNumber().equals(
							financingDetail.getContactNumber())) {
						throw new BusinessRuntimeException("合同编码不能更改！");
					}
				}

				hibernateTemplate.save(financingDetailNew);
				// 更新老数据
				Date newStartDate = financingDetailNew.getStartDate();
				Calendar c = Calendar.getInstance();
				c.setTime(newStartDate);
				// 老数据的实绩截止日期为新利率开始执行日期-1
				c.add(Calendar.DATE, -1);
				Date realEndDate = c.getTime();
				financingOld.setRealEndDate(realEndDate);
				financingOld.setIsNewest(Constant.FINANNCING_ISNOT_NEWEST);
				financingOld.setTrasactUser(ThreadLocalClient.get()
						.getOperator().getAcctName());
				financingOld.setGroup(ThreadLocalClient.get().getOperator()
						.getFwGroup());
				financingOld.setIsChangeRate(Constant.IS_CHANGE_RATE_YES);
				hibernateTemplate.merge(financingOld);
				// 更新关联数据的其他非必填字段
				String sql = "select t from FinancingDetail t where t.originalId ="
						+ financingOld.getOriginalId() + "order by t.id desc";
				List relatedOldDateList = hibernateTemplate.find(sql);
				if (relatedOldDateList != null && relatedOldDateList.size() > 0) {
					for (int i = 0; i < relatedOldDateList.size(); i++) {
						FinancingDetail financing = (FinancingDetail) relatedOldDateList
								.get(i);
						financing.setRateAdjustMode(financingDetailNew
								.getRateAdjustMode());
						financing.setGuarantee(financingDetailNew
								.getGuarantee());
						financing.setFinancingCategory(financingDetailNew
								.getFinancingCategory());
						financing.setTimeLimit(financingDetailNew
								.getTimeLimit());
						financing.setEarlyReplyDate(financingDetailNew
								.getEarlyReplyDate());
						financing.setMortMode(financingDetailNew.getMortMode());
						financing.setUse(financingDetailNew.getUse());
						financing.setRemark(financingDetailNew.getRemark());
						hibernateTemplate.merge(financing);
					}
				}
			} else {
				// 如果合同编码重复
				if (financingDetail.getId().equals(
						financingDetail.getOriginalId())) {
					if (isDuplicate(
							"From FinancingDetail t where t.infoCategory='1' and t.contactNumber=?",
							new Object[] { financingDetail.getContactNumber() },
							financingDetail.getId())) {
						return 1;
					}
				}
				// 判断修改利率之后的新数据和其他数据的合同编码有没有重复的
				if (financingDetail.getIsNewest().equals("1")) {
					if (isDuplicate(
							"From FinancingDetail t where t.infoCategory='1' and t.contactNumber=? and t.originalId <> '"
									+ financingDetail.getOriginalId() + "'",
							new Object[] { financingDetail.getContactNumber() },
							financingDetail.getId())) {
						return 1;
					}
					// 对于是利率修改后的新数据，如果进行修改的话，控制其开始日期必须等于最近一条历史数据的实际截止日期
					if (!financingDetail.getId().equals(
							financingDetail.getOriginalId())) {
						String sql = "from FinancingDetail t where t.originalId = '"
								+ financingDetail.getOriginalId()
								+ "' and t.isNewest = '0' order by t.id desc";
						List<FinancingDetail> mecNameList = hibernateTemplate
								.find(sql);
						if (mecNameList != null && mecNameList.size() > 0) {
							FinancingDetail fd = mecNameList.get(0);
							if (fd.getRealEndDate() != null) {
								Date realEndDate = fd.getRealEndDate();
								Calendar c = Calendar.getInstance();
								c.setTime(realEndDate);
								// 老数据的实绩截止日期为新利率开始执行日期-1
								c.add(Calendar.DATE, 1);
								Date realEndDate1 = c.getTime();
								if (!financingDetail.getStartDate().equals(
										realEndDate1)) {
									throw new BusinessRuntimeException(
											"新数据的开始日期必须晚于实际截止日期一天！");
								}
							}
						}
					}
				}
				if (financingDetail.getIsNewest().equals("1")) {
					if (!financingDetail.getId().equals(
							financingDetail.getOriginalId())) {
						FinancingDetail financingOld = (FinancingDetail) super
								.getObjectById(FinancingDetail.class,
										financingDetail.getId());
						if (!financingOld.getInfoCategory().equals(
								financingDetail.getInfoCategory())) {
							throw new BusinessRuntimeException("信息类别不能更改！");
						}
						if (!financingOld.getMecName().equals(
								financingDetail.getMecName())) {
							throw new BusinessRuntimeException("机构名称不能更改！");
						}
						if (!financingOld.getMecCategory().equals(
								financingDetail.getMecCategory())) {
							throw new BusinessRuntimeException("机构种类不能更改！");
						}
						Date endDate = financingDetail.getEndDate();
						SimpleDateFormat df = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");
						String endDate1 = df.format(endDate);
						Timestamp ts = Timestamp.valueOf(endDate1);
						if (!financingOld.getEndDate().equals(ts)) {
							throw new BusinessRuntimeException("截止日不能更改！");
						}
						if (!financingOld.getEndIntMode().equals(
								financingDetail.getEndIntMode())) {
							throw new BusinessRuntimeException("结息方式不能更改！");
						}
						if (!financingOld.getEndIntDate().equals(
								financingDetail.getEndIntDate())) {
							throw new BusinessRuntimeException("结息日不能更改！");
						}
						if (!financingOld.getIsAdvanceReply().equals(
								financingDetail.getIsAdvanceReply())) {
							throw new BusinessRuntimeException("是否提前还款不能更改！");
						}
						if (!financingOld.getReplyPeriod().equals(
								financingDetail.getReplyPeriod())) {
							throw new BusinessRuntimeException("还款周期不能更改！");
						}
						// 当为融资的时候有合同编码
						if (financingDetail.getInfoCategory().equals("1")) {
							if (!financingOld.getContactNumber().equals(
									financingDetail.getContactNumber())) {
								throw new BusinessRuntimeException("合同编码不能更改！");
							}
						}
						// 更新关联数据的其他非必填字段
						String sql = "select t from FinancingDetail t where t.originalId ="
								+ financingOld.getOriginalId()
								+ "order by t.id desc";
						List relatedOldDateList = hibernateTemplate.find(sql);
						if (relatedOldDateList != null
								&& relatedOldDateList.size() > 0) {
							for (int i = 0; i < relatedOldDateList.size(); i++) {
								FinancingDetail financing = (FinancingDetail) relatedOldDateList
										.get(i);
								financing.setRateAdjustMode(financingDetail
										.getRateAdjustMode());
								financing.setGuarantee(financingDetail
										.getGuarantee());
								financing.setFinancingCategory(financingDetail
										.getFinancingCategory());
								financing.setTimeLimit(financingDetail
										.getTimeLimit());
								financing.setEarlyReplyDate(financingDetail
										.getEarlyReplyDate());
								financing.setMortMode(financingDetail
										.getMortMode());
								financing.setUse(financingDetail.getUse());
								financing
										.setRemark(financingDetail.getRemark());
								hibernateTemplate.merge(financing);
							}
						}
					}
				}
				if (financingDetail.getEarlyReplyDate() != null) {
					if (financingDetail.getEarlyReplyDate().getTime() < financingDetail
							.getStartDate().getTime()
							|| financingDetail.getEarlyReplyDate().getTime() > financingDetail
									.getEndDate().getTime()) {
						throw new BusinessRuntimeException(
								"提前还款日期必须介于开始日和结束日之间！");
					}
				}
				hibernateTemplate.merge(financingDetail);
			}
		}
		return 0;
	}

	/**
	 * 查询利率变更的历史数据.
	 */
	public CutPageBean getHistoryData(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params) {
		// TODO Auto-generated method stub
		String condition = " 1=1 and t.originalId= ? and t.isNewest = '0' ";
		String totalRowHsql = "select count(t) from FinancingDetail t where"
				+ condition;
		String resultHsql = "from FinancingDetail t where " + condition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultHsql, "order by t.id desc",
				new Object[] { (Long) params[0] }, pageBean, parameterList);
	}

	/**
	 * 查看付息明细.
	 */
	public CutPageBean getPayInterstDetail(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params) {
		// TODO Auto-generated method stub
		String condition = "t.id =?";
		String totalRowHsql = "select count(t) from FinancingDetail t";
		String resultHsql = "from FinancingDetail t where " + condition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultHsql, "order by t.id desc", pageBean, parameterList);
	}

	/**
	 * 获取融资机构，融资金额，结束日期
	 */
	@SuppressWarnings("unchecked")
	public List<FinancingDetail> getFusionChartsValue() {
		String strDate = "";
		try {
			strDate = FosUtil.getStringDate(new Date());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "select new map(t.mecName as instituteName,t.financingMoney as financingMoney,t.startDate as startDate,t.endDate as endDate,t.interestRate as interestRate ) from FinancingDetail t where t.endDate>= TO_DATE('"
				+ strDate
				+ "','YYYY-MM-DD') and t.isNewest='1' and t.infoCategory = '1' order by t.endDate asc";
		List<FinancingDetail> fusionChartsList = hibernateTemplate.find(sql);
		return fusionChartsList;
	}

	/**
	 * 转成图表需要的xml类型的数据格式.
	 * 
	 * @throws ParseException
	 */
	@SuppressWarnings("unchecked")
	public StringBuffer convertDataToXML(FusionCharts fusionCharts)
			throws ParseException {
		// 生成一个随机的color,预定义一个color的数组
		String[] randomColor = new String[] { "AFD8F8", "F6BD0F", "8BBA00",
				"FF8E46", "008E8E", "D64646", "8E468E", "588526", "B3AA00",
				"008ED6", "9D080D", "A186BE", "708069", "FFD700", "40E0D0",
				"DA70D6", "33A1C9", "FF7F50", "F0FFFF", "87CEEB", "D2691E",
				"DCDCDC", "A066D3", "FF00FF", "A0522D", "3D59AB", "FFD700" };
		StringBuffer stringBuffer = new StringBuffer();
		// 拼接xml文件头信息
		stringBuffer.append("<graph caption='" + fusionCharts.getTitleName()
				+ "' xAxisName='" + fusionCharts.getxName() + "' yAxisName='"
				+ fusionCharts.getyName() + "' showvalues='0'"
				+ " decimalPrecision='2'" + " formatNumber='0'"
				+ " formatNumberScale='0'" + " hoverCapSepChar='，'"
				+ " baseFontSize='12'" + " numberSuffix='万元'"
				+ " labelDisplay='ROTATE'" + " showLegend='0'>");
		List<Object> quarterList = FosUtil.getQuarterValueFromNow();
		stringBuffer.append("<categories>");
		for (int j = 0; j < quarterList.size(); j++) {
			stringBuffer
					.append("<category name='" + quarterList.get(j) + "'/>");
		}
		stringBuffer.append("</categories>");
		List<FinancingDetail> fusionChartsList = this.getFusionChartsValue();
		for (int i = 0; i < fusionChartsList.size(); i++) {
			// 从map中获取到融资机构和融资金额
			Map<String, Object> map = (Map<String, Object>) fusionChartsList
					.get(i);
			String instituteName = map.get("instituteName").toString();
			String financignMoney = map.get("financingMoney").toString();
			Object startDate = map.get("startDate");
			String interstRate = map.get("interestRate").toString();
			// 算出结束日期对应的季节
			String dateInQuater = "";
			Object endDate = map.get("endDate");
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date newEndDate = df.parse(endDate.toString());
			Calendar time = Calendar.getInstance();
			time.setTime(newEndDate);
			int year = time.get(Calendar.YEAR);
			int month = time.get(Calendar.MONTH) + 1;
			if (month == 1 || month == 2 || month == 3) {
				dateInQuater = year + "年1季度";
			} else if (month == 4 || month == 5 || month == 6) {
				dateInQuater = year + "年2季度";
			} else if (month == 7 || month == 8 || month == 9) {
				dateInQuater = year + "年3季度";
			} else if (month == 10 || month == 11 || month == 12) {
				dateInQuater = year + "年4季度";
			}
			// 将金额和机构名称拼在xml文件中
			stringBuffer.append("<dataset seriesName='" + instituteName + "'"
					+ " color='" + randomColor[i] + "'>");
			for (int n = 0; n < quarterList.size(); n++) {
				if (quarterList.get(n).equals(dateInQuater)) {
					if (CommonUtil.isNotZeroLengthTrimString(financignMoney)) {
						stringBuffer.append("<set value='" + financignMoney
								+ "'" + " hoverText='" + financignMoney + "，"
								+ startDate + "，" + endDate + "，" + interstRate
								+ "%'" + "/>");
					}
				} else {
					stringBuffer.append("<set value='" + 0 + "'" + "/>");
				}
			}
			stringBuffer.append("</dataset>");
		}
		stringBuffer.append("</graph>");
		return stringBuffer;
	}

	/**
	 * 获取和该条数据OldId相等的数据list.
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<FinancingDetail> getAllRelatedDatesWithRecName(Long oldId) {
		String sql = "from FinancingDetail t where t.originalId = '" + oldId
				+ "'";
		List<FinancingDetail> relatedDatesList = hibernateTemplate.find(sql);
		return relatedDatesList;
	}
}
