package com.huatek.authority.action;

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

import com.huatek.authority.entity.EfwApplyScope;
import com.huatek.authority.entity.EfwBusinessModuleMap;
import com.huatek.authority.service.EfwApplyScopeService;
import com.huatek.authority.service.EfwBusinessModuleMapService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * 目标字段的Controller.
 *
 * @author winner pan
 */
@Controller
@RequestMapping("/applyScope.do")
@SessionAttributes(types = EfwApplyScope.class)
public class EfwApplyScopeController {

	/**
	 * 应用范围Service.
	 */
	@Autowired
	public EfwApplyScopeService efwApplyScopeService;

	/**
	 * 业务模块权限Service.
	 */
	@Autowired
	private EfwBusinessModuleMapService efwBusinessModuleMapService;


    private static final String  TARGET_FIELD      = "frame/authority/businessModuleMap/apply_scope_list.jsp";

    private static final String  TARGET_EDIT       = "frame/authority/businessModuleMap/apply_scope_edit.jsp";
	/**
	 * 重定向至查询页面.
	 */
	private static final String REDIRECTQUERYPATH = "redirect:applyScope.do?actionMethod=query";


	/**
	 * 数据权限分页查询方法.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @param request
	 *            请求对象
	 * @return 返回到数据权限列表页面
	 */
	@RequestMapping(params = "actionMethod=query")
	public String query(final Model model,@RequestParam("id") Long moduleMapId, final HttpServletRequest request) {
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(
				request, EfwApplyScope.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("efwBusinessModuleMap",efwBusinessModuleMapService.getObjectById(EfwBusinessModuleMap.class, moduleMapId));
		model.addAttribute("queryParams", paramterList);
		model.addAttribute("pageBean", efwApplyScopeService.getPageBean(
				pageBean, paramterList, new Object[]{moduleMapId}));
		return TARGET_FIELD;
	}

	/**
	 * 编辑.
	 *
	 * @param id
	 *            被修改的关联的数据权限的Id
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @return 返回至数据权限修改页面
	 */

	/**
	 * 跳转到数据权限新增页面.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @return 返回到数据权限添加页面
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
	public String add(final Model model, final Long moduleMapId) {
		// 创建数据权限对象
		EfwBusinessModuleMap efwBusinessModuleMap= (EfwBusinessModuleMap)efwBusinessModuleMapService.getObjectById(EfwBusinessModuleMap.class, moduleMapId);
		EfwApplyScope efwApplyScope = new EfwApplyScope();
		efwApplyScope.setEfwBusinessModuleMap(efwBusinessModuleMap);
		model.addAttribute(efwApplyScope);
		return  TARGET_EDIT;
	}
	/**
	 * 数据权限添加.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @param dataRole
	 *            被添加的数据权限
	 * @param result
	 *            校验结果对象
	 * @param status
	 *            session状态
	 * @return 返回到新增页面
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
	public String processAdd(final Model model,
			@ModelAttribute final EfwApplyScope targetField,
			final BindingResult result, final SessionStatus status) {
		return this.processEdit(model, targetField, result, status);
	}
	@RequestMapping(params = "actionMethod=edit",method = RequestMethod.GET)
	public String edit(@RequestParam("queryId") Long id,Model model){
		model.addAttribute(efwApplyScopeService.getObjectById(id));
			return TARGET_EDIT;
		}
	/**
	 * 渠道保存.
	 *
	 * @param model
	 *            SpringMVC中Model的对象
	 * @param dataRole
	 *            被添加或者修改的数据权限对象
	 * @param result
	 *            校验结果对象
	 * @param status
	 *            session状态
	 * @return 当添加或者修改数据权限不成功时跳回到添加或者修改的页面，当添加成功时返回到数据权限的浏览页面
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEdit(final Model model,
			@ModelAttribute final EfwApplyScope efwApplyScope,
			final BindingResult result, final SessionStatus status) {
		validate(efwApplyScope, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result, "efwApplySCopeForm"));
		}
		efwApplyScopeService.saveOrUpdateEfwApplyScope(efwApplyScope);
		status.setComplete();
		return REDIRECTQUERYPATH+"&id="+efwApplyScope.getEfwBusinessModuleMap().getId();
	}

	/**
	 * 添加数据权限的校验.
	 *
	 * @param dataRole
	 *            数据权限EfwDataAuthority的对象
	 * @param errors
	 *            错误信息
	 */
	public static void validate(final EfwApplyScope efwApplyScope, final Errors errors) {

		if (CommonUtil.isZeroLengthTrimString(efwApplyScope.getTargetClass())) {
			errors.rejectValue("targetClass", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(efwApplyScope.getTargetField())) {
			errors.rejectValue("targetField", "required", "required");
		}
		if (efwApplyScope.getEfwBusinessModuleMap()==null) {
			errors.rejectValue("efwBusinessModuleMap", "required", "required");
		}
		if (efwApplyScope.getIsEnabled()==null) {
			errors.rejectValue("isEnabled", "required", "required");
		}
		ValidateFieldLength.validateMaxLength(errors, "targetClass", 60,
				"maxLimitLength", "Enter overflow.");
		ValidateFieldLength.validateMaxLength(errors, "targetField", 120,
				"maxLimitLength", "Enter overflow.");
	}

	@RequestMapping(params = "actionMethod=delete",method = RequestMethod.POST)
	public String delete(@RequestParam("id") Long[] ids,final Long moduleMapId) {
		List<EfwApplyScope> objects = efwApplyScopeService.findDatasByIds(ids);
		if(objects!=null&&objects.size()>0){
			efwApplyScopeService.deleteAll(objects);
		}
		return REDIRECTQUERYPATH+"&id="+moduleMapId;
	}

	   /**
     *initBinder方法.
     *
     * @param dataBinder
     *            dataBinder
     */
    @InitBinder
    protected void initBinder(final WebDataBinder dataBinder) {
        dataBinder.registerCustomEditor(EfwBusinessModuleMap.class, "efwBusinessModuleMap",
                new BaseEntityEditor(EfwBusinessModuleMap.class));
    }

}
