/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-28 下午12:42:07
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.authorizationmanagement.service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.fos.authorizationmanagement.entity.hibernate.SecurityAuthorization;
import com.huatek.fos.util.Constant;
import com.huatek.fos.util.FosUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;

/**
 * 
 * @author: apple_liu
 * 
 * @version $Id: SecurityAuthorizationServiceImpl.java, v 0.1 2013-5-28
 *          下午12:42:07 $
 * 
 *          Comment: 请类用来完成对担保授信数据的操作.
 */
public class SecurityAuthorizationServiceImpl extends BaseServiceImpl implements
		SecurityAuthorizationService {

	/**
	 * 获取当前操作者添加的担保授信数据.
	 */
	public CutPageBean getSecurityAuthorizationForOperator(
			CutPageBean pageBean, List<CommonBean> parameterList,
			final FwAccount fwAccount) {
		StringBuffer queryCondition = new StringBuffer();
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果当前登录用户不是领导或管理员，需要根据登录用户名过滤数据
		if (fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" where 1=1 and t.transacUser=? ");
			paramArrayList.add(fwAccount.getAcctName());
		}
		String totalRowHsql = "select count(t) from SecurityAuthorization t "
				+ queryCondition;
		String resultRowHsql = "from SecurityAuthorization t " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultRowHsql, "order by t.id desc", paramArrayList.toArray(),
				pageBean, parameterList);
	}

	/**
	 * 新增修改数据.
	 */
	public synchronized boolean saveOrUpdateSecurityAuthorizaition(
			SecurityAuthorization securityAuthorization) {
		// TODO Auto-generated method stub
		if (securityAuthorization.getId() == null) {
			FwAccount fwAccount = ThreadLocalClient.get().getOperator();
			securityAuthorization.setTransacUser(fwAccount.getAcctName());
			securityAuthorization.setGroup(fwAccount.getFwGroup());
			securityAuthorization.setFoundDate(new Date());
			hibernateTemplate.save(securityAuthorization);
		} else {
			hibernateTemplate.merge(securityAuthorization);
		}
		return true;
	}

	/**
	 * 获取当前登录用户所在部门数据.
	 * 
	 * @throws ParseException
	 */
	public CutPageBean getSecurityAuthorizationCurrGroup(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount,
			String startDate, String endDate) throws ParseException {

		StringBuffer queryCondition = new StringBuffer(" 1=1");
		// 设置参数列表
		List<Object> paramArrayList = new ArrayList<Object>();
		// 如果起始日期不为空
		if (startDate != null
				&& CommonUtil.isNotZeroLengthTrimString(startDate)) {
			// 起息日期大于等于起始日期
			queryCondition.append(" and t.eventInitialDate >= ?");
			paramArrayList.add(FosUtil.getInitDate(startDate));
		}
		// 如果截至日期不为空
		if (endDate != null && CommonUtil.isNotZeroLengthTrimString(endDate)) {
			// 统计日期小于等于结息日期
			queryCondition.append(" and t.eventEndDate <= ?");
			paramArrayList.add(FosUtil.getInitDate(endDate));
		}
		// 如果当前登录用户不是领导或管理员，需要根据部门过滤数据
		if (fwAccount.getFwGroup().getId() != Constant.PARENT_COMPANY_GROUP_ID) {
			queryCondition.append(" and t.group.id= ?");
			paramArrayList.add(fwAccount.getFwGroup().getId());
		}

		String totalRowHsql = "select count(t) from SecurityAuthorization t where "
				+ queryCondition;
		String resultRowHsql = "from SecurityAuthorization t where "
				+ queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultRowHsql, "order by t.id desc", paramArrayList.toArray(),
				pageBean, parameterList);
	}

}
