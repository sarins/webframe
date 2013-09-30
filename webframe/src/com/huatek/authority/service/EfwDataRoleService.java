package com.huatek.authority.service;

import java.util.List;
import java.util.Map;

import com.huatek.authority.entity.EfwBusinessModule;
import com.huatek.authority.entity.EfwBusinessModuleMap;
import com.huatek.authority.entity.EfwDataRole;
import com.huatek.authority.entity.EfwDataRoleAuthority;
import com.huatek.authority.entity.EfwSourceEntity;
import com.huatek.authority.entity.EfwUserDataAuthority;
import com.huatek.base.service.BaseService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 *承运商服务类，完成承运商表相关操作接口.
 *
 * @author Joey_deng
 *
 */
public interface EfwDataRoleService extends BaseService {
    /**
     * 根据参数查询分页数据.
     * @param pageBean 分页对象
     * @param paramterList 参数列表
     * @param dataName
     * @return 分页结果对象
     */
    CutPageBean getPageBean(final CutPageBean pageBean, final List<CommonBean> paramterList, String dataName);



    /**
     * 保存数据角色.
     * @param transporter 承运商的对象
     * @return 返回保存是否陈功
     */
    boolean saveOrUpdateEfwDataRole(final EfwDataRole efwDataRole);


	/**
	 * 修改状态.
	 * @param ids 数据角色ID
	 * @param statuss 状态
	 */
	void conditionAll(final Long[] ids, final String status);

	/***
	 * 获取所有业务模块列表.
	 * 使用树展示.
	 */
	List<EfwBusinessModule> getAllEfwBusinessModule();

	/***
	 * 获取某个业务模块的翻页数据.
	 * 如果已经选择过，则该数据被选择上。
	 */
	 CutPageBean getModulePageBean(final CutPageBean pageBean, final List<CommonBean> paramterList, final EfwSourceEntity sourceEntity,boolean queryChecked,final String[] parameter);

	 /***
	  * 保存业务模块分配的权限.
	  */
	 void assignModuleData(final Long dataRoleId, final String dataId, final Long moduleId, final Long entityId,final String fieldValue, boolean isAdd);


	 /**
	  *
	  * @param dataRoleId 数据角色.
	  * @param moduleId 模块类别.
	  * @return
	  */
	 List<EfwDataRoleAuthority> getEfwDataRoleAuthorityList(final Long dataRoleId,final Long moduleId, final Long entityId);

	 void doAssignDataRole(final Long acctId, final Long[] dataIds);

	 List<EfwUserDataAuthority> getUserDaByUserId(final Long acctId);

	 List<EfwDataRole> getAvailableDataRole(String daName);
	 /***
	  * 获取模块下的实体配置.
	  * @param moduleId 模块ID.
	  * @param entityId 实体ID.
	  * @return 模块实体配置.
	  */
	 EfwBusinessModuleMap getEfwBusinessModuleMap(final Long moduleId, final Long entityId);



	List<EfwBusinessModule> getUefwDataRoleService();


	/*
	 * 保存用户的数据角色
	 *
	 */
	void assignDataRole(Long acctId, Long dataId, boolean checked);

	Map<String, Class> getAuthorityClassMap();


}
