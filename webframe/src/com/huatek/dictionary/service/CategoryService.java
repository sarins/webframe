package com.huatek.dictionary.service;

import java.util.List;
import java.util.Map;

import com.huatek.base.service.BaseService;
import com.huatek.dictionary.entity.FwCategory;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

public interface CategoryService extends BaseService {
	/***
	 * 获取所有字典目录列表.
	 * @param systemCode 指定系统的数据字典.
	 */
	List<FwCategory> loadAllFwCategoryList(String systemCode);
	/***
	 * 获取指定系统字典目录列表的翻页数据.
	 * @param pageBean 翻页信息.
	 * @param paramterList 查询参数.
	 * @return CutPageBean 返回翻页数据.
	 */

	CutPageBean getFwCategoryPageBean(CutPageBean pageBean,List<CommonBean> paramterList);
	/***
	 * 获取某个系统下的所有字典目录的MAP.
	 * key=目录编码
	 * @param systemCode
	 * @return 返回字典目录Map.
	 */
	Map<String,FwCategory> loadAllFwCategoryMap(String systemCode);
	/***
	 * 获取字典目录.
	 * @param id 字典目录ID.
	 * @return 返回字典目录.
	 */
	FwCategory getFwCategory(Long id);

	void flushCache(boolean isLocal);

}
