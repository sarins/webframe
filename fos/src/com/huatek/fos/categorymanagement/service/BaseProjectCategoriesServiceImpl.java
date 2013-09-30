package com.huatek.fos.categorymanagement.service;

import java.util.List;

import com.huatek.base.service.TreeNodeServiceImpl;
import com.huatek.base.tree.TreeUtil;
import com.huatek.dictionary.entity.FwCategory;
import com.huatek.dictionary.entity.FwDictionary;
import com.huatek.fos.categorymanagement.entity.hibernate.BaseProjectCategories;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;

/**
 * 项目类目ServiceImpl
 * 
 * @author alan_zhang
 * 
 */
public class BaseProjectCategoriesServiceImpl extends TreeNodeServiceImpl
		implements BaseProjectCategoriesService {

	/**
	 * 最大品类为二级
	 */
	public static final int MAX_CATEGORY_LEVEL = 3;

	/**
	 * 根据字典编码获取数据字典对象
	 * 
	 * @param code
	 *            数据字典编码
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<FwCategory> getFwCategoryByCategoryCode(String dictionaryCode) {
		String sql = "from FwCategory t where t.code=?";
		// 设置字典编码查询条件
		Object[] param = { dictionaryCode };
		return hibernateTemplate.find(sql, param);
	}

	/**
	 * 通过字典ID获取字典明细
	 * 
	 * @param categoryId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<FwDictionary> getFwDictionaryByCategoryId(Long dictionaryId) {
		// 根据字典ID获取字典信息
		FwCategory fwCategory = (FwCategory) getObjectById(FwCategory.class,
				dictionaryId);
		if (fwCategory != null) {
			// 根据字典ID获取字典明细
			String sql = "from FwDictionary t where fwCategory.id = ?";
			Object[] param = { dictionaryId };
			return hibernateTemplate.find(sql, param);
		}
		return null;
	}

	/**
	 * 根据ID 获取项目类目列表
	 * 
	 * @param ids
	 *            数组
	 * @return 返回类目列表
	 */
	@SuppressWarnings("unchecked")
	public List<BaseProjectCategories> findBaseCategoryListByIds(Long[] ids) {
		String param = CommonUtil.getIdSQLParam(ids);
		if (param != null) {
			return hibernateTemplate.find("from BaseProjectCategories t "
					+ "where t.id in (" + param + ")", ids);
		}
		return null;
	}

	/**
	 * 根据类目ID获取项目类目列表
	 * 
	 * @param categoryId
	 *            类目ID
	 * @return 返回类目对象列表
	 */
	public BaseProjectCategories getBaseCategoryById(String categoryId) {
		BaseProjectCategories projectCategories = (BaseProjectCategories) this.hibernateTemplate
				.get(BaseProjectCategories.class, Long.valueOf(categoryId));
		return projectCategories;
	}

	/**
	 * 根据根据所属模块查询项目类目
	 * 
	 * @param moduleName
	 *            所属模块
	 * @return 返回类目对象列表
	 */
	@SuppressWarnings("unchecked")
	public List<BaseProjectCategories> getCategoryByModuleName(
			String moduleName, String categoryId) {
		String sql = "";
		// 获取所有项目类目
		if (categoryId == null || CommonUtil.isZeroLengthTrimString(categoryId)) {
			sql = "from BaseProjectCategories t where t.moduleName=?";
			Object[] param = { moduleName };
			return hibernateTemplate.find(sql + " order by t.style asc", param);
		} else {
			// 根据项目类目ID获取类目
			BaseProjectCategories projectCategories = (BaseProjectCategories) hibernateTemplate
					.get(BaseProjectCategories.class, Long.valueOf(categoryId));
			// 获取该模块下不包含当前类目的所有子类目
			sql = "from BaseProjectCategories t where t.style not like '"
					+ projectCategories.getStyle().substring(0,
							2 * projectCategories.getLevel())
					+ "%' and t.moduleName='" + moduleName + "'";
			return hibernateTemplate.find(sql + " order by t.style asc");
		}
	}

	/**
	 * 通过类目编码获取类目对象
	 * 
	 * @param moduleName
	 *            所属模块
	 * @param proCateCode
	 *            类目编码
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<BaseProjectCategories> getCategoryByProCateCode(
			String moduleName, String proCateCode) {
		String sql = "from BaseProjectCategories t where t.moduleName=? and t.proCateCode=?";
		Object[] param = { moduleName, proCateCode };
		return hibernateTemplate.find(sql + " order by t.style asc", param);
	}

	/**
	 * 查询第一级项目类目
	 * 
	 * @param moduleName
	 *            模块名称
	 * 
	 * @return 返回类目数组
	 */
	@SuppressWarnings("unchecked")
	public List<BaseProjectCategories> getFirstCategory(String moduleName) {
		String sql = "from BaseProjectCategories t";
		List returnlist;
		// 如果模块名称不为空
		if (moduleName != null
				&& CommonUtil.isNotZeroLengthTrimString(moduleName)) {
			sql = sql + " where t.level=? and t.moduleName=?";
			Object[] param = { 1, moduleName };
			returnlist = hibernateTemplate.find(sql + " order by t.style asc",
					param);
			// 否则只根据级别
		} else {
			sql = sql + " where t.level=?";
			Object[] param = { 1 };
			returnlist = hibernateTemplate.find(sql + " order by t.style asc",
					param);
		}

		return returnlist;
	}

	/**
	 * 根据上级类目ID及级别查询下级类目.
	 * 
	 * @param categoryID
	 *            上级类目ID
	 * @param level
	 *            类目层级
	 * @return 返回二级类目数组
	 */
	@SuppressWarnings("unchecked")
	public List<BaseProjectCategories> getNextCategory(final String categoryID,
			final Integer level) {
		String sql = "from BaseProjectCategories t where t.level=? and t.parent.id=?";
		Object[] param = { level, Long.valueOf(categoryID) };
		return hibernateTemplate.find(sql + " order by t.style asc", param);
	}

	/**
	 * 根据类目ID获取项目类目
	 * 
	 * @param categoryId
	 *            类目ID
	 * @return 返回类目对象列表
	 */
	@SuppressWarnings("unchecked")
	public List<BaseProjectCategories> getCategoryParents(Long categoryId) {
		String sql = "";
		// 获取所有项目类目
		if (categoryId == null) {
			sql = "from BaseProjectCategories t order by t.style asc";
			return hibernateTemplate.find(sql);
		} else {
			// 根据项目类目ID获取类目
			BaseProjectCategories projectCategories = (BaseProjectCategories) hibernateTemplate
					.get(BaseProjectCategories.class, Long.valueOf(categoryId));
			// 获取该模块下不包含当前类目的所有子类目
			sql = "from BaseProjectCategories t where t.style not like '"
					+ projectCategories.getStyle().substring(0,
							2 * projectCategories.getLevel())
					+ "%' and t.moduleName='"
					+ projectCategories.getModuleName()
					+ "' order by t.style asc";
			return hibernateTemplate.find(sql);
		}
	}

	/**
	 * 新增或修改项目类目.
	 * 
	 * @param projectCategories
	 *            项目类目对象
	 * @param categoryId
	 *            上级类目
	 */
	public synchronized void saveOrUpdateCategory(
			final BaseProjectCategories projectCategories) {

		// 编码不能重复
		if (isDuplicate("from BaseProjectCategories t where t.proCateCode=?",
				new Object[] { projectCategories.getProCateCode() },
				projectCategories.getId())) {
			throw new BusinessRuntimeException("类目编码不能重复，请重新输入!");
		}

		// 更新类目
		if (projectCategories.getId() != null) {

			// 根据类目对象获取与该类目具有关联关系的类目列表
			List<BaseProjectCategories> subProjectCategoriesList = this
					.getSubChannlList(projectCategories);

			if (subProjectCategoriesList != null
					&& subProjectCategoriesList.size() > 0) {
				throw new BusinessRuntimeException("该类目有下级类目，不能修改");
			}
			TreeUtil.setLeveAndStyle(projectCategories,
					super.getHibernateTemplate());
			if (projectCategories.getLevel() == MAX_CATEGORY_LEVEL) {
				throw new BusinessRuntimeException("最大品类为二级");
			}
			this.merge(projectCategories);
			// 添加类目
		} else {
			TreeUtil.setLeveAndStyle(projectCategories,
					super.getHibernateTemplate());
			if (projectCategories.getLevel() == MAX_CATEGORY_LEVEL) {
				throw new BusinessRuntimeException("最大品类为二级");
			}
			this.save(projectCategories);
		}
	}

	/**
	 * 删除项目类目
	 * 
	 * @param projectCategoriesList
	 *            类目对象列表
	 */
	public void deleteCategories(List<BaseProjectCategories> categoriesList) {

		// 根据类目对象获取与该类目具有关联关系的类目对象列表
		for (int i = 0; i < categoriesList.size(); i++) {
			List<BaseProjectCategories> projectCategoriesList = this
					.getSubChannlList(categoriesList.get(i));

			// 如果该类目与其它类目具有关联关系
			if (projectCategoriesList != null
					&& projectCategoriesList.size() > 0) {
				throw new BusinessRuntimeException("该类目有下级类目，请先删除下级类目");
			}
		}
		this.deleteAll(categoriesList);

	}

	/**
	 * 根据类目对象获取与该类目具有关联关系的类目对象列表
	 * 
	 * @param projectCategories
	 *            类目对象
	 * @return 返回类目对象列表
	 */
	@SuppressWarnings("unchecked")
	public List<BaseProjectCategories> getSubChannlList(
			final BaseProjectCategories projectCategories) {
		List<BaseProjectCategories> projectCategoriesList = this.hibernateTemplate
				.find("from BaseProjectCategories t where t.level > "
						+ projectCategories.getLevel()
						+ " and t.style like '"
						+ projectCategories.getStyle().substring(0,
								projectCategories.getLevel() * 2) + "%'");
		return projectCategoriesList;
	}

	/**
	 * 类目分页方法.
	 * 
	 * @param pageBean
	 *            pageBean
	 * @param paramterList
	 *            参数List
	 * @return 返回pageBean
	 */
	public CutPageBean getCategoryPageBean(final CutPageBean pageBean,
			final List<CommonBean> paramterList) {
		String queryCondition = " 1=1 ";
		String totalRowsHsql = " select count(t) from BaseProjectCategories t where"
				+ queryCondition;
		String resultSql = "from BaseProjectCategories t where "
				+ queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.style asc", pageBean, paramterList);
	}

	/*
	 * 暂时去掉通过下拉列表级联查询项目类目功能 //重载getCategoryPageBean; public CutPageBean
	 * getCategoryPageBean(final CutPageBean pageBean, final List<CommonBean>
	 * paramterList,final Object category[]) { String queryCondition = " 1=1 ";
	 * StringBuffer totalRowsHsql1 = new StringBuffer(""); StringBuffer
	 * resultSql1 = new StringBuffer(""); totalRowsHsql1.append(
	 * "select count(t) from BaseProjectCategories t where" + queryCondition);
	 * resultSql1.append("from BaseProjectCategories t where " +
	 * queryCondition); Object catetorysId=category[0]; if (catetorysId != null
	 * && CommonUtil.isNotZeroLengthTrimString(catetorysId.toString())) {
	 * BaseProjectCategories goodsCategory =
	 * this.getBaseCategoryById(catetorysId.toString()); if (goodsCategory !=
	 * null) { String style = goodsCategory.getStyle().substring(0,
	 * goodsCategory.getLevel() * 2);
	 * totalRowsHsql1.append(" and t.style like '" + style + "%'");
	 * resultSql1.append(" and  t.style like '" + style + "%'");
	 * 
	 * } } String totalRowsHsql=totalRowsHsql1.toString(); String
	 * resultSql=resultSql1.toString(); return
	 * QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
	 * resultSql, "order by t.style asc", pageBean, paramterList); }
	 */
}
