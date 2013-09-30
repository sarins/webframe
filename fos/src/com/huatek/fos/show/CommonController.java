package com.huatek.fos.show;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huatek.fos.categorymanagement.entity.hibernate.BaseProjectCategories;
import com.huatek.fos.categorymanagement.service.BaseProjectCategoriesService;
import com.huatek.framework.util.Util;

/**
 * 
 * @author alan_zhang
 * 
 */
@Controller
@RequestMapping("/common.do")
public class CommonController {

	@Autowired
	private BaseProjectCategoriesService projectCategoriesService;

	/**
	 * 根据已选择的一级类目选择二级类目.
	 * 
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            response结果对象
	 * @param level
	 *            类目级别
	 * @throws IOException
	 *             输出异常.
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=getSecondCategoryById")
	public String getSecondCategoryById(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response, final Integer level)
			throws IOException {

		String categoryID = "";
		if (level == 2) {
			categoryID = request.getParameter("categoryFirst");
		}
		if (!"".equals(categoryID)) {
			List<BaseProjectCategories> secondCategoryList = projectCategoriesService
					.getNextCategory(categoryID, level);
			StringBuffer strBuffer = new StringBuffer("");
			strBuffer.append("<option value=''>---请选择---</option>");
			for (int i = 0; i < secondCategoryList.size(); i++) {
				BaseProjectCategories category = secondCategoryList.get(i);
				strBuffer.append("<option value='"
						+ Util.getString(category.getId()) + "'>"
						+ Util.getString(category.getProCateName())
						+ "</option>");
			}

			// 调用服务获取系列列表
			return Util.printString(strBuffer.toString());
		} else {
			return Util.printString("<option value=''>---请选择---</option>");
		}
	}

	/**
	 * 根据根据所属模块查询项目类目
	 * 
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @param request
	 *            request请求对象
	 * @param response
	 *            response结果对象
	 * @param moduleName
	 *            模块名称
	 * @return 项目类目列表
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=getCategoryByModule")
	public String getCategoryByModule(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response, final String moduleName,
			final String categoryId) throws IOException {

		List<BaseProjectCategories> categoriesList = projectCategoriesService
				.getCategoryByModuleName(moduleName, categoryId);
		StringBuffer strBuffer = new StringBuffer("");
		if (categoriesList != null && categoriesList.size() != 0) {
			strBuffer.append("<option value=''>---请选择---</option>");
			for (int i = 0; i < categoriesList.size(); i++) {
				BaseProjectCategories category = categoriesList.get(i);
				strBuffer.append("<option value='"
						+ Util.getString(category.getId()) + "'>"
						+ category.getTabString()
						+ Util.getString(category.getProCateName())
						+ "</option>");
			}

			// 调用服务获取系列列表
			return Util.printString(strBuffer.toString());
		} else {
			return Util.printString("<option value=''>---请选择---</option>");
		}
	}
}
