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

import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.service.AccountService;
import com.huatek.framework.service.GroupService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

@Controller
@RequestMapping("/groupController.do")
@SessionAttributes(types = FwGroup.class)
public class GroupController {
	@Autowired
	private GroupService groupService;
	@Autowired
	private AccountService accountService;
	@RequestMapping(params = "actionMethod=add",method = RequestMethod.GET)
	public String add(Model model){
		model.addAttribute(new FwGroup());
		return getInitDataPage(model,null);
	}
	private String getInitDataPage(Model model,Long groupId){
		model.addAttribute("managerList", accountService.getAvailableAccount());
		model.addAttribute("groupList", groupService.getGroupParents(groupId));
		return "frame/group/group_edit.jsp";
	}
	@RequestMapping(params = "actionMethod=add",method = RequestMethod.POST)
	public String processAdd(Model model,@ModelAttribute FwGroup group, BindingResult result, SessionStatus status) {
		return this.processEdit(model,group, result, status);
	}
	@RequestMapping(params = "actionMethod=edit",method = RequestMethod.GET)
	public String edit(@RequestParam("queryId") Long id,Model model){
		model.addAttribute(groupService.getGroupById(id));
		return getInitDataPage(model,id);
	}
	@RequestMapping(params = "actionMethod=edit",method = RequestMethod.POST)
	public String processEdit(Model model,@ModelAttribute FwGroup group, BindingResult result, SessionStatus status){
		validate(group, result);
		if(result.hasErrors()){
			return Util.printErrorString(Util.getErrorMsgInfo(result, "groupForm"));
		}
		if(groupService.saveGroup(group)){
				status.setComplete();
		}else{
			result.rejectValue("name", "duplicate",new Object[]{group.getName()},"The group is existed");
			return Util.printErrorString(Util.getErrorMsgInfo(result, "groupForm"));
		}
		return "redirect:groupController.do?actionMethod=query";
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(params = "actionMethod=delete",method = RequestMethod.POST)
	public String delete(@RequestParam("id") Long[] ids){
		List<FwGroup> groups = groupService.findDatasByIds(FwGroup.class, ids);
		if(groups!=null&&groups.size()>0){
				groupService.deleteAll(groups);
		}

		return "redirect:groupController.do?actionMethod=query";
	}
	@RequestMapping(params = "actionMethod=query")
	public String query(Model model, HttpServletRequest request) {
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(request, FwGroup.class);
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("queryParams",paramterList);
		model.addAttribute("pageBean", groupService.getGroupPageBean(pageBean, paramterList));
		return "frame/group/group_list.jsp";
	}
	@InitBinder
	protected void initBinder(WebDataBinder dataBinder) {
		dataBinder.registerCustomEditor(FwGroup.class, "parent", new BaseEntityEditor(FwGroup.class));
	}

	public static void validate(FwGroup group, Errors errors) {
		if (CommonUtil.isZeroLengthTrimString(group.getName())) {
			errors.rejectValue("name", "required", "required");
		}

		if (group.getParent()==null) {
			errors.rejectValue("parent", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(group.getStatus())) {
			errors.rejectValue("status", "required", "required");
		}
		if (CommonUtil.isZeroLengthTrimString(group.getGroupType())) {
            errors.rejectValue("groupType", "required", "required");
        }
		ValidateFieldLength.validateMaxLength(errors, "name", 120, "maxLimitLength", "Enter overflow.");
		ValidateFieldLength.validateMaxLength(errors, "describe", 200, "maxLimitLength", "Enter overflow.");
	}


}
