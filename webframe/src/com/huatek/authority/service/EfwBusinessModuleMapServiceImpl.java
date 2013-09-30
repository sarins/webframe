package com.huatek.authority.service;

import java.util.List;
import org.apache.log4j.Logger;
import com.huatek.authority.entity.EfwBusinessModuleMap;
import com.huatek.base.service.BaseServiceImpl;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;

/**
 *本类完成数据角色的管理.
 *
 * @author Apple Liu
 *
 */
public class EfwBusinessModuleMapServiceImpl extends BaseServiceImpl implements
		EfwBusinessModuleMapService {
	/**
	 * 日志常量.
	 * **/
	@SuppressWarnings("unused")
	private static final Logger LOGGER = Logger
			.getLogger(EfwBusinessModuleMapServiceImpl.class);

	/**
	 * 根据参数查询分页数据.
	 *
	 * @param pageBean
	 *            分页对象
	 * @param paramterList
	 *            参数列表
	 * @return 分页结果对象
	 */
	@Override
	public CutPageBean getPageBean(final CutPageBean pageBean, final List<CommonBean> paramterList) {
		String queryCondition = " 1=1 ";
		String totalRowsHsql = " select count(t) from EfwBusinessModuleMap t where "
				+ queryCondition;
		String resultSql = "from EfwBusinessModuleMap t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.id desc", pageBean, paramterList);
	}


	/**
	 * 保存业务模块权限.
	 *
	 * @param efwBusinessModuleMap
	 *                    业务模块权限对象
	 * @return 返回保存是否成功
	 */
	public synchronized boolean saveOrUpdateEfwBusinessModuleMap(
			final EfwBusinessModuleMap efwBusinessModuleMap) {
		// 如果名称重复
		if (isDuplicate("from EfwBusinessModuleMap t where t.name=?",
				new Object[] { efwBusinessModuleMap.getName() }, efwBusinessModuleMap.getId())) {
			return false;
		}
		if (efwBusinessModuleMap.isNew()) {
			save(efwBusinessModuleMap);
		} else {
			merge(efwBusinessModuleMap);
		}
		return true;
	}


}
