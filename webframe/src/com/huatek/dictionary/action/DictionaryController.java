package com.huatek.dictionary.action;

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

import com.huatek.dictionary.entity.FwCategory;
import com.huatek.dictionary.entity.FwDictionary;
import com.huatek.dictionary.service.DictionaryFactory;
import com.huatek.dictionary.service.DictionaryService;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.QueryCondition;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.BaseEntityEditor;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * * 属性字典管理controller.
 *
 * @author winner pan
 *
 */
@Controller
@RequestMapping("/dictionary.do")
@SessionAttributes(types = FwDictionary.class)
public class DictionaryController {
    /**
     *属性字典管理的service.
     */
    @Autowired
    private DictionaryService   dictionaryService;

    private static final String DICEDITPATH       = "frame/dictionary/dictionary_edit.jsp";

    private static final String QUERYPAGEPATH     = "frame/dictionary/dictionary_list.jsp";

    /**
     * 重定向至字典目录查询页面.
     */
    private static final String REDIRECTQUERYPATH = "redirect:dictionary.do?actionMethod=query";

    /**
     *新增方法.
     *
     * @param model
     *            对象
     * @return 跳转到新增初始数据方法
     */
    @RequestMapping(params = "actionMethod=add", method = RequestMethod.GET)
    public String add(final Model model, Long categoryId) {
        model.addAttribute(new FwDictionary());
        return getInitDataPage(model, categoryId);
    }

    /**
     * 编辑初始数据方法.
     *
     * @param model
     *            对象
     * @param propertyId
     *            属性id
     * @return 跳转到编辑页面
     */
    private String getInitDataPage(final Model model, final Long categoryId) {
        model.addAttribute("categoryList", DictionaryFactory.getAllFwCategoryList());
        model.addAttribute("categoryId", categoryId);
        return DICEDITPATH;
    }

    /**
     * 新增提交方法.
     *
     * @param model
     *            对象
     * @param property
     *            对象
     * @param result
     *            结果
     * @param status
     *            状态
     * @return 跳转到编辑提交方法
     */
    @RequestMapping(params = "actionMethod=add", method = RequestMethod.POST)
    public String processAdd(final Model model, @ModelAttribute final FwDictionary fwDictionary,
                             final BindingResult result, final SessionStatus status) {
        return this.processEdit(model, fwDictionary, result, status);
    }

    /**
     * 编辑初始方法.
     *
     * @param id
     *            传人id参数
     * @param model
     *            对象
     * @return 跳转到初始数据方法
     */
    @RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
    public String edit(final Long id, final Long categoryId,
                       final Model model) {
        model.addAttribute(dictionaryService.getFwDictionary(id));
        return getInitDataPage(model, categoryId);
    }

    /**
     * 编辑保存方法.
     *
     * @param model
     *            对象
     * @param property
     *            属性对象
     * @param result
     *            结果
     * @param status
     *            状态
     * @return 跳转到查询方法
     */
    @RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
    public String processEdit(final Model model, @ModelAttribute final FwDictionary fwDictionary,
                              final BindingResult result, final SessionStatus status) {
        validateDic(fwDictionary, result);
        if (result.hasErrors()) {
        	 return Util.printErrorString(Util.getErrorMsgInfo(result, "dictionaryForm"));
        }
        int saveStatus = dictionaryService.saveOrUpdateFwDictionary(fwDictionary);
        if(saveStatus==0){
            status.setComplete();
            dictionaryService.flushCache(true);
        }else if(saveStatus==1){
            result.rejectValue("code", "error.check.duplicate", "该字典编码已存在！");
            return Util.printErrorString(Util.getErrorMsgInfo(result, "dictionaryForm"));
        }else if(saveStatus==2){
            result.rejectValue("orderNum", "error.check.duplicate", "该字典排序已存在！");
            return Util.printErrorString(Util.getErrorMsgInfo(result, "dictionaryForm"));
        }
        return "redirect:dictionary.do?actionMethod=query&categoryId=" + fwDictionary.getFwCategory().getId();
    }

    /**
     * 删除方法.
     *
     * @param ids
     *            id数组
     * @return 跳转到查询方法
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
    public String delete(@RequestParam("id") final Long[] ids, final Long categoryId) {
        List<FwDictionary> fwDictionaryList = dictionaryService.findDatasByIds(FwDictionary.class,
            ids);
        if (fwDictionaryList != null && fwDictionaryList.size() > 0) {
            dictionaryService.deleteAll(fwDictionaryList);
        }
        dictionaryService.flushCache(true);
        return "redirect:dictionary.do?actionMethod=query&categoryId=" + categoryId;
    }

    /**
     * 查询初始方法.
     *
     * @param model
     *            对象
     * @param pageBean
     *            分页bean
     * @param request
     *            httpRequest
     * @return 跳转到列表页面
     */
    @RequestMapping(params = "actionMethod=query")
    public String query(final Long categoryId, final Model model,
                        final HttpServletRequest request) {
        List<CommonBean> paramterList = QueryCondition.getQueryCondition(request, FwCategory.class);
        CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
        model.addAttribute("queryParams", paramterList);
        model.addAttribute("pageBean", dictionaryService.getFwDictionaryPageBean(categoryId,
            pageBean, paramterList));
        model.addAttribute("fwCategory", (FwCategory) dictionaryService.getObjectById(
            FwCategory.class, categoryId));
        model.addAttribute("categoryId", categoryId);
        //更新状态操作提示标识
        model.addAttribute("success", request.getParameter("success"));
        return QUERYPAGEPATH;
    }

    /**
     * 生效/失效.
     *
     * @param ids
     *          供应商ID
     * @param statuss
     *            状态
     * @param categoryId
     *            类目ID
     * @return 跳转到查询页面
     * @throws Exception
     */
    @RequestMapping(params = "actionMethod=condition", method = RequestMethod.POST)
    public String condition(@RequestParam("id") final Long[] ids, final String statuss,
                            @RequestParam("categoryId") final Long categoryId) throws Exception {
        dictionaryService.conditionAll(ids, statuss);
        return REDIRECTQUERYPATH + "&id=" + categoryId;
    }

    /**
     *initBinder方法.
     *
     * @param dataBinder
     *            dataBinder
     */
    @InitBinder
    protected void initBinder(final WebDataBinder dataBinder) {
        dataBinder.registerCustomEditor(FwCategory.class, "fwCategory", new BaseEntityEditor(
            FwCategory.class));
    }

    /**
     *验证方法.
     *
     * @param propertyDic
     *            属性字典对象
     * @param errors
     *            errors
     */
    public static void validateDic(final FwDictionary fwDictionary, final Errors errors) {
        if (CommonUtil.isZeroLengthTrimString(fwDictionary.getName())) {
            errors.rejectValue("name", "required", "required");
        }
        if (CommonUtil.isZeroLengthTrimString(fwDictionary.getCode())) {
            errors.rejectValue("code", "required", "required");
        }
        if (CommonUtil.isZeroLengthTrimString(fwDictionary.getOrderNum())) {
            errors.rejectValue("orderNum", "required", "required");
        }
        ValidateFieldLength.validateMaxLength(errors, "name", 60, "maxLimitLength", "输入超长。");
        ValidateFieldLength.validateMaxLength(errors, "code", 30, "maxLimitLength", "输入超长。");
        ValidateFieldLength.validateMaxLength(errors, "orderNum", 30, "maxLimitLength", "输入超长。");
    }
}
