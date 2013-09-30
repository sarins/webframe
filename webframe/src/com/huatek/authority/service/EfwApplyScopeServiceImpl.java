package com.huatek.authority.service;

import java.util.List;

import org.apache.log4j.Logger;

import com.huatek.authority.entity.EfwApplyScope;
import com.huatek.base.service.BaseServiceImpl;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;

public class EfwApplyScopeServiceImpl  extends BaseServiceImpl implements  EfwApplyScopeService{
	/**
	 * 日志常量.
	 * **/
	private static final Logger LOGGER = Logger
			.getLogger(EfwApplyScopeServiceImpl.class);

	/**
	 * 根据参数查询分页数据.
	 *
	 * @param pageBean
	 *            分页对象
	 * @param paramterList
	 *            参数列表
	 * @return 分页结果对象
	 */
	public CutPageBean getPageBean(final CutPageBean pageBean,
			final List<CommonBean> paramterList, Object[] param) {
		String totalRowsHsql = " select count(t) from EfwApplyScope t where t.efwBusinessModuleMap.id=?";
		String resultSql = "select distinct t from EfwApplyScope t where t.efwBusinessModuleMap.id=?";
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.id desc", param, pageBean, paramterList);
	}

	@Override
	public void saveOrUpdateEfwApplyScope(EfwApplyScope targetField) {

		if (targetField.isNew()) {
			save(targetField);
		} else {
			merge(targetField);
		}
	}

	@Override
	public EfwApplyScope getObjectById(Long id) {
			return (EfwApplyScope)hibernateTemplate.get(EfwApplyScope.class, id);

	}
	@SuppressWarnings("unchecked")
	public List<EfwApplyScope> findDatasByIds(Long[] ids) {
		String param = CommonUtil.getIdSQLParam(ids);
		if (param != null) {
			return (List<EfwApplyScope> )hibernateTemplate.find("from EfwApplyScope"+ " t where t.id in (" + param + ")", ids);
		}
		return null;
	}

}
