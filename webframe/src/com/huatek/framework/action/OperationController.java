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

import com.huatek.framework.entity.FwSource;
import com.huatek.framework.entity.FwSrcAction;
import com.huatek.framework.service.OperationService;
import com.huatek.framework.service.SourceService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.validate.ValidateFieldLength;

@Controller
@RequestMapping("/operation.do")
@SessionAttributes(types = FwSrcAction.class)
public class OperationController{

    /*
     * 初始化菜单管理返回路径
     * */
    private final static String OPERATION_EDIT = "frame/source/source_action_edit.jsp";
    /*
     * 菜单管理查询返回路径
     * */
    private final static String OPERATION_LIST = "frame/source/source_action_list.jsp";
    @Autowired
    private OperationService    operationService;
    @Autowired
    private SourceService       sourceService;

    private String getInitDataPage(Model model, Long sourceId) {
        model.addAttribute("sourceId", sourceId);
        return OPERATION_EDIT;
    }

    @RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
    public String add(@RequestParam("sourceId") Long sourceId, Model model) {
        model.addAttribute(new FwSrcAction());
        return getInitDataPage(model, sourceId);
    }

    @RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
    public String processAdd(Model model, @RequestParam("sourceId") Long sourceId,
                             @ModelAttribute FwSrcAction operation, BindingResult result,
                             SessionStatus status) {
        return this.processEdit(model, sourceId, operation, result, status);
    }

    @RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
    public String edit(@RequestParam("sourceId") Long sourceId, @RequestParam("queryId") Long id,
                       Model model) {
        model.addAttribute(operationService.getObjectById(FwSrcAction.class, id));
        return getInitDataPage(model, sourceId);
    }

    @RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
    public String processEdit(Model model, @RequestParam("sourceId") Long sourceId,
                              @ModelAttribute FwSrcAction operation, BindingResult result,
                              SessionStatus status) {
        validate(operation, result);
        if (result.hasErrors()) {
            return getInitDataPage(model, sourceId);
        }
        FwSource fwSource = new FwSource();
        fwSource.setId(sourceId);
        operation.setFwSource(fwSource);
        if (operationService.saveSourceAction(operation)) {
            status.setComplete();
        } else {
            result.rejectValue("name", "duplicate", new Object[] { operation.getName() },
                "The operation is existed");
            return getInitDataPage(model, sourceId);
        }
        return "redirect:operation.do?actionMethod=query&sourceId=" + sourceId;
    }

    @SuppressWarnings("unchecked")
    @RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
    public String delete(@RequestParam("sourceId") Long sourceId, @RequestParam("id") Long[] ids) {
        List<FwSrcAction> list = operationService.findDatasByIds(FwSrcAction.class, ids);
        if (list != null && list.size() > 0) {
            operationService.deleteAll(list);
        }
        return "redirect:operation.do?actionMethod=query&sourceId=" + sourceId;
    }

    @RequestMapping(params = "actionMethod=query")
    public String query(@RequestParam("sourceId") Long sourceId, Model model,
                        HttpServletRequest request) {
        List<CommonBean> paramterList = QueryCondition
            .getQueryCondition(request, FwSrcAction.class);
        CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
        model.addAttribute("queryParams", paramterList);
        model.addAttribute("pageBean", operationService.getOperationPageBean(pageBean,
            paramterList, sourceId));
        model.addAttribute("fwSource", sourceService.getObjectById(FwSource.class, sourceId));
        model.addAttribute("sourceId", sourceId);
        return OPERATION_LIST;
    }

    public static void validate(FwSrcAction action, Errors errors) {
        if (CommonUtil.isZeroLengthTrimString(action.getName())) {
            errors.rejectValue("name", "required", "required");
        }
        if (CommonUtil.isZeroLengthTrimString(action.getActionMethods())) {
            errors.rejectValue("actionMethods", "required", "required");
        }
        if (action.getLogLevel() == null) {
            errors.rejectValue("logLevel", "required", "required");
        }
        if (CommonUtil.isZeroLengthTrimString(action.getMethodName())) {
            errors.rejectValue("methodName", "required", "required");
        }
        if (action.getActionOrder() == null) {
            errors.rejectValue("actionOrder", "required", "required");
        }
        ValidateFieldLength.validateMaxLength(errors, "name", 120, "maxLimitLength",
            "Enter overflow.");
        ValidateFieldLength.validateMaxLength(errors, "actionMethods", 120, "maxLimitLength",
            "Enter overflow.");
        ValidateFieldLength.validateMaxLength(errors, "methodName", 120, "maxLimitLength",
            "Enter overflow.");
    }

}
