package com.huatek.dictionary.service;
/****
 * 字典目录用于实现系统数据字典的分类.
 * @author 潘仁胜
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.dictionary.entity.FwCategory;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;

public class CategoryServiceImpl extends BaseServiceImpl implements CategoryService {
	/***
	 * 获取所有字典目录列表.
	 * @param systemCode 指定系统的数据字典.
	 * @return 返货系统字典目录列表.
	 */
	@SuppressWarnings("unchecked")
	public List<FwCategory> loadAllFwCategoryList(String systemCode){
		return super.hibernateTemplate.find("from FwCategory t where t.fwSystem.sysCode=?",systemCode);
	}
	/***
	 * 获取指定系统字典目录列表的翻页数据.
	 * @param pageBean 翻页信息.
	 * @param paramterList 查询参数.
	 * @return CutPageBean 返回翻页数据.
	 */

	public CutPageBean getFwCategoryPageBean(CutPageBean pageBean,List<CommonBean> paramterList){
		String totalRowsHsql = " select count(t) from FwCategory t ";
		String resultSql = " from FwCategory t ";
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.id desc ", pageBean, paramterList);
	}
	/***
	 * 获取某个系统下的所有字典目录的MAP.
	 * key=目录编码
	 * @param systemCode
	 * @return 返回字典目录Map.
	 */
	public Map<String,FwCategory> loadAllFwCategoryMap(String systemCode){
		List<FwCategory> fwCategoryList =  loadAllFwCategoryList(systemCode);
		Map<String,FwCategory> fwCategoryMap = new HashMap<String,FwCategory>();
		for(FwCategory fwCategory:fwCategoryList){
			fwCategoryMap.put(fwCategory.getCode(), fwCategory);
		}
		return fwCategoryMap;
	}
	public FwCategory getFwCategory(Long id) {
		return (FwCategory)super.getObjectById(FwCategory.class, id);
	}

	public void flushCache(boolean isLocal) {

	}

}
