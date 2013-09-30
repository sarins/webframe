package com.huatek.authority.service;

import java.util.List;

import com.huatek.authority.entity.EfwApplyScope;
import com.huatek.base.service.BaseService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

public interface EfwApplyScopeService extends BaseService{
    /**
     * 根据参数查询分页数据.
     * @param pageBean 分页对象
     * @param paramterList 参数列表
     * @param dataName
     * @return 分页结果对象
     */
    CutPageBean getPageBean(final CutPageBean pageBean, final List<CommonBean> paramterList, Object[] param);

  /*
   * 保存目标字段配置表的增加或修改
   *
   * */
	void saveOrUpdateEfwApplyScope(EfwApplyScope targetField);

	EfwApplyScope getObjectById(Long id);

	List<EfwApplyScope> findDatasByIds(Long[] ids);


}
