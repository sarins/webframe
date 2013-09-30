/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-27 下午04:01:49
 * Author: zeek_zheng
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.basemanagement.service;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.fos.basemanagement.entity.hibernate.InitSettlement;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;

/**
 * 
 * @author: zeek_zheng
 * 
 * @version $Id: BeginFundsServiceImpl.java, v 0.1 2013-5-27 下午04:01:49 $
 * 
 *          Comment: 期初结转金额业务功能实现
 */
public class InitSettlementServiceImpl extends BaseServiceImpl implements
		InitSettlementService {

	public CutPageBean getFundsPageBean(CutPageBean pageBean,
			List<CommonBean> parameterList) {
		String totalRowHsql = "select count(t) from InitSettlement t";
		String resultHsql = "from InitSettlement t";
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowHsql,
				resultHsql, "order by t.gatherDate desc", pageBean,
				parameterList);
	}

	public synchronized boolean saveOrUpdateFunds(InitSettlement initSettlement)
			throws ParseException {
		if (isDuplicate(
				"From InitSettlement t where t.useType=? and t.gatherDate=?",
				new Object[] { initSettlement.getUseType(),
						initSettlement.getGatherDate() },
				initSettlement.getId())) {
			return false;
		}
		if (initSettlement.getId() == null) {
			initSettlement.setFoundDate(new Date());
			hibernateTemplate.save(initSettlement);
		} else {
			hibernateTemplate.merge(initSettlement);
		}
		return true;
	}

}
