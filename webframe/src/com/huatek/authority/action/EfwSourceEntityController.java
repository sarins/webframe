package com.huatek.authority.action;

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

import com.huatek.authority.entity.EfwSourceEntity;
import com.huatek.authority.service.EfwSourceEntityService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.validate.ValidateFieldLength;


/**
 * 实体权限controller.
 *
 * @author winner pan
 *
 */
@Controller
@RequestMapping("/sourseEntity.do")
@SessionAttributes(types = EfwSourceEntity.class)
public class EfwSourceEntityController {
	/***
	 * comments.
	 */
	@Autowired
	private EfwSourceEntityService efwSourseEntityService;



	/**
	 * 跳转至框架页面并指定了中间内容页面的请求路径.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @return 返回框架页面
	 */
	@RequestMapping(params = "actionMethod=init", method = RequestMethod.GET)
	public String init(final Model model) {
		// 指定内容区域页面请求路径
		model.addAttribute("initPage", "sourseEntity.do?actionMethod=query");
		// 返回至框架页面
		return "正在加载.....";
	}

	/**
	 * 查询初始方法.
	 *
	 * @param model
	 *            对象
	 * @param request
	 *            httpRequest
	 * @return 跳转到列表页面
	 */
	@RequestMapping(params = "actionMethod=query")
	public String query(final Model model, final HttpServletRequest request) {
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(request, EfwSourceEntity.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		//model.addAttribute("queryParams", paramterList);
		model.addAttribute("pageBean", efwSourseEntityService.getEfwSourseEntityPageBean(pageBean, paramterList));
		return "frame/authority/sourceentity/source_entity_list.jsp";
	}

	/**
	 *新增方法.
	 *
	 * @param model
	 *            对象
	 * @param efwSourceEntityId
	 *            实体对象
	 * @return 跳转到新增初始数据方法
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
	public String add(final Model model, final Long efwSourceEntityId) {
		model.addAttribute(new EfwSourceEntity());
		return getInitDataPage(model, efwSourceEntityId);
	}

	/**
	 * 编辑初始数据方法.
	 *
	 * @param model
	 *            对象
	 * @param efwSourceEntityId
	 *            实体对象id
	 * @return 跳转到编辑页面
	 */
	private String getInitDataPage(final Model model, final Long efwSourceEntityId) {
		model.addAttribute("efwSourceEntityId", efwSourceEntityId);
		return "frame/authority/sourceentity/source_entity_edit.jsp";
	}

	/**
	 * 新增提交方法.
	 *
	 * @param model
	 *            对象
	 * @param efwSourceEntity
	 *            实体对象
	 * @param result
	 *            结果
	 * @param status
	 *            状态
	 * @return 跳转到编辑提交方法
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
	public String processAdd(final Model model, @ModelAttribute final EfwSourceEntity efwSourceEntity,
			final BindingResult result, final SessionStatus status) {
		return this.processEdit(model, efwSourceEntity, result, status);
	}

	/**
	 * 编辑初始方法.
	 *
	 * @param id
	 *            传人id参数
     * @param efwSourceEntityId
	 *            实体对象id
	 * @param model
	 *            对象
	 * @return 跳转到初始数据方法
	 */
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
	public String edit(@RequestParam("queryId") final Long id, final Long efwSourceEntityId, final Model model) {
		model.addAttribute(efwSourseEntityService.getEfwSourceEntity(id));
		return getInitDataPage(model, efwSourceEntityId);
	}

	/**
	 * 编辑保存方法.
	 *
	 * @param model
	 *            对象
	 * @param efwSourceEntity
	 *            实体对象
	 * @param result
	 *            结果
	 * @param status
	 *            状态
	 * @return 跳转到查询方法
	 */
	@RequestMapping(params = "actionMethod=edit" , method = RequestMethod.POST)
	public String processEdit(final Model model, @ModelAttribute final EfwSourceEntity efwSourceEntity,
			final BindingResult result, final SessionStatus status) {
		validateDic(efwSourceEntity, result);
		if (result.hasErrors()) {
			return "frame/authority/sourceentity/source_entity_edit.jsp";
		}
		efwSourseEntityService.saveOrUpdateEfwSourceEntity(efwSourceEntity);
		status.setComplete();
		return "redirect:sourseEntity.do?actionMethod=query";
	}

	/**
	 * 删除方法.
	 *
	 * @param ids
	 *            对象
	 * @return 跳转到查询方法
	 */
	@RequestMapping(params = "actionMethod=delete" , method = RequestMethod.POST)
	public String delete(@RequestParam("id") final Long[] ids) {
		List<EfwSourceEntity> objects = efwSourseEntityService
				.findDatasByIds(ids);
		if (objects != null && objects.size() > 0) {
			efwSourseEntityService.deleteAll(objects);
		}
		return "redirect:sourseEntity.do?actionMethod=query";
	}

	/**
	 * 验证方法.
	 *
	 * @param efwSourceEntity
	 *            对象
	 * @param errors
	 *            errors
	 */
	public static void validateDic(final EfwSourceEntity efwSourceEntity, final Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(efwSourceEntity.getEntityName())) {
			errors.rejectValue("entityName", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(efwSourceEntity.getEntityClass())) {
			errors.rejectValue("entityClass", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(efwSourceEntity.getEntityField())) {
			errors.rejectValue("entityField", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(efwSourceEntity.getOutputClass())) {
			errors.rejectValue("outputClass", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(efwSourceEntity.getOutputKey())) {
			errors.rejectValue("outputKey", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(efwSourceEntity.getOutputTitle())) {
			errors.rejectValue("outputTitle", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(efwSourceEntity.getOutputValue())) {
			errors.rejectValue("outputValue", "required", "required");
		}
		ValidateFieldLength.validateMaxLength(errors, "entityName", 60,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "entityClass", 60,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "entityField", 40,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "outputTitle", 60,
				"maxLimitLength", "输入超长。");
		ValidateFieldLength.validateMaxLength(errors, "outputClass", 60,
				"maxLimitLength", "输入超长。");
	}


}
