package com.huatek.framework.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huatek.framework.entity.FwSource;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.huatek.base.tree.TreeEntity;
import com.huatek.base.tree.TreeUtil;
import com.huatek.framework.entity.FwSystem;
import com.huatek.framework.service.SourceService;
import com.huatek.framework.service.SystemService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * 菜单管理的Controller.
 *
 * @author Joey_deng
 *
 * @version $Id: SourceDemoController.java, v 0.1 2013-3-13 上午10:07:20 Joey_deng Exp $
 */
@Controller
@RequestMapping("/source.do")
@SessionAttributes(types = FwSource.class)
public class SourceController {
    /**
     * 菜单服务的Service.
     */
    @Autowired
    private SourceService       sourceService;

    @Autowired
    private SystemService systemService;

    /**
     * 菜单列表的页面路径.
     */
    private static final String SOURCELISTPAGEPATH = "frame/source/source_list.jsp";

    /**
     * 菜单编辑的页面路径.
     */
    private static final String SOURCEEDITPAGEPATH = "frame/source/source_edit.jsp";

    /**
     * 菜单列表的查询方法.
     * @param model Model的对象
     * @param request Request的对象
     * @return 返回菜单的列表
     */
    @RequestMapping(params = "actionMethod=query")
    public String query(Model model, HttpServletRequest request) {
        List<CommonBean> paramterList = QueryCondition.getQueryCondition(request, FwSource.class);
        CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
        model.addAttribute("queryParams", paramterList);
        model.addAttribute("pageBean", sourceService.getSourcePageBean(pageBean, paramterList));
        return SOURCELISTPAGEPATH;
    }

    /**
     * 菜单新增初始化方法.
     * @param model Model的对象
     * @return 返回至菜单编辑的页面
     */
    @RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute(new FwSource());
        return getInitDataPage(model);
    }

    /**
     * 菜单编辑加载初始化数据.
     * @param model Model的对象
     * @return 返回至编辑页面
     */
    private String getInitDataPage(Model model) {
    	model.addAttribute("systemList", systemService.getAvailableFwSystem());
        model.addAttribute("parentList", sourceService.getAllSourceDataAsTree());
        return SOURCEEDITPAGEPATH;
    }

    /**
     * 菜单编辑保存的方法.
     * @param model Model的对象
     * @param source Source对象
     * @param result 保存返回的结果状态
     * @param status session状态
     * @return 保存成功跳转至菜单列表页面,失败跳转到编辑页面
     */
    @RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
    public String processAdd(Model model, @ModelAttribute FwSource source, BindingResult result,
                             SessionStatus status) {
        return this.processEdit(model, source, result, status);
    }

    /**
     * 菜单修改初始化方法.
     * @param model Model的对象
     * @return 返回至菜单编辑的页面
     */
    @RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
    public String edit(@RequestParam("queryId") Long id, Model model) {
        FwSource source = (FwSource) sourceService.getObjectById(FwSource.class, id);
        source.getFwSystem().getName();
        model.addAttribute(source);
        return getInitDataPage(model);
    }

    /**
     * 菜单编辑保存的方法.
     * @param model Model的对象
     * @param source Source对象
     * @param result 保存返回的结果状态
     * @param status session状态
     * @return 保存成功跳转至菜单列表页面,失败跳转到编辑页面
     */
    @RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
    public String processEdit(Model model, @ModelAttribute FwSource source, BindingResult result,
                              SessionStatus status) {
        validate(source, result);
        if (result.hasErrors()) {
            return Util.printErrorString(Util.getErrorMsgInfo(result, "sourceForm"));
        }
        sourceService.saveSource(source);
        return "redirect:source.do?actionMethod=query";
    }

    /**
     * 菜单删除.
     * @param ids 被删除的菜单id数组
     * @return  菜单列表页面
     * @throws Exception 抛异常
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") Long[] ids) throws Exception {
        List<FwSource> sources = sourceService.findDatasByIds(FwSource.class, ids);
        if (sources != null && sources.size() > 0) {
            sourceService.deleteAll(sources);
        }
        return "redirect:source.do?actionMethod=query";
    }

    @InitBinder
    protected void initBinder(WebDataBinder dataBinder) {
        dataBinder.registerCustomEditor(FwSystem.class, "fwSystem", new BaseEntityEditor(
            FwSystem.class));
        dataBinder.registerCustomEditor(FwSource.class, "parent", new BaseEntityEditor(
            FwSource.class));

    }

    @RequestMapping(params = "actionMethod=assign", method = RequestMethod.GET)
    public String assignAction(@RequestParam("id") Long id, Model model) {
        return "redirect:operation.do?actionMethod=query&sourceId=" + id + "&menuId=9187";
    }

    @RequestMapping(params = "actionMethod=frame", method = RequestMethod.GET)
    public String adjustFrame(Model model) {
        return "frame/source/adjust_frame.jsp";
    }

    @RequestMapping(params = "actionMethod=adjust", method = RequestMethod.GET)
    public String adjustSourceStyle(Model model) {
        List<FwSource> list = sourceService.getAllSourceDataAsTree();
        for (int i = 0; i < list.size(); i++) {
            FwSource source = list.get(i);
            source.setNodeLabel(source.getName());
            source.setLink("#");
        }
        TreeEntity.generalTreeNode(true, "", null, list);
        model.addAttribute("adjustSourceList", list);
        return "frame/source/adjust_style.jsp";
    }

    @RequestMapping(params = "actionMethod=adjust", method = RequestMethod.POST)
    public String processAdjustSourceStyle(Model model, String saveString, String baseStyle) {
        List<TreeEntity> nodeList = TreeUtil.generalStyles(saveString, baseStyle);
        sourceService.updateTreeStyle(nodeList, FwSource.class);
        return "redirect:source.do?actionMethod=adjust";
    }

    public static void validate(FwSource source, Errors errors) {
        if (CommonUtil.isZeroLengthTrimString(source.getName())) {
            errors.rejectValue("name", "required", "required");
        }
        if (CommonUtil.isZeroLengthTrimString(source.getSourceCode())) {
            errors.rejectValue("sourceCode", "required", "required");
        }
        if (CommonUtil.isZeroLengthTrimString(source.getStatus())) {
            errors.rejectValue("status", "required", "required");
        }
        if (source.getFwSystem() == null) {
            source.setFwSystem(new FwSystem());
        }
        if (source.getFwSystem().isNew()) {
            source.getFwSystem().setId(Long.valueOf("1"));
        }

        ValidateFieldLength.validateMaxLength(errors, "sourceCode", 100, "maxLimitLength",
            "Enter overflow.");
        ValidateFieldLength.validateMaxLength(errors, "name", 120, "maxLimitLength",
            "Enter overflow.");
        ValidateFieldLength.validateMaxLength(errors, "description", 200, "maxLimitLength",
            "Enter overflow.");
    }

}
