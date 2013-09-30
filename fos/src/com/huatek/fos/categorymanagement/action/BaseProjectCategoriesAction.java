package com.huatek.fos.categorymanagement.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.huatek.dictionary.entity.FwCategory;
import com.huatek.dictionary.entity.FwDictionary;
import com.huatek.fos.categorymanagement.entity.hibernate.BaseProjectCategories;
import com.huatek.fos.categorymanagement.service.BaseProjectCategoriesService;
import com.huatek.fos.util.Constant;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * 项目类目管理类 action
 * 
 * @author alan_zhang
 * 
 */
@Controller
@RequestMapping("/baseProjectCategories.do")
@SessionAttributes(types = BaseProjectCategories.class)
public class BaseProjectCategoriesAction {
	/**
	 * 项目管理的service.
	 */
	@Autowired
	private BaseProjectCategoriesService projectCategoriesService;

	/**
	 * 项目类目管理列表显示跳转页面路径.
	 */
	private static final String LIST_CATEGORY_PATH = "fos/categorymanagement/category_list.jsp";

	/**
	 * 项目类目管理编辑跳转页面路径.
	 */
	private static final String EDIT_CATEGORY_PATH = "fos/categorymanagement/category_edit.jsp";

	/**
	 * 项目类目管理查询跳转页面路径(redirect方式).
	 */
	private static final String REDIRECT_PAGE_PATH = "redirect:baseProjectCategories.do?actionMethod=query";

	/**
	 * 项目类目管理查询跳转页面路径.
	 */
	private static final String QUERY_CATEGORY_PATH = "fos/categorymanagement/category_query.jsp";

	/**
	 * 查询页面初始方法.
	 * 
	 * @param model
	 *            对象
	 * @param request
	 *            请求对象
	 * @return 跳转到列表页面
	 */

	@RequestMapping(params = "actionMethod=query", method = RequestMethod.GET)
	public String queryInitPage(final Model model,
			final HttpServletRequest request) {
		// 获取一级项目类目
		model.addAttribute("categoriesList",
				projectCategoriesService.getFirstCategory("1"));
		return QUERY_CATEGORY_PATH;
	}

	/**
	 * 条件查询封装
	 * 
	 * @param model
	 *            model对象
	 * @param request
	 *            请求对象
	 * @return 返回查询结果列表
	 */
	@RequestMapping(params = "actionMethod=query", method = RequestMethod.POST)
	public String detailPost(final Model model, final HttpServletRequest request) {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, BaseProjectCategories.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);

		/*
		 * 暂时去掉通过下拉列表级联查询项目类目功能 String categoryFirst =
		 * request.getParameter("categoryFirst"); String categorySecond =
		 * request.getParameter("categorySecond"); String categoryId = "";
		 * 
		 * if (categorySecond != null && !categorySecond.equals("0")) {
		 * categoryId = categorySecond; } else if (categoryFirst != null &&
		 * !categoryFirst.equals("0")) { categoryId = categoryFirst; } Object[]
		 * paramObjs = new Object[]{categoryId}; // 设置查询参数
		 * model.addAttribute("queryParams", parameterList); // 设置分页
		 * model.addAttribute("pageBean",
		 * projectCategoriesService.getCategoryPageBean( pageBean,
		 * parameterList,paramObjs));
		 */

		// 设置查询参数
		model.addAttribute("queryParams", parameterList);
		// 设置分页
		model.addAttribute("pageBean", projectCategoriesService
				.getCategoryPageBean(pageBean, parameterList));

		return LIST_CATEGORY_PATH;
	}

	/**
	 * 新增/编辑初始话下拉列表数据方法.
	 * 
	 * @param model
	 *            对象
	 * @param categoryId
	 *            品类id
	 * @return 跳转到编辑页面
	 */
	private String getInitDataPage(final Model model, final Long categoryId) {
		// 获取一级项目类目
		model.addAttribute("categoriesList",
				projectCategoriesService.getCategoryParents(categoryId));

		// 通过模块名称数据字典编码获取字典对象
		List<FwCategory> fwCategoriesList = projectCategoriesService
				.getFwCategoryByCategoryCode(Constant.FOS_FUNCTION_MOUDLE);
		// 如果查询结果不为空
		if (fwCategoriesList != null && fwCategoriesList.size() != 0) {
			// 通过模块名称ID获取对应数据字典明细
			FwCategory fwCategory = fwCategoriesList.get(0);
			List<FwDictionary> fwDictionaries = projectCategoriesService
					.getFwDictionaryByCategoryId(fwCategory.getId());
			// 设置页面展示模块名称
			model.addAttribute("moduleNameList", fwDictionaries);
		}

		return EDIT_CATEGORY_PATH;
	}

	/**
	 * 项目类目新增页面跳转数据初始化函数.
	 * 
	 * @param model
	 *            对象
	 * @return 跳转到页面初始数据方法
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
	public String addInitDate(final Model model) {
		model.addAttribute(new BaseProjectCategories());
		// 调用初始化下拉列表数据查询方法
		return getInitDataPage(model, null);
	}

	/**
	 * 项目类目添加提交.
	 * 
	 * @param model
	 *            对象
	 * @param baseProjectCategories
	 *            项目类目对象
	 * @param result
	 *            结果对象
	 * @param status
	 *            Session 状态
	 * @param request
	 *            请求对象
	 * @return 跳转到查询页面
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
	public String processAdd(final Model model,
			@ModelAttribute final BaseProjectCategories baseProjectCategories,
			final BindingResult result, final SessionStatus status,
			final HttpServletRequest request) {
		// 调用添加类目数据封装方法
		return this.addOrUpdateCategory(model, baseProjectCategories, result,
				status, request);

	}

	/**
	 * 项目类目编辑页面跳转数据初始化函数.
	 * 
	 * @param id
	 *            编辑项目类目ID
	 * @param model
	 *            对象
	 * @return 跳转到新增/编辑页面
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
	public String editInitDate(@RequestParam("queryId") final Long id,
			final Model model) {
		// 调用初始化下拉列表数据查询方法
		this.getInitDataPage(model, id);
		// 根据类目ID获取类目对象
		model.addAttribute(projectCategoriesService.getObjectById(
				BaseProjectCategories.class, id));
		return EDIT_CATEGORY_PATH;

	}

	/**
	 * 项目类目编辑提交.
	 * 
	 * @param id
	 *            编辑项目类目ID
	 * @param model
	 *            对象
	 * @return 跳转到查询页面
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEdit(final Model model,
			@ModelAttribute final BaseProjectCategories baseProjectCategories,
			final BindingResult result, final SessionStatus status,
			final HttpServletRequest request) {
		// 调用编辑类目数据封装方法
		return this.addOrUpdateCategory(model, baseProjectCategories, result,
				status, request);

	}

	/**
	 * 新增/编辑项目类目数据封装.
	 * 
	 * @param model
	 *            对象
	 * @param category
	 *            类目对象
	 * @param result
	 *            结果
	 * @param status
	 *            session状态
	 * @param request
	 *            请求对象
	 * @return 跳转到查询页面
	 */
	public String addOrUpdateCategory(final Model model,
			@ModelAttribute final BaseProjectCategories projectCategories,
			final BindingResult result, final SessionStatus status,
			final HttpServletRequest request) {
		// 必输校验
		validate(projectCategories, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,
					"baseProjectCategoriesForm"));
		}
		// 调用新增、编辑数据库操作方法
		projectCategoriesService.saveOrUpdateCategory(projectCategories);
		// 清空Session
		status.setComplete();

		return REDIRECT_PAGE_PATH;
	}

	/**
	 * 新增/编辑项目类目数据校验方法.
	 * 
	 * @param category
	 *            项目类目对象
	 * @param errors
	 *            错误信息
	 * 
	 */
	public static void validate(final BaseProjectCategories category,
			final Errors errors) {
		// 模块名称不能为空
		if (CommonUtil.isZeroLengthTrimString(category.getModuleName())) {
			errors.rejectValue("moduleName", "required", "required");
		}
		// 类目编码不能为空
		if (CommonUtil.isZeroLengthTrimString(category.getProCateCode())) {
			errors.rejectValue("proCateCode", "required", "required");
		}
		// 类目名称不能为空
		if (CommonUtil.isZeroLengthTrimString(category.getProCateName())) {
			errors.rejectValue("proCateName", "required", "required");
		}
		// 类目编码长度校验
		ValidateFieldLength.validateMaxLength(errors, "proCateCode", 200,
				"maxLimitLength", "输入超长。");
		// 类目名称长度校验
		ValidateFieldLength.validateMaxLength(errors, "proCateName", 200,
				"maxLimitLength", "输入超长。");
	}

	/**
	 * 删除类目方法.
	 * 
	 * @param ids
	 *            id数组
	 * @return 跳转到查询方法
	 */
	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") final Long[] ids) {
		// 根据类目ID获取类目列表
		List<BaseProjectCategories> projectCategories = projectCategoriesService
				.findBaseCategoryListByIds(ids);
		if (projectCategories != null && projectCategories.size() > 0) {
			projectCategoriesService.deleteCategories(projectCategories);
		}

		return REDIRECT_PAGE_PATH;
	}

	/**
	 * 实体对象页面转换
	 * 
	 * @param dataBinder
	 */
	@InitBinder
	protected void initBinder(WebDataBinder dataBinder) {
		dataBinder.registerCustomEditor(BaseProjectCategories.class, "parent",
				new BaseEntityEditor(BaseProjectCategories.class));
	}

}
