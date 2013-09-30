package com.huatek.authority.service;

import java.util.List;
import com.huatek.authority.entity.EfwBusinessModuleMap;
import com.huatek.base.service.BaseService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 *业务模型权限表相关操作接口.
 *
 * @author Apple Liu
 *
 */
public interface EfwBusinessModuleMapService extends BaseService {
    /**
     * 根据参数查询分页数据.
     * @param pageBean 分页对象
     * @param paramterList 参数列表
     * @return 分页结果对象
     */
    CutPageBean getPageBean(final CutPageBean pageBean, final List<CommonBean> paramterList);
    
    /**
     * 保存业务模块权限数据.
     * @param  efwBusinessModuleMap 业务模型权限对象
     * @return 返回保存是否陈功
     */
    boolean saveOrUpdateEfwBusinessModuleMap(final EfwBusinessModuleMap efwBusinessModuleMap);

}
