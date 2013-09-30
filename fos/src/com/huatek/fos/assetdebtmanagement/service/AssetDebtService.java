package com.huatek.fos.assetdebtmanagement.service;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.fos.basemanagement.entity.hibernate.AssetInformation;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 * 区域管理服务类，完成区域表相关操作接口.
 * 
 * @author Allen_Huang
 * 
 */
public interface AssetDebtService extends BaseService {

	/**
	 * 根据参数查询分页数据.
	 * 
	 * @param pageBean
	 *            分页对象
	 * @param paramterList
	 *            参数列表
	 * @return 分页结果对象
	 */
	CutPageBean getAssetDebtPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList);

	/**
	 * @return 资产信息的列表
	 */
	List getAssetDebtPageBeanInformation() throws ParseException;

	List<AssetInformation> getAssetUserTypeInfo(String type)
			throws ParseException;

	/**
	 * 用于刷新缓存数据.
	 * 
	 * @param isLocalNode
	 *            如果是集群刷新，则判断是否是本节点.
	 * **/
	void flushCahche(boolean isLocalNode);

	/**
	 * 获取融资总金额 .
	 * 
	 * @return
	 */
	List getFinancingTotalAmountFromFinancing() throws ParseException;

	/**
	 * 获取担保总金额 .
	 * 
	 * @return
	 */
	List getSecurityTotalAmountFrom() throws ParseException;
}
