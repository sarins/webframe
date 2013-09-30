package com.huatek.fos.categorymanagement.service;

import java.util.List;

import com.huatek.base.service.TreeNodeService;
import com.huatek.dictionary.entity.FwCategory;
import com.huatek.dictionary.entity.FwDictionary;
import com.huatek.fos.categorymanagement.entity.hibernate.BaseProjectCategories;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

/**
 * 项目类目Service
 * 
 * @author alan_zhang
 * 
 */
public interface BaseProjectCategoriesService extends TreeNodeService {

	/**
	 * 根据字典编码获取数据字典对象
	 * 
	 * @param code
	 *            数据字典编码
	 * @return
	 */
	List<FwCategory> getFwCategoryByCategoryCode(String dictionaryCode);

	/**
	 * 根据字典ID获取字典明细
	 * 
	 * @param categoryId
	 * @return
	 */
	List<FwDictionary> getFwDictionaryByCategoryId(Long dictionaryId);

	/**
	 * 根据ID 获取项目类目列表
	 * 
	 * @param ids
	 *            数组
	 * @return 返回类目列表
	 */
	List<BaseProjectCategories> findBaseCategoryListByIds(Long[] ids);

	/**
	 * 根据类目ID获取项目类目
	 * 
	 * @param categoryId
	 *            类目ID
	 * @return 返回类目对象
	 */
	BaseProjectCategories getBaseCategoryById(String categoryId);

	/**
	 * 根据根据所属模块查询项目类目
	 * 
	 * @param moduleName
	 *            所属模块
	 * @return 返回类目对象列表
	 */
	List<BaseProjectCategories> getCategoryByModuleName(String moduleName,
			String categoryId);

	/**
	 * 通过类目编码获取类目对象
	 * 
	 * @param moduleName
	 *            所属模块
	 * @param proCateCode
	 *            类目编码
	 * @return
	 */
	List<BaseProjectCategories> getCategoryByProCateCode(String moduleName,
			String proCateCode);

	/**
	 * 获取第一级项目类目
	 * 
	 * @return 返回类目对象列表
	 */
	List<BaseProjectCategories> getFirstCategory(String moduleNameId);

	/**
	 * 根据上级品类ID查询下级品类.
	 * 
	 * @param categoryID
	 *            上级品类ID
	 * @param level
	 *            品类层级
	 * @return 返回二级品类数组
	 */
	List<BaseProjectCategories> getNextCategory(final String categoryID,
			final Integer level);

	/**
	 * 根据类目ID获取上级项目类目
	 * 
	 * @param categoryId
	 *            类目ID
	 * @return 返回上级类目对象列表
	 */
	List<BaseProjectCategories> getCategoryParents(Long categoryId);

	/**
	 * 新增或修改项目类目
	 * 
	 * @param projectCategories
	 *            项目类目
	 * @param categoryId
	 *            上级类目ID
	 * @return 返回是否保存成功
	 */
	void saveOrUpdateCategory(BaseProjectCategories projectCategories);

	/**
	 * 类目分页查询.
	 * 
	 * @param pageBean
	 *            分页对象
	 * @param paramterList
	 *            参数列表
	 * @return 返回分页数据
	 */
	CutPageBean getCategoryPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList);

	/*
	 * 暂时去掉通过下拉列表级联查询项目类目功能 public CutPageBean getCategoryPageBean(final
	 * CutPageBean pageBean, final List<CommonBean> paramterList,final Object
	 * category[]);
	 */

	/**
	 * 删除项目类目
	 * 
	 * @param projectCategoriesList
	 *            类目对象列表
	 */
	void deleteCategories(List<BaseProjectCategories> projectCategoriesList);

}
