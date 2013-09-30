package com.huatek.dictionary.action;

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
import com.huatek.dictionary.service.CategoryService;
import com.huatek.framework.entity.FwSource;
import com.huatek.framework.entity.FwSystem;
import com.huatek.framework.service.SystemService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * * 属性字典管理controller.
 *
 * @author winner pan
 *
 */
@Controller
@RequestMapping("/dicCategory.do")
@SessionAttributes(types = FwCategory.class)
public class CategoryController {
	/**
	 *属性字典管理的service.
	 */
	@Autowired
	private CategoryService categoryService;

	@Autowired
	private SystemService systemService;


	/**
	 *新增方法.
	 *
	 * @param model
	 *            对象
	 * @return 跳转到新增初始数据方法
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
	public String add(final Model model) {
		model.addAttribute(new FwCategory());
		return getInitDataPage(model, null);
	}

	/**
	 * 编辑初始数据方法.
	 *
	 * @param model
	 *            对象
	 * @param propertyId
	 *            属性id
	 * @return 跳转到编辑页面
	 */
	private String getInitDataPage(final Model model, final Long propertyId) {
		model.addAttribute("systemList", systemService.getAvailableFwSystem());
		return "frame/dictionary/category_edit.jsp";
	}

	/**
	 * 新增提交方法.
	 *
	 * @param model
	 *            对象
	 * @param property
	 *            对象
	 * @param result
	 *            结果
	 * @param status
	 *            状态
	 * @return 跳转到编辑提交方法
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
	public String processAdd(final Model model, final FwCategory property,
			final BindingResult result, final SessionStatus status) {

		return this.processEdit(model, property, result, status);
	}

	/**
	 * 编辑初始方法.
	 *
	 * @param id
	 *            传人id参数
	 * @param model
	 *            对象
	 * @return 跳转到初始数据方法
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
	public String edit(@RequestParam("queryId") final Long id, final Model model) {
		FwCategory category = categoryService.getFwCategory(id);
		category.getFwSystem().getName();
		model.addAttribute(category);
		return getInitDataPage(model, id);
	}

	/**
	 * 编辑保存方法.
	 *
	 * @param model
	 *            对象
	 * @param property
	 *            属性对象
	 * @param result
	 *            结果
	 * @param status
	 *            状态
	 * @return 跳转到查询方法
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEdit(final Model model, @ModelAttribute final FwCategory property,
			final BindingResult result, final SessionStatus status) {
		validate(property, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result, "dicCategoryForm"));
		}
		categoryService.saveOrupdate(property);
		status.setComplete();
		categoryService.flushCache(true);
		return "redirect:dicCategory.do?actionMethod=query";
	}

	/**
	 * 删除方法.
	 *
	 * @param ids
	 *            id数组
	 * @return 跳转到查询方法
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") final Long[] ids) {
		List<FwCategory> properties = categoryService.findDatasByIds(FwCategory.class, ids);
		if (properties != null && properties.size() > 0) {
			categoryService.deleteAll(properties);
		}
		categoryService.flushCache(true);
		return "redirect:dicCategory.do?actionMethod=query";
	}

	/**
	 * 查询初始方法.
	 *
	 * @param model
	 *            对象
	 * @param pageBean
	 *            分页bean
	 * @param request
	 *            httpRequest
	 * @return 跳转到列表页面
	 */
	@RequestMapping(params = "actionMethod=query")
	public String query(final Model model, final HttpServletRequest request) {
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(request, FwCategory.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("queryParams", paramterList);
		model.addAttribute("pageBean", categoryService.getFwCategoryPageBean(pageBean, paramterList));
		return "frame/dictionary/category_list.jsp";
	}


	/**
	 *验证方法.
	 *
	 * @param property
	 *            属性对象
	 * @param errors
	 *            errors
	 */
	public static void validate(final FwCategory fwCategory, final Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(fwCategory.getName())) {
			errors.rejectValue("name", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(fwCategory.getCode())) {
			errors.rejectValue("code", "required", "required");
		}
		if (fwCategory.getFwSystem()==null) {
			errors.rejectValue("fwSystem", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(fwCategory.getDisplay())) {
			errors.rejectValue("display", "required", "required");
		}
		if(fwCategory.getFwSystem()==null ){
			fwCategory.setFwSystem(new FwSystem());
		}
		if(fwCategory.getFwSystem().isNew()){
			fwCategory.getFwSystem().setId(Long.valueOf("1"));
		}
		ValidateFieldLength.validateMaxLength(errors, "name", 60, "maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "code", 30, "maxLimitLength", "输入超长。");
	}

	@RequestMapping(params = "actionMethod=assign",method = RequestMethod.GET)
	public String assignAction(@RequestParam("id") Long id,Model model){
		return "redirect:dictionary.do?actionMethod=query&categoryId="+id+"&menuId=20073";
	}

	 @InitBinder
	 protected void initBinder(WebDataBinder dataBinder) {
	        dataBinder.registerCustomEditor(FwSystem.class, "fwSystem", new BaseEntityEditor(
	            FwSystem.class));

	 }


}
