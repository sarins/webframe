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
import com.huatek.authority.entity.EfwDataRole;
import com.huatek.authority.entity.EfwDataRoleAuthority;
import com.huatek.authority.entity.EfwSourceEntity;
import com.huatek.authority.factory.EntityFactory;
import com.huatek.authority.service.EfwDataRoleService;
import com.huatek.base.entity.BaseEntity;
import com.huatek.dictionary.entity.FwDictionary;
import com.huatek.dictionary.service.DictionaryService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * 数据角色的Controller.
 *
 * @author Winner pan
 */
@Controller
@RequestMapping("/efwDataRole.do")
@SessionAttributes(types = EfwDataRole.class)
public class EfwDataRoleController {

	private static final String BUSINESS_AUTHORITY_JSP = "frame/authority/datarole/business_authority.jsp";
	private static final String DATA_ROLE_EDIT_JSP = "frame/authority/datarole/data_role_edit.jsp";
	private static final String DATA_ROLE_LIST_JSP = "frame/authority/datarole/data_role_list.jsp";
	/**
	 * 数据权限Service.
	 */
	@Autowired
	private EfwDataRoleService efwDataRoleService;
	/**
	 *属性字典管理的service.
	 */
	@Autowired
	private DictionaryService dictionaryService;

	private static final String MODULE_AUTHORITY_PAGE = "frame/authority/module/";

	private static final String ENTITY_AUTHORITY_PAGE = "frame/authority/entitypage/";

	/**
	 * 重定向至查询页面.
	 */
	private static final String REDIRECTQUERYPATH = "redirect:efwDataRole.do?actionMethod=query";



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
				request,EfwDataRole.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		String dataName = request.getParameter("dataName");
		model.addAttribute("queryParams", paramterList);
		model.addAttribute("pageBean", efwDataRoleService.getPageBean(pageBean,
				paramterList,dataName));
		model.addAttribute("dataName", dataName);
		return DATA_ROLE_LIST_JSP;
	}

	/**
	 * 跳转到数据权限新增页面.
	 *
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @return 返回到数据权限添加页面
	 */
	@RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
	public String add(final Model model) {
		// 创建数据权限对象
		model.addAttribute(new EfwDataRole());
		return DATA_ROLE_EDIT_JSP;
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
			@ModelAttribute final EfwDataRole dataRole,
			final BindingResult result, final SessionStatus status) {
		return this.processEdit(model, dataRole, result, status);
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
	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
	public String edit(@RequestParam("queryId") final Long id, final Model model) {
		model.addAttribute(efwDataRoleService.getObjectById(EfwDataRole.class,
				id));
		return DATA_ROLE_EDIT_JSP;
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
			@ModelAttribute final EfwDataRole dataRole,
			final BindingResult result, final SessionStatus status) {
		validate(dataRole, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result, "efwUserDataRoleForm"));
		}
		if (efwDataRoleService.saveOrUpdateEfwDataRole(dataRole)) {
			status.setComplete();
		} else {
			result.rejectValue("daName", "error.check.duplicate",
					new Object[] { dataRole.getDaName() }, "该名称已经存在！");
			return Util.printErrorString(Util.getErrorMsgInfo(result, "efwUserDataRoleForm"));
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
		List<EfwDataRole> datasList = efwDataRoleService.findDatasByIds(
				EfwDataRole.class, ids);
		if (datasList != null && datasList.size() > 0) {
			efwDataRoleService.deleteAll(datasList);
		}
		return REDIRECTQUERYPATH;
	}

	/**
	 * 生效/失效.
	 *
	 * @param ids
	 *            渠道ID
	 * @param statuss
	 *            状态
	 * @return 跳转到查询页面
	 * @throws Exception 抛出异常.
	 */
	@RequestMapping(params = "actionMethod=condition", method = RequestMethod.POST)
	public String condition(@RequestParam("id") final Long[] ids,
			final String statuss) throws Exception {
		efwDataRoleService.conditionAll(ids, statuss);
		return REDIRECTQUERYPATH;
	}

	/**
	 * 添加数据权限的校验.
	 *
	 * @param dataRole
	 *            数据权限EfwDataAuthority的对象
	 * @param errors
	 *            错误信息
	 */
	public static void validate(final EfwDataRole dataRole, final Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(dataRole.getDaName())) {
			errors.rejectValue("daName", "required", "required");
		}

		ValidateFieldLength.validateMaxLength(errors, "daName", 128,
				"maxLimitLength", "Enter overflow.");
		ValidateFieldLength.validateMaxLength(errors, "description", 500,
				"maxLimitLength", "Enter overflow.");

	}

	/****
	 * 初始化数据角色的数据分配界面.
	 *
	 * @param dataRoleId
	 *            数据角色Id
	 * @param model Spring Model
	 * @return 数据角色的权限分配界面.
	 */

	@RequestMapping(params = "actionMethod=assign")
	public String initAssign(final Model model,
			@RequestParam("id") final Long dataRoleId) {
		// 获取数据角色
		model.addAttribute(efwDataRoleService.getObjectById(EfwDataRole.class,dataRoleId));
		// 获取业务模块列表
		model.addAttribute("businessModuleList", efwDataRoleService.getAllEfwBusinessModule());
		model.addAttribute("Menu",this.getSubMenu());
		return BUSINESS_AUTHORITY_JSP;
	}

	/****
	 * 获取模块权限.
	 * @param businessModuleId  业务模块ID.
	 * @return 返回业务模块的数据权限设定界面.
	 */
	@RequestMapping(params = "actionMethod=getModuleAuthority")
	public String getModuleAuthority(final Model model,
			@RequestParam("businessModuleId") final Long businessModuleId) {
		// 获取业务模块的数据权限页面
		EfwBusinessModule module = (EfwBusinessModule) efwDataRoleService
				.getObjectById(EfwBusinessModule.class, businessModuleId);
		model.addAttribute("businessModuleId", businessModuleId);
		model.addAttribute("efwBusinessModuleMapList", module
				.getEfwBusinessModuleMapSet());
		return MODULE_AUTHORITY_PAGE + "module_authority.jsp";// module.getPageName();
	}

	/***
	 * 获取某个数据实体的数据,然后展示数据供选择.
	 *
	 * @param dataEntity
	 *            数据实体
	 * @param dataRoleId
	 *            数据角色ID
	 * @param businessModuleId
	 *            当前的业务模块ID
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=queryDataEntity")
	public String queryDataEntity(final Model model,
			final HttpServletRequest request,
			final Long dataRoleId, final Long businessModuleId,
			final Long entityId) {
		//获取EfwSourceEntity数据
		EfwSourceEntity efwSourceEntity = (EfwSourceEntity)efwDataRoleService.getObjectById(EfwSourceEntity.class, entityId);
		Class queryEntityClass = EntityFactory.getAuthorityClass(efwSourceEntity.getOutputClass());

		List<CommonBean> paramterList = QueryCondition.getQueryCondition(request,queryEntityClass);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		if (CommonUtil.isZeroLengthTrimString(request.getParameter("pageSize"))) {
			pageBean.setPageSize(8);
		}
		boolean queryChecked = false;
		if (CommonUtil.isNotZeroLengthTrimString(request.getParameter("queryChecked"))) {
			queryChecked = true;
		}
		model.addAttribute("dataRoleId", dataRoleId);
		model.addAttribute("queryChecked", queryChecked);
		model.addAttribute("entityId", entityId);
		model.addAttribute("businessModuleId", businessModuleId);
		// model.addAttribute("queryParams", paramterList);

		model.addAttribute("queryValue",request.getParameter("ht_t."+efwSourceEntity.getOutputKey()));
		model.addAttribute("efwSourceEntity", efwSourceEntity);

		pageBean = efwDataRoleService.getModulePageBean(pageBean, paramterList,
				efwSourceEntity, queryChecked, new String[] {entityId.toString(), businessModuleId.toString(),
						dataRoleId.toString() });
		// 获取业务模块的数据权限
		// 设置该数据为已选择
		if (pageBean.getDataList() != null) {
			List<EfwDataRoleAuthority> efwDataRoleAuthorityList = efwDataRoleService
					.getEfwDataRoleAuthorityList(dataRoleId, businessModuleId,
							entityId);
			for (EfwDataRoleAuthority efwDataRoleAuthority : efwDataRoleAuthorityList) {
				for (int i = 0; i < pageBean.getDataList().size(); i++) {
					BaseEntity entity = (BaseEntity) pageBean.getDataList()
							.get(i);
					if (entity.getId().toString().equals(
							efwDataRoleAuthority.getDataId())) {
						entity.setChecked(true);
					}
				}
			}
		}
		/*if(dataEntity.equals("GoodsCategory")){
			model.addAttribute("categoriesList", categoryService.getFirstCategory());
		}*/
		model.addAttribute("pageBean", pageBean);
		return ENTITY_AUTHORITY_PAGE + "entity_data.jsp";
	}

	@RequestMapping(params = "actionMethod=getFieldDataAuthority")
	public String getFieldDataAuthority(final Model model,final Long dataRoleId,
			final Long businessModuleId, final Long entityId, final String categoryCode) {
		List<FwDictionary> fwDictionaryList = dictionaryService.loadCategoryDictionary(categoryCode);
		List<EfwDataRoleAuthority> efwDataRoleAuthorityList = efwDataRoleService
				.getEfwDataRoleAuthorityList(dataRoleId, businessModuleId,
						entityId);

			for (FwDictionary paramValue : fwDictionaryList) {
				boolean isCheck = false;
				for (EfwDataRoleAuthority efwDataRoleAuthority : efwDataRoleAuthorityList) {
					if (paramValue.getCode().equals(efwDataRoleAuthority.getDataId())) {
						paramValue.setChecked(true);
						isCheck = true;
					}
				}
				if(!isCheck){
					paramValue.setChecked(false);
				}
		}
		model.addAttribute("moduleMap", efwDataRoleService.getEfwBusinessModuleMap(businessModuleId, entityId));
		model.addAttribute("fieldValueList", fwDictionaryList);
		if(fwDictionaryList.size()>0){
			model.addAttribute("dataComment", fwDictionaryList.get(0).getFwCategory().getName());
		}else{
			model.addAttribute("dataComment", "字典:"+categoryCode+"没有数据");
		}
		model.addAttribute("entityId", entityId);
		model.addAttribute("businessModuleId", businessModuleId);
		return ENTITY_AUTHORITY_PAGE + "dictionary_data.jsp";
	}

	/**
	 * 设置数据角色的数据权限
	 *
	 * @param response
	 *            HTTP响应对象
	 * @param dataRoleId
	 *            数据角色ID
	 * @param businessModuleId
	 *            业务模块ID
	 * @param entityName
	 *            实体名称
	 * @param fieldName
	 *            实体字段
	 * @param fieldValue
	 *            字段值
	 * @param dataId
	 *            实体ID
	 * @param checked
	 *            是否选择
	 * @throws IOException
	 */
	@RequestMapping(params = "actionMethod=assignDataAuthority")
	public String assignDataAuthority(final HttpServletRequest request,
			final Long dataRoleId, final Long businessModuleId,
			final Long entityId, final String fieldValue, final String dataId,
			final boolean checked) throws IOException {
		efwDataRoleService.assignModuleData(dataRoleId, dataId,
				businessModuleId, entityId, fieldValue, checked);
		return Util.printString("{\"success\"=\"1\"}");
	}

	private String getSubMenu(){
		StringBuffer menuStr = new StringBuffer("");
		List<EfwBusinessModule> efwBusinessModuleList = efwDataRoleService.getUefwDataRoleService();
		String lastFirstMenu = "";

		for(EfwBusinessModule efwBusinessModule:efwBusinessModuleList){
			if(lastFirstMenu.equals(efwBusinessModule.getTitle())){
				menuStr.append("<li><a href=\"#\" onclick=\"getAppearPart("+efwBusinessModule.getId()+");\">·"+efwBusinessModule.getName()+"</a></li>\n");
			}else{
				if(lastFirstMenu.length()>0){
					menuStr.append("</ul></li></ul>");
				}
				lastFirstMenu = efwBusinessModule.getTitle();
				menuStr.append("<ul class=\"leftMenu\"><li class=\"firstMenu\"><a href=\"javascript:;\">").append(lastFirstMenu).append("</a>\n");
				menuStr.append("<ul class=\"subMenu\">\n");
				menuStr.append("<li><a href=\"#\" onclick=\"getAppearPart("+efwBusinessModule.getId()+");\">·"+efwBusinessModule.getName()+"</a></li>\n");
			}
			if(efwBusinessModule == efwBusinessModuleList.get(efwBusinessModuleList.size() - 1)){
				menuStr.append("</ul></li></ul>");
			}
		}
		//menuStr.append("</div>");
		return menuStr.toString();
	}


	@RequestMapping(params = "actionMethod=viewDataRole", method = RequestMethod.POST)
	public String viewDataRole(@RequestParam("id") final Long id,final Model model) throws Exception {
		model.addAttribute("efwDataRole",efwDataRoleService.getObjectById(EfwDataRole.class, id));
		List<EfwDataRoleAuthority> efwDataRoleAuthorityList = null;//efwDataRoleService.viewDataRole(id);
		model.addAttribute("efwDataRoleAuthorityList",efwDataRoleAuthorityList);
		return "frame/authority/datarole/data_Role_view.jsp";
	}
}
