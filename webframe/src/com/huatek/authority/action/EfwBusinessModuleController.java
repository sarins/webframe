package com.huatek.authority.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.huatek.authority.entity.EfwBusinessModule;
import com.huatek.authority.service.EfwBusinessModuleService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * 数据业务的Controller.
 *
 * @author Apple Liu
 */
@Controller
@RequestMapping("/efwBusinessModule.do")
@SessionAttributes(types = EfwBusinessModule.class)
public class EfwBusinessModuleController {
	/**
	 * 业务模块Service.
	 */
	@Autowired
	private EfwBusinessModuleService efwBusinessModuleService;
	/**
	 * 重定向至查询页面.
	 */
	private static final String REDIRECTQUERYPATH = "redirect:efwBusinessModule.do?actionMethod=query";

	/**
	 * 业务模块分页查询方法.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @param request
	 *            请求对象
	 * @return 返回到业务模块列表页面
	 */
	@RequestMapping(params = "actionMethod=query")
	public String query(final Model model, final HttpServletRequest request) {
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(
				request, EfwBusinessModule.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("pageBean", efwBusinessModuleService.getPageBean(
				pageBean, paramterList));
		return "frame/authority/businessModule/business_list.jsp";

	}

	/**
	 * 跳转到业务模块新增页面.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @return 返回到数据权限添加页面
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
	public String add(final Model model) {
		// 创建业务模块对象
		model.addAttribute(new EfwBusinessModule());
		// model.addAttribute("parentList",
		// sourceService.getAllSourceDataAsTree());
		return "frame/authority/businessModule/business_edit.jsp";
	}

	/**
	 * 业务模块添加.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @param businessModule
	 *            业务模型对象
	 * @param result
	 *            校验结果对象
	 * @param status
	 *            session状态
	 * @return 返回到新增页面
	 * @throws IOException
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
	public String processAdd(final Model model,
			@ModelAttribute final EfwBusinessModule businessModule,
			final BindingResult result, final SessionStatus status){
		return this.processEdit(model, businessModule, result, status);
	}

	/**
	 * 编辑.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @param id
	 *            实体对象
	 * @return 返回至数据权限修改页面
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
	public String edit(@RequestParam("queryId") final Long id, final Model model) {
		model.addAttribute(efwBusinessModuleService.getObjectById(
				EfwBusinessModule.class, id));
		// model.addAttribute("parentList",
		// sourceService.getAllSourceDataAsTree());
		return "frame/authority/businessModule/business_edit.jsp";
	}

	/**
	 * 保存.
	 *
	 * @param model
	 *            SpringMVC中Model的对象
	 * @param businessModule
	 *            业务模块对象
	 * @param result
	 *            校验结果对象
	 * @param status
	 *            session状态
	 * @return 当添加或者修改数据权限不成功时跳回到添加或者修改的页面，当添加成功时返回到数据权限的浏览页面
	 * @throws IOException
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEdit(final Model model,
			@ModelAttribute final EfwBusinessModule businessModule,
			final BindingResult result, final SessionStatus status){
		validate(businessModule, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,"efwBusinessModuleForm"));
		}
		if (efwBusinessModuleService
				.saveOrUpdateEfwBusinessModule(businessModule)) {
			status.setComplete();
		} else {
			result.rejectValue("name", "error.check.duplicate",
					new Object[] { businessModule.getName() }, "该名称已经存在！");
			return Util.printErrorString(Util.getErrorMsgInfo(result,"efwBusinessModuleForm"));
		}
		return REDIRECTQUERYPATH;
	}

	/**
	 * 数据权限删除.
	 *
	 * @param ids
	 *            被删除的ID数组
	 * @return 删除成功返回值数据权限浏览页面
	 * @throws Exception
	 *             抛出异常
	 */

	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") final Long[] ids) throws Exception {
		List<EfwBusinessModule> datasList = efwBusinessModuleService
				.findDatasByIds(EfwBusinessModule.class, ids);
		if (datasList != null && datasList.size() > 0) {
			efwBusinessModuleService.deleteAll(datasList);
		}
		return REDIRECTQUERYPATH;
	}

	/**
	 * 添加业务模块的校验.
	 *
	 * @param businessModule
	 *            业务模块EfwBusinessModule的对象
	 * @param errors
	 *            错误信息
	 */
	public static void validate(final EfwBusinessModule businessModule,
			final Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(businessModule.getTitle())) {
			errors.rejectValue("title", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(businessModule.getName())) {
			errors.rejectValue("name", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(businessModule.getMenuIds())) {
			errors.rejectValue("menuIds", "required", "required");
		}

		ValidateFieldLength.validateMaxLength(errors, "name", 128,
				"maxLimitLength", "Enter overflow.");
		ValidateFieldLength.validateMaxLength(errors, "menuIds", 500,
				"maxLimitLength", "Enter overflow.");
		ValidateFieldLength.validateMaxLength(errors, "title", 100,
				"maxLimitLength", "Enter overflow.");

	}

}
