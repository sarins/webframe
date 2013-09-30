package com.huatek.authority.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huatek.authority.entity.EfwDataRole;
import com.huatek.authority.entity.EfwUserDataAuthority;
import com.huatek.authority.service.EfwUserDataRoleService;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.service.AccountService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * 目标字段的Controller.
 *
 * @author Talor Yang
 */
@Controller
@RequestMapping("/userDataRole.do")
@SessionAttributes(types = EfwDataRole.class)
public class DataRoleAction {

	/**
	 * 目标字段Service.
	 */
	@Autowired
	public EfwUserDataRoleService efwUserDataRoleService;
	@Autowired
	private AccountService accountService;


	/**
	 *
	 * 重定向至查询页面.
	 */
	private static final String REDIRECTQUERYPATH = "redirect:userDataRole.do?actionMethod=query";

	/**
	 *initBinder方法.
	 *
	 * @param dataBinder
	 *            dataBinder
	 */
	@InitBinder
	protected void initBinder(final WebDataBinder dataBinder) {
		dataBinder.registerCustomEditor(EfwDataRole.class, "efwDataRole",
				new BaseEntityEditor(EfwDataRole.class));
		dataBinder.registerCustomEditor(FwAccount.class, "FwAccount",
				new BaseEntityEditor(FwAccount.class));
	}

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
				request, FwAccount.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("pageBean", efwUserDataRoleService.getPageBean(
				pageBean, paramterList));
		return "frame/authority/datarole/data_role.jsp";
	}


	/****
	 * 初始化数据角色的数据分配界面.
	 *
	 * @param dataRoleId
	 *            数据角色Id
	 * @param model
	 *            Spring Model
	 * @return 数据角色的权限分配界面.
	 */

	@RequestMapping(params = "actionMethod=assign", method = RequestMethod.GET)
	public String initAssign(final Model model,
			@RequestParam("id") final Long acctId) {
		// 获取数据角色
		FwAccount account=accountService.getAccountById(acctId);
		model.addAttribute("account", account);
		model.addAttribute("efwUserDataList", efwUserDataRoleService
				.getAllDataRolesList());
		model.addAttribute("allUserDataList", efwUserDataRoleService
				.findDatas(acctId));
		return "frame/authority/datarole/user_data_assign.jsp";
	}

	 @RequestMapping(params = "actionMethod=assign", method = RequestMethod.POST)
	    public String initAssignPost(final Model model, @RequestParam(value = "id") final Long acctId,
	                                 @RequestParam(value = "boxId", required = false) String boxIdssParam) {
	        String[] boxIds = null;
	        Long boxId[] = null;
	        if (null != boxIdssParam && (!boxIdssParam.equals(""))) {
	            String boxIdss = boxIdssParam;
	        	if (boxIdssParam.endsWith(";")) {
	                boxIdss = boxIdssParam.substring(0, boxIdssParam.length() - 1);
	            }
	            if (boxIdss.indexOf(";") > -1) {
	                boxIds = boxIdss.split(";");
	            } else {
	                boxIds = new String[] { boxIdss };
	            }
	            boxId = new Long[boxIds.length];
	            for (int i = 0; i < boxIds.length; i++) {
	                boxId[i] = Long.valueOf(boxIds[0]);
	            }
	        }
	        if (null == boxIdssParam || boxIdssParam.length() == 0) {
	            efwUserDataRoleService.deleteAll(efwUserDataRoleService.getObjectByAccountId(acctId));
	        } else {
	            efwUserDataRoleService.deleteAll(efwUserDataRoleService.getObjectByAccountId(acctId));
	            for (Long ids : boxId) {
	                EfwUserDataAuthority userDataAuthority = new EfwUserDataAuthority();
	                FwAccount fw = new FwAccount();
	                fw.setId(acctId);
	                EfwDataRole role = new EfwDataRole();
	                role.setId(ids);
	                userDataAuthority.setFwAccount(fw);
	                userDataAuthority.setEfwDataRole(role);
	                efwUserDataRoleService.saveOrUpdateDatas(userDataAuthority);
	            }
	        }
	        return "redirect:user.do?actionMethod=query";
	    }

	/**
	 * 添加数据权限的校验.
	 *
	 * @param dataRole
	 *            数据权限EfwDataAuthority的对象
	 * @param errors
	 *            错误信息
	 */
	public static void validate(final EfwUserDataAuthority dataRole,
			final Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(dataRole.getFwAccount()
				.getUserName())) {
			errors.rejectValue("mapName", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(dataRole.getFwAccount()
				.getAcctName())) {
			errors.rejectValue("targetClass", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(dataRole.getEfwDataRole()
				.getDaName())) {
			errors.rejectValue("targetField", "required", "required");
		}
		ValidateFieldLength.validateMaxLength(errors, "acctName", 40,
				"maxLimitLength", "Enter overflow.");
		ValidateFieldLength.validateMaxLength(errors, "userName", 120,
				"maxLimitLength", "Enter overflow.");
		ValidateFieldLength.validateMaxLength(errors, "daName", 128,
				"maxLimitLength", "Enter overflow.");
	}

	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") Long[] ids) {
		List<FwAccount> objects = efwUserDataRoleService
				.findAccountsByIds(ids);
		if (objects != null && objects.size() > 0) {
			efwUserDataRoleService.deleteAll(objects);
		}
		return REDIRECTQUERYPATH;
	}

}
