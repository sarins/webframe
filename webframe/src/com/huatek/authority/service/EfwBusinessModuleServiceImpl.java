package com.huatek.authority.service;

import java.util.List;
import org.apache.log4j.Logger;
import com.huatek.authority.entity.EfwBusinessModule;
import com.huatek.base.service.BaseServiceImpl;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;

/**
 *本类完成业务模块的管理.
 * 
 * @author Apple Liu
 * 
 */
public class EfwBusinessModuleServiceImpl extends BaseServiceImpl implements
		EfwBusinessModuleService {
	/**
	 * 日志常量.
	 * **/
	@SuppressWarnings("unused")
	private static final Logger LOGGER = Logger
			.getLogger(EfwBusinessModuleServiceImpl.class);

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
	public CutPageBean getPageBean(final CutPageBean pageBean,
			final List<CommonBean> paramterList) {
		String queryCondition = " 1=1 ";
		String totalRowsHsql = " select count(t) from EfwBusinessModule t where "
				+ queryCondition;
		String resultSql = "from EfwBusinessModule t where " + queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.id desc", pageBean, paramterList);
	}

	/**
	 * 保存业务模块.
	 * 
	 * @param efwBusinessModule
	 *            业务模块数据
	 * @return 返回保存是否成功
	 */
	public synchronized boolean saveOrUpdateEfwBusinessModule(
			final EfwBusinessModule efwBusinessModule) {
		// 如果名称重复
		if (isDuplicate("from EfwBusinessModule t where t.name=?",
				new Object[] { efwBusinessModule.getName() }, efwBusinessModule
						.getId())) {
			return false;
		}
		if (efwBusinessModule.isNew()) {
			save(efwBusinessModule);
		} else {
			merge(efwBusinessModule);
		}
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EfwBusinessModule> getAllBusinessData() {
		// TODO Auto-generated method stub
		return (List<EfwBusinessModule>) hibernateTemplate.find("from EfwBusinessModule t order by t.name asc");

	}
}
