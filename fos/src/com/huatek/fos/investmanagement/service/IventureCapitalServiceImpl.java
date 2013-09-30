/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-29 上午11:13:40
 * Author: zeek_zheng
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.investmanagement.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.fos.util.Constant;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;

/**
 * 创投信息service接口实现
 * 
 * @author: alan_zhang
 * 
 */
public class IventureCapitalServiceImpl extends BaseServiceImpl implements
		IventureCapitalService {

	/**
	 * 根据当前登录用户所在部门获取创投信息
	 * 
	 * @param pageBean
	 *            pageBean
	 * @param parameterList
	 *            页面参数
	 * @param gatherDate
	 *            统计日期
	 * @param firstCategoryId
	 *            类目ID
	 * @return
	 */
	public CutPageBean getVentureCapitalPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, Date gatherDate,
			String firstCategoryId) {
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		queryCondition.append(" and t.dataSources=? and t.gatherDate=?");
		paramArrayList.add(Constant.DATA_SOURCES_FUNDS_CHUANGTOU);
		paramArrayList.add(gatherDate);
		// 如果需要根据项目类目查询
		if (firstCategoryId != null
				&& CommonUtil.isNotZeroLengthTrimString(firstCategoryId)) {
			queryCondition.append(" and t.firstCategory.id=?");
			paramArrayList.add(Long.valueOf(firstCategoryId));
		}
		String totalRowsHsql = " select count(t) from SourceUseFunds t where"
				+ queryCondition;
		String resultSql = "from SourceUseFunds t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.gatherDate desc",
				paramArrayList.toArray(), pageBean, parameterList);
	}

	/**
	 * 新增或保存创投信息.
	 * 
	 * @param sourceUseFunds
	 *            资金运用对象
	 * @param account
	 *            当前登录用户
	 * @return 返回类型
	 */
	public synchronized void saveIventureCapital(
			final SourceUseFunds sourceUseFunds, final FwAccount account) {
		if (sourceUseFunds.getId() == null) {
			// 设置当前登录用户所属部门
			FwGroup group = account.getFwGroup();
			sourceUseFunds.setGroup(group);
			// 获取当前系统时间
			Date currentDate = new java.sql.Date(new java.util.Date().getTime());
			// 当前登录系统用户
			sourceUseFunds.setFoundDate(currentDate);
			sourceUseFunds.setOrganizationUserName(account.getUserName());
			// 报表导出后，创投数据是否可以再次被修改，默认是
			sourceUseFunds.setIsModify(Constant.MODIFY_FUNDS_YES);
			// 数据来源:创投信息
			sourceUseFunds
					.setDataSources(Constant.DATA_SOURCES_FUNDS_CHUANGTOU);
			save(sourceUseFunds);
		} else {
			merge(sourceUseFunds);
		}
	}

	/**
	 * 根据项目分类获取创投信息
	 * 
	 * @param pageBean
	 *            pageBean对象
	 * @param parameterList
	 *            参数列表
	 * @param firstCategoryId
	 *            类目ID
	 * @param account
	 *            当前登录用户
	 * @param gatherDate
	 *            统计日期
	 * @return
	 */
	public CutPageBean getIventureCapitalByFirstCategory(CutPageBean pageBean,
			List<CommonBean> parameterList, Long firstCategoryId,
			final FwAccount account, Date gatherDate) {
		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		queryCondition.append(" and t.dataSources=?");
		paramArrayList.add(Constant.DATA_SOURCES_FUNDS_CHUANGTOU);
		queryCondition.append(" and t.firstCategory.id=?");
		paramArrayList.add(firstCategoryId);
		// 如果当前登录用户不为空（领导查询不需要进行部门过滤）
		if (account != null
				&& account.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id=?");
			paramArrayList.add(account.getFwGroup().getId());
		}
		// 如果需要根据统计日期查询
		if (gatherDate != null) {
			queryCondition.append(" and t.gatherDate=?");
			paramArrayList.add(gatherDate);
		}
		String totalRowsHsql = " select count(t) from SourceUseFunds t where"
				+ queryCondition;
		String resultSql = "from SourceUseFunds t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, " order by t.gatherDate desc",
				paramArrayList.toArray(), pageBean, parameterList);
	}

	/**
	 * 根据统计日期获取创投信息
	 * 
	 * @param pageBean
	 *            pageBean对象
	 * @param parameterList
	 *            参数列表
	 * @param gatherDate
	 *            统计日期
	 * @return
	 */
	public CutPageBean getIventureCapitalByGatherDate(CutPageBean pageBean,
			List<CommonBean> parameterList, Date gatherDate) {
		String queryCondition = " 1=1 and t.dataSources=? and t.gatherDate=? ";
		Object[] params = { Constant.DATA_SOURCES_FUNDS_CHUANGTOU, gatherDate };
		String totalRowsHsql = " select count(t) from SourceUseFunds t where"
				+ queryCondition;
		String resultSql = "from SourceUseFunds t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, " order by t.group.id,t.gatherDate desc", params,
				pageBean, parameterList);
	}

	/**
	 * 根据部门ID获取部门领导
	 * 
	 * @param fwGroupId
	 *            部门ID
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<FwAccount> getFwAccountLeader(Long fwGroupId) {
		String sql = "from FwAccount t where t.position=? and t.fwGroup.id=? order by t.id asc";
		Object[] param = { Constant.LEADER_CODE, fwGroupId };
		// 获取当前部门的分管领导
		return hibernateTemplate.find(sql, param);
	}
}
