/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-27 下午04:16:02
 * Author: zeek_zheng
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.basemanagement.service;

import java.text.ParseException;
import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.fos.basemanagement.entity.hibernate.InitSettlement;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 * 
 * @author: zeek_zheng
 * 
 * @version $Id: beginFundsService.java, v 0.1 2013-5-27 下午04:16:02 $
 * 
 *          Comment: 请添加对类的描述
 */
public interface InitSettlementService extends BaseService {

	/**
	 * 期初结算金额的分页查询
	 * 
	 * @return 分页查询结果
	 */
	public CutPageBean getFundsPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList);

	/**
	 * 保存或更新期初结算金额
	 * 
	 * @throws ParseException
	 */
	public boolean saveOrUpdateFunds(InitSettlement initSettlement)
			throws ParseException;

}
