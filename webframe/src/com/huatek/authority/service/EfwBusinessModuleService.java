package com.huatek.authority.service;

import java.util.List;
import com.huatek.authority.entity.EfwBusinessModule;
import com.huatek.base.service.BaseService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 *业务模块相关操作接口.
 *
 * @author Apple Liu
 *
 */
public interface EfwBusinessModuleService extends BaseService {
    /**
     * 根据参数查询分页数据.
     * @param pageBean 分页对象
     * @param paramterList 参数列表
     * @param dataName
     * @return 分页结果对象
     */
    CutPageBean getPageBean(final CutPageBean pageBean, final List<CommonBean> paramterList);



    /**
     * 保存业务模块数据.
     * @param efwBusinessModule 业务模块的对象
     * @return 返回保存是否陈功
     */
    boolean saveOrUpdateEfwBusinessModule(final EfwBusinessModule efwBusinessModule);

    //查询业务模块所有数据
	List<EfwBusinessModule> getAllBusinessData();

}
