package com.huatek.framework.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.huatek.framework.action.LoggerController;
import com.huatek.framework.entity.FwActionLog;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.QueryCondition;

@Controller
@RequestMapping("/logger.do")
@SessionAttributes(types = FwActionLog.class)
public class LoggerController{
    private static final String  QUERY_LOG="frame/source/logger_list.jsp";
    @Autowired
    private HibernateTemplate hibernateTemplate;
    @RequestMapping(params = "actionMethod=query")
    public String query(Model model, HttpServletRequest request){
        List<CommonBean> paramterList = QueryCondition.getQueryCondition(request,FwActionLog.class);
        CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
        model.addAttribute("queryParams",paramterList);
        model.addAttribute("pageBean",pageBean);
        String queryCondition = " 1=1 ";
        String totalRowsHsql = " select count(t) from FwActionLog t where"+queryCondition;
        String resultSql = "from FwActionLog t where "+queryCondition;
        pageBean = QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql, resultSql,"order by t.actionTime desc", pageBean,paramterList);
        model.addAttribute("pageBean", pageBean);
        return QUERY_LOG;
    }
}
