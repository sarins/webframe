/**
 * Xian Huatek Technologies Co., Ltd.
 * Created since: 2013-5-14 09:52:14
 * Author: apple_liu
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.framework.action;

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

import com.huatek.framework.entity.FwSystem;
import com.huatek.framework.service.SystemService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 *
 * @author: apple_liu
 *
 * @version $Id: SystemAction.java, v 0.1 2013-5-14 09:52:14 $
 *
 * Comment:
 */
@Controller
@RequestMapping("/system.do")
@SessionAttributes(types= FwSystem.class)
public class SystemController {

    @Autowired
    private SystemService systemService;

    private static final String REDIRECTQUERYPATH = "redirect:system.do?actionMethod=query";

    private static final String QUERYPAGEPATH = "frame/system/system_list.jsp";

    private static final String EDITPAGEPATH = "frame/system/system_edit.jsp";

    /**
     *查询.
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(params="actionMethod=query")
    public String query(final Model model,final HttpServletRequest request){
        List<CommonBean> parameterList = QueryCondition.getQueryCondition(request, FwSystem.class);
        CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
        model.addAttribute("pageBean", systemService.getRolePageBean(pageBean, parameterList));
        return QUERYPAGEPATH;
    }

    /***
     *跳转到新增页面.
     * @param model
     * @return
     */
    @RequestMapping(params="actionMethod=add",method=RequestMethod.GET)
    public String add(final Model model){
        model.addAttribute(new FwSystem());
        return EDITPAGEPATH;
    }

    /***
     *保存.
     * @param model
     * @param fwSystem
     * @param result
     * @param status
     * @return
     */
    @RequestMapping(params="actionMethod=add",method=RequestMethod.POST)
    public String processAdd(final Model model,@ModelAttribute final FwSystem fwSystem,final BindingResult result,final SessionStatus status){
        return this.processEdit(model, fwSystem, result, status);
    }

    /*****
     *跳转到编辑页面.
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(params="actionMethod=edit",method=RequestMethod.GET)
    public String edit(@RequestParam("queryId")final Long id,final Model model){
        model.addAttribute(systemService.getObjectById(FwSystem.class, id));
        return EDITPAGEPATH;
    }

    /***
     *保存.
     * @param model
     * @param fwSystem
     * @param result
     * @param status
     * @return
     */
    @RequestMapping(params="actionMethod=edit",method=RequestMethod.POST)
    public String processEdit(final Model model,@ModelAttribute final FwSystem fwSystem,final BindingResult result,final SessionStatus status){
        validate(fwSystem,result);
        if(result.hasErrors()){
        	return Util.printErrorString(Util.getErrorMsgInfo(result, "systemForm"));
        }
        systemService.saveFwSystem(fwSystem);
        status.setComplete();
        return REDIRECTQUERYPATH;
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(params="actionMethod=delete")
    public String delete(@RequestParam("id")final Long ids[]){
        List<FwSystem> fwSystemList = systemService.findDatasByIds(FwSystem.class, ids);
        if(fwSystemList !=null && fwSystemList.size()>0){
            systemService.deleteAll(fwSystemList);
        }
        return REDIRECTQUERYPATH;

    }


    /**
     * 数据验证.
     *
     * @param
     *
     * @param errors
     *
     */
    public static void validate(final FwSystem fwSystem,
            final Errors errors) {
        if (CommonUtil.isZeroLengthTrimString(fwSystem.getDescribe())) {
            errors.rejectValue("describe", "required", "required");
        }
        if(CommonUtil.isZeroLengthTrimString(fwSystem.getName())){
            errors.rejectValue("name", "required", "required");
        }
        if(CommonUtil.isZeroLengthTrimString(fwSystem.getStatus())){
            errors.rejectValue("status", "required", "required");
        }
        if(CommonUtil.isZeroLengthTrimString(fwSystem.getSysCode())){
            errors.rejectValue("sysCode", "required", "required");
        }
       /* if(CommonUtil.isZeroLengthTrimString(fwSystem.getSysIp())){
            errors.rejectValue("sysIp", "required", "required");
        }
        if(fwSystem.getSysPort()==null){
            errors.rejectValue("sysPort", "required", "required");
        }*/
        if(CommonUtil.isZeroLengthTrimString(fwSystem.getContextPath())){
            errors.rejectValue("contextPath", "required", "required");
        }
        ValidateFieldLength.validateMaxLength(errors, "describe", 100,
                "maxLimitLength", "Enter overflow.");

    }

}
