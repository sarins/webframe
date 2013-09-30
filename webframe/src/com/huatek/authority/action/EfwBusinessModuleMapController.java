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
import com.huatek.authority.entity.EfwBusinessModule;
import com.huatek.authority.entity.EfwBusinessModuleMap;
import com.huatek.authority.entity.EfwSourceEntity;
import com.huatek.authority.service.EfwBusinessModuleMapService;
import com.huatek.authority.service.EfwBusinessModuleService;
import com.huatek.authority.service.EfwSourceEntityService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * 数据业务权限的Controller.
 *
 * @author Apple Liu
 */
@Controller
@RequestMapping("/efwBusinessModuleMap.do")
@SessionAttributes(types = EfwBusinessModuleMap.class)
public class EfwBusinessModuleMapController {

	/**
	 * 业务模块权限Service.
	 */
	@Autowired
	private EfwBusinessModuleMapService efwBusinessModuleMapService;

	/**
	 * 业务模块Service.
	 */
	@Autowired
	private EfwBusinessModuleService efwBusinessModuleService;

	/**
	 * 权限实体Service.
	 */
	@Autowired
	private EfwSourceEntityService efwSourceEntityService;

	private static final String BUSINESSMAPLIST = "frame/authority/businessModuleMap/businessMap_list.jsp";

	private static final String BUSINESSMAPEDIT = "frame/authority/businessModuleMap/businessMap_edit.jsp";

	/**
	 * 重定向至查询页面.
	 */
	private static final String REDIRECTQUERYPATH = "redirect:efwBusinessModuleMap.do?actionMethod=query";

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
	public String query(final Model model, final HttpServletRequest request) {
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(
				request , EfwBusinessModuleMap.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("pageBean", efwBusinessModuleMapService.getPageBean(
				pageBean, paramterList));
		return BUSINESSMAPLIST;
	}

	/**
	 * 跳转到业务模块权限新增页面.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @return 返回到业务模块权限添加页面
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
	public String add(final Model model) {
		// 创建业务模块对象
		model.addAttribute(new EfwBusinessModuleMap());
		// 初始化业务模块数据和权限实体数据
		model.addAttribute("baseBusinessModuleList", efwBusinessModuleService
				.getAllBusinessData());
		model.addAttribute("sourceEntityList", efwSourceEntityService
				.getAllBusinessData());
		return BUSINESSMAPEDIT;
	}

	/**
	 * 业务模块权限添加.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @param businessModuleMap
	 *            被添加的业务模块
	 * @param result
	 *            校验结果对象
	 * @param status
	 *            session状态
	 * @return 返回到新增页面
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
	public String processAdd(final Model model,
			@ModelAttribute final EfwBusinessModuleMap businessModuleMap,
			final BindingResult result, final SessionStatus status) {

		return this.processEdit(model, businessModuleMap, result, status);
	}

	// Convert String to related Object
	@InitBinder
	protected void initBinder(WebDataBinder dataBinder) {
		dataBinder.registerCustomEditor(EfwBusinessModule.class,
				"efwBusinessModule", new BaseEntityEditor(
						EfwBusinessModule.class));
		dataBinder.registerCustomEditor(EfwSourceEntity.class,
				"efwSourceEntity", new BaseEntityEditor(EfwSourceEntity.class));
	}

	/**
	 * 编辑.
	 *
	 * @param id
	 *            业务模型权限的Id
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @return 返回至数据权限修改页面
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
	public String edit(@RequestParam("queryId") final Long id, final Model model) {
		model.addAttribute(efwBusinessModuleMapService.getObjectById(
				EfwBusinessModuleMap.class, id));
		// 初始化业务模块数据和权限实体数据
		model.addAttribute("baseBusinessModuleList", efwBusinessModuleService
				.getAllBusinessData());
		model.addAttribute("sourceEntityList", efwSourceEntityService
				.getAllBusinessData());
		return BUSINESSMAPEDIT;
	}

	/**
	 * 保存.
	 *
	 * @param model
	 *            SpringMVC中Model的对象
	 * @param businessModuleMap
	 *            被添加或者修改的业务模块对象
	 * @param result
	 *            校验结果对象
	 * @param status
	 *            session状态
	 * @return 当添加或者修改数据权限不成功时跳回到添加或者修改的页面，当添加成功时返回到数据权限的浏览页面
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEdit(final Model model,
			@ModelAttribute final EfwBusinessModuleMap businessModuleMap,
			final BindingResult result, final SessionStatus status) {
		validate(businessModuleMap, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result,"efwBusinessModuleMapForm"));
		}
		if (efwBusinessModuleMapService
				.saveOrUpdateEfwBusinessModuleMap(businessModuleMap)) {
			status.setComplete();
		} else {
			result.rejectValue("name", "error.check.duplicate",
					new Object[] { businessModuleMap.getName() }, "该名称已经存在！");
			return Util.printErrorString(Util.getErrorMsgInfo(result,"efwBusinessModuleMapForm"));
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
		List<EfwBusinessModuleMap> datasList = efwBusinessModuleMapService
				.findDatasByIds(EfwBusinessModuleMap.class, ids);
		if (datasList != null && datasList.size() > 0) {
			efwBusinessModuleMapService.deleteAll(datasList);
		}
		return REDIRECTQUERYPATH;
	}

	/**
	 * 添加数据权限的校验.
	 *
	 * @param dataRole
	 *            数据权限EfwBusinessModuleMap的对象
	 * @param errors
	 *            错误信息
	 */
	public static void validate(final EfwBusinessModuleMap businessModuleMap,
			final Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(businessModuleMap.getName())) {
			errors.rejectValue("name", "required", "required");
		}
		if(businessModuleMap.getEfwBusinessModule()== null || businessModuleMap.getEfwBusinessModule().getId() == null ){
			errors.rejectValue("efwBusinessModule", "required", "required");
		}
		if(businessModuleMap.getEfwSourceEntity() == null || businessModuleMap.getEfwSourceEntity().getId()== null){
			errors.rejectValue("efwSourceEntity", "required", "required");
		}
		ValidateFieldLength.validateMaxLength(errors, "name", 30,
				"maxLimitLength", "Enter overflow.");

	}

}
