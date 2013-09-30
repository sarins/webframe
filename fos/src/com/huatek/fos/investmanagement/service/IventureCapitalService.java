/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-29 上午11:10:27
 * Author: zeek_zheng
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.investmanagement.service;

import java.util.Date;
import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 * 创投信息service接口
 * 
 * @author: alan_zhang
 * 
 */
public interface IventureCapitalService extends BaseService {

	/**
	 * 新增或保存创投信息.
	 * 
	 * @param sourceUseFunds
	 *            资金运用对象
	 * @param account
	 *            当前登录用户
	 * @return 返回类型
	 */
	void saveIventureCapital(final SourceUseFunds sourceUseFunds,
			final FwAccount account);

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
			String firstCategoryId);

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
	CutPageBean getIventureCapitalByFirstCategory(CutPageBean pageBean,
			List<CommonBean> parameterList, Long firstCategoryId,
			final FwAccount account, Date gatherDate);

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
	CutPageBean getIventureCapitalByGatherDate(CutPageBean pageBean,
			List<CommonBean> parameterList, Date gatherDate);

	/**
	 * 根据部门ID获取部门领导
	 * 
	 * @param fwGroupId
	 *            部门ID
	 * @return
	 */
	List<FwAccount> getFwAccountLeader(Long fwGroupId);
}
