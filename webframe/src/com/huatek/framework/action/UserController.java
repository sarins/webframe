package com.huatek.framework.action;

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

import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.service.AccountService;
import com.huatek.framework.service.GroupService;
import com.huatek.framework.service.RoleService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

@Controller
@RequestMapping("/user.do")
@SessionAttributes(types = FwAccount.class)
public class UserController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private GroupService groupService;

	@RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
	public String add(Model model) {
		model.addAttribute(new FwAccount());
		return getInitData(model);
	}

	public String getInitData(final Model model){
	    model.addAttribute("groupList", groupService.getFilterGroupList());
        return "frame/account/acct_edit.jsp";
	}

	@RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
	public String processAdd(final Model model,@ModelAttribute FwAccount account,
			BindingResult result, SessionStatus status) {
		return this.processEditUser(model,account, result, status);
	}

	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
	public String edit(@RequestParam("queryId") Long id, Model model) {
		model.addAttribute(accountService.getAccountById(id));
		return getInitData(model);
	}

	@RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
	public String processEditUser(final Model model,@ModelAttribute FwAccount account,
			BindingResult result, SessionStatus status) {
		validate(account, result);
		if (result.hasErrors()) {
			return Util.printErrorString(Util.getErrorMsgInfo(result, "userForm"));
		}
		accountService.saveAccount(account);
		status.setComplete();
		return "redirect:user.do?actionMethod=query";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") Long[] ids) throws Exception {
		List<FwAccount> accounts = accountService.findDatasByIds(
				FwAccount.class, ids);
		if (accounts != null && accounts.size() > 0) {
			accountService.deleteAll(accounts);
		}
		return "redirect:user.do?actionMethod=query";
	}

	@RequestMapping(params = "actionMethod=query")
	public String query(Model model, HttpServletRequest request) {
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(
				request, FwAccount.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("queryParams", paramterList);
		model.addAttribute("pageBean", accountService.getAccountPageBean(
				pageBean, paramterList));
		return "frame/account/acct_list.jsp";
	}

	@RequestMapping(params = "actionMethod=assign", method = RequestMethod.GET)
    public String assignDuty(@RequestParam("id") Long id, Model model) {
        model.addAttribute("account", accountService.getAccountById(id));
        model.addAttribute("dutyList", roleService.getAvailableRoles());
        return "frame/account/dutychoose.jsp";
    }

    @RequestMapping(params = "actionMethod=assign", method = RequestMethod.POST)
    public String processAssignGroup(@RequestParam("accountId") Long accountId,
            @RequestParam(value = "dutyId", required = false) Long[] dutyId) {
        if (null == dutyId || dutyId.length == 0) {
            accountService.deleteAccount(accountId,dutyId);
            return "redirect:user.do?actionMethod=query";
        } else {
            accountService.processAssignDuty(accountId, dutyId);
            return "redirect:user.do?actionMethod=query";
        }
    }

	public static void validate(FwAccount account, Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(account.getAcctName())) {
			errors.rejectValue("acctName", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(account.getUserName())) {
			errors.rejectValue("userName", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(account.getUserName())) {
			errors.rejectValue("userName", "required", "required");
		}
		if (account.getFwGroup()==null) {
			errors.rejectValue("fwGroup", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(account.getPosition())) {
			errors.rejectValue("position", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(account.getStatus())) {
			errors.rejectValue("status", "required", "required");
		}
		ValidateFieldLength.validateMaxLength(errors, "acctName", 20,
				"maxLimitLength", "Enter overflow.");
		ValidateFieldLength.validateMaxLength(errors, "userName", 100,
				"maxLimitLength", "Enter overflow.");
		ValidateFieldLength.validateMaxLength(errors, "describe", 200,
				"maxLimitLength", "Enter overflow.");
	}

	   /**
     *initBinder方法.
     *
     * @param dataBinder
     *            dataBinder
     */
    @InitBinder
    protected void initBinder(final WebDataBinder dataBinder) {
        dataBinder.registerCustomEditor(FwGroup.class, "fwGroup",
                new BaseEntityEditor(FwGroup.class));
    }
}
