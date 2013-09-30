package com.huatek.framework.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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

import com.huatek.base.tree.JavaScriptEncoder;
import com.huatek.framework.entity.FwDuty;
import com.huatek.framework.entity.FwDutyAction;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.entity.FwSource;
import com.huatek.framework.entity.FwSrcAction;
import com.huatek.framework.entity.FwSystem;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.service.OperationService;
import com.huatek.framework.service.RoleService;
import com.huatek.framework.service.SourceService;
import com.huatek.framework.service.SystemService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

@Controller
@RequestMapping("/role.do")
@SessionAttributes(types = FwDuty.class)
public class RoleController{
    @Autowired
    private RoleService         roleService;
    @Autowired
    private SourceService       sourceService;
    @Autowired
    private SystemService       systemService;
    @Autowired
    private OperationService    operationService;
    /*
     * 分配角色返回菜单
     * */
    private final static String CHOOSE_ACTION = "frame/duty/actionassign.jsp";
    /*
     * 角色查询返回菜单
     * */
    private final static String DUTY_LIST     = "frame/duty/duty_list.jsp";
    /*
     * 初始化返回菜单
    */
    private final static String DUTY_EDIT     = "frame/duty/duty_edit.jsp";

    private String getInitDataPage(Model model) {
        model.addAttribute("systemList", systemService.getAvailableFwSystem());
        return DUTY_EDIT;
    }

    @RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute(new FwDuty());
        return getInitDataPage(model);
    }

    @RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
    public String processAdd(Model model, @ModelAttribute FwDuty duty, BindingResult result,
                             SessionStatus status) {
        return this.processEdit(model, duty, result, status);
    }

    @RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
    public String edit(@RequestParam("queryId") Long id, Model model) {
    	FwDuty duty = (FwDuty)roleService.getRoleById(id);
    	//初始化
    	if(duty!=null){
    		duty.getFwGroup().getName();
    	}
    	model.addAttribute(duty);
        return getInitDataPage(model);
    }

    @RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
    public String processEdit(Model model, @ModelAttribute FwDuty duty, BindingResult result,
                              SessionStatus status) {
        validate(duty, result);
        if (result.hasErrors()) {
            //return getInitDataPage(model);
            return Util.printErrorString(Util.getErrorMsgInfo(result, "dutyForm"));
        }
        roleService.saveRole(duty);
        status.setComplete();
        return "redirect:role.do?actionMethod=query";
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") Long[] ids) {
        List<FwDuty> roles = roleService.findDatasByIds(FwDuty.class, ids);
        if (roles != null && roles.size() > 0) {
            roleService.deleteAll(roles);
        }
        return "redirect:role.do?actionMethod=query";
    }

    @RequestMapping(params = "actionMethod=query")
    public String query(Model model, HttpServletRequest request) {
        List<CommonBean> paramterList = QueryCondition.getQueryCondition(request, FwDuty.class);
        CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
        model.addAttribute("queryParams", paramterList);
        model.addAttribute("pageBean", roleService.getRolePageBean(pageBean, paramterList));
        return DUTY_LIST;
    }

    @InitBinder
    protected void initBinder(WebDataBinder dataBinder) {
        dataBinder.registerCustomEditor(FwSystem.class, "fwSystem", new BaseEntityEditor(
            FwSystem.class));
        /*  DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
            CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
            dataBinder.registerCustomEditor(Date.class, "entryDate", dateEditor);
            dataBinder.registerCustomEditor(Date.class, "approvalDate", dateEditor);
            dataBinder.registerCustomEditor(Date.class, "dimissionDate", dateEditor);*/
    }

    /**
     * 分配角色方法.
     *
     * @param id
     *            角色id
     * @param model
     *            对象
     * @return 跳转到角色分配页面
     */
    @RequestMapping(params = "actionMethod=assignFunction", method = RequestMethod.GET)
    public String assignAction(@RequestParam("id") final Long id,
            final Model model) {
        List<FwSource> menuList = null;
        //List<FwSrcAction> actionList = null;
        List<FwSrcAction> actionList = new ArrayList<FwSrcAction>();
        if (ThreadLocalClient.get().getOperator().getId().longValue() == 1) { // administrator
            menuList = sourceService.getMenuSources();
            actionList = operationService.getAllAction();
        } else {
            menuList = ThreadLocalClient.get().getOperator().permitSourceList;
            Iterator<FwSrcAction> permitActions = ThreadLocalClient.get().getOperator().getPermitActionMap().values().iterator();
            while (permitActions.hasNext()) {
            	FwSrcAction action = permitActions.next();
            	if(!actionList.contains(action)){
            		actionList.add(action);
                }
            }
        }
        FwDuty duty = roleService.getRoleById(id);
        model.addAttribute("duty", duty);
        StringBuffer authorityBuffer = new StringBuffer();
        Iterator<FwDutyAction> it = duty.getFwDutyActions().iterator();
        while (it.hasNext()) {
            FwDutyAction fwDutyAction = it.next();
            authorityBuffer.append(",s").append(
                    fwDutyAction.getFwSrcAction().getFwSource().getStyle())
                    .append(",i").append(fwDutyAction.getFwSrcAction().getId());
        }
        String authorityStr = authorityBuffer.append(",").toString();

        StringBuffer nodeBuffer = new StringBuffer("");
        Map<Long,FwSource> sourceMap = new HashMap<Long, FwSource>();
        for (FwSource source : menuList) {
            FwSource nodesource = source;
            while(nodesource!=null){
                if(sourceMap.containsKey(nodesource.getId())){
                    break;
                }
                sourceMap.put(nodesource.getId(), nodesource);
                boolean isCheck = authorityStr.indexOf(",s"
                        + nodesource.getStyle().substring(0, 2 * nodesource.getLevel())) >= 0;
                getTreeNodeString(nodeBuffer, nodesource.getId().toString(), nodesource
                        .getParent() == null ? "0" : nodesource.getParent().getId()
                        .toString(), nodesource.getName(), "checked:"+isCheck+",flag:1");
                nodeBuffer.append(",\n");
                nodesource = (FwSource)nodesource.getParent();
            }
        }
        for (FwSrcAction action : actionList) {
            if(!sourceMap.containsKey(action.getFwSource().getId())){
                continue;
            }
            boolean isCheck = authorityStr.indexOf(",i" + action.getId()+",") >= 0;
            getTreeNodeString(nodeBuffer, action.getId().toString(), action
                    .getFwSource().getId().toString(), action.getName(),
                    "checked:"+isCheck+",flag:2");
            nodeBuffer.append(",\n");

        }
        getTreeNodeString(nodeBuffer, "0", "","功能权限","open:true");
        model.addAttribute("treeNodes", "["+nodeBuffer.toString()+"]");

        return CHOOSE_ACTION;
    }

    private void getTreeNodeString(StringBuffer nodeBuffer, String id,
                                   String pid, String name, String isCheck) {
                               nodeBuffer.append("{id:'").append(id).append("',pId:'").append(pid)
                                       .append("',name:'").append(JavaScriptEncoder.INSTANCE.encode(name)).append("',").append(
                                               isCheck).append("}");
                           }

    /**
     * 分配保存方法.
     *
     * @param id
     *            id
     * @param actionIds
     *            分配数组
     * @return 跳转到查询方法
     */
    @RequestMapping(params = "actionMethod=assignFunction", method = RequestMethod.POST)
    public String processAssignAction(@RequestParam("dutyId") final Long id,
            @RequestParam("srcActionId") final Long[] actionIds) {
            roleService.assignOperation(id, actionIds);
        return "redirect:role.do?actionMethod=query";
    }

    public static void validate(FwDuty duty, Errors errors) {
        if (CommonUtil.isZeroLengthTrimString(duty.getName())) {
            errors.rejectValue("name", "required", "required");
        }
        if (CommonUtil.isZeroLengthTrimString(duty.getStatus())) {
            errors.rejectValue("status", "required", "required");
        }
        if (CommonUtil.isZeroLengthTrimString(duty.getDutyType())) {
            errors.rejectValue("dutyType", "required", "required");
        }
        if (duty.getFwGroup() == null) {
            duty.setFwGroup(new FwGroup());
        }
        if (duty.getFwGroup().isNew()) {
            duty.getFwGroup().setId(Long.valueOf("2"));
        }
        ValidateFieldLength.validateMaxLength(errors, "name", 120, "maxLimitLength",
            "Enter overflow.");
        ValidateFieldLength.validateMaxLength(errors, "describe", 200, "maxLimitLength",
            "Enter overflow.");
    }
}
