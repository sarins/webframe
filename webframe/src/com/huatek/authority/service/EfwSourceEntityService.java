package com.huatek.authority.service;

import java.util.List;

import com.huatek.authority.entity.EfwSourceEntity;
import com.huatek.base.service.BaseService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

public interface EfwSourceEntityService extends BaseService {
	public CutPageBean getEfwSourseEntityPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList);

	public EfwSourceEntity getEfwSourceEntity(Long id);

	public boolean saveOrUpdateEfwSourceEntity(final EfwSourceEntity efwSourceEntity);

	public List<EfwSourceEntity> findDatasByIds(Long[] ids);

	public List<EfwSourceEntity> getAllBusinessData();

}
