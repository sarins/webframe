/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-21 下午03:05:07
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.financingmanagement.service;

import java.text.ParseException;
import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.fos.financingmanagement.entity.hibernate.FinancingDetail;
import com.huatek.fos.homepage.entity.hibernate.FusionCharts;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 * 
 * @author: apple_liu
 * 
 * @version $Id: FinancingDetailService.java, v 0.1 2013-5-21 下午03:05:07 $
 * 
 *          Comment: 请类用来对融资的相关数据进行操作.
 */
public interface FinancingDetailService extends BaseService {
	/**
	 * 获取当前部门所有融资分页数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 * @throws ParseException
	 */
	CutPageBean getDepartmentFinancingPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount,
			String startDate, String endDaate) throws ParseException;

	/**
	 * 获取当前登录用户录入数据.
	 * 
	 * @param pageBean
	 * @param fwAccount
	 * @return
	 */
	CutPageBean getCurrAcctFinancingPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, final FwAccount fwAccount);

	/**
	 * 新增或者修改融资数据.
	 * 
	 * @param financingDetail
	 * @return
	 */
	int saveOrUpdateFinancing(final FinancingDetail financingDetail);

	/**
	 * 查看历史数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @param financeId
	 * @return
	 */
	CutPageBean getHistoryData(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params);

	/**
	 * 查看付息明细.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @param financeId
	 * @return
	 */
	CutPageBean getPayInterstDetail(CutPageBean pageBean,
			List<CommonBean> parameterList, Object[] params);

	List getAllRelatedDatesWithRecName(Long oldId);

	List getFusionChartsValue();

	StringBuffer convertDataToXML(FusionCharts fusionCharts)
			throws ParseException;

	/**
	 * 获取导出数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @return
	 * @throws ParseException
	 */
	CutPageBean getExportPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount,
			String startDate, String endDaate) throws ParseException;

}
