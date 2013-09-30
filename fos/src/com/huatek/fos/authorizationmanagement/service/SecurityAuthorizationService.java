/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-28 下午12:41:12
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.authorizationmanagement.service;

import java.text.ParseException;
import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.fos.authorizationmanagement.entity.hibernate.SecurityAuthorization;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 * 
 * @author: apple_liu
 * 
 * @version $Id: SecurityAuthorizationService.java, v 0.1 2013-5-28 下午12:41:12 $
 * 
 *          Comment: 请类用来定义对担保授信信息的相关操作方法.
 */
public interface SecurityAuthorizationService extends BaseService {

	/**
	 * 获取当前操作者添加的担保授信数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @param fwAccount
	 * @return
	 */
	CutPageBean getSecurityAuthorizationForOperator(final CutPageBean pageBean,
			List<CommonBean> parameterList, final FwAccount fwAccount);

	/**
	 * 新增，修改担保授信数据.
	 * 
	 * @param securityAuthorization
	 * @return
	 */
	boolean saveOrUpdateSecurityAuthorizaition(
			final SecurityAuthorization securityAuthorization);

	/**
	 * 获取当前登录用户所在部门全部数据.
	 * 
	 * @param pageBean
	 * @param parameterList
	 * @param fwAccount
	 * @return
	 * @throws ParseException
	 */
	CutPageBean getSecurityAuthorizationCurrGroup(final CutPageBean pageBean,
			List<CommonBean> parameterList, FwAccount fwAccount,
			String startDate, String endDate) throws ParseException;

}
