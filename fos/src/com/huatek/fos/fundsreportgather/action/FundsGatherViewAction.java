package com.huatek.fos.fundsreportgather.action;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;
import com.huatek.fos.fundsreportgather.entity.hibernate.ReportsDetails;
import com.huatek.fos.fundsreportgather.service.FundsGatherService;
import com.huatek.fos.util.Constant;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.QueryCondition;

/**
 * 
 * 
 * @author: marvin_liu
 * 
 * @version $Id: FundsGatherViewAction.java, v 0.1 2013-6-6 下午02:16:45 $
 * 
 *          Comment: 资金来源运用汇总报表查询列表控制器
 */
@Controller
@RequestMapping("/fundsGatherView.do")
@SessionAttributes(types = SourceUseFunds.class)
public class FundsGatherViewAction {

	/**
	 * 资金来源运用汇总service类
	 */
	@Autowired
	private FundsGatherService fundsGatherService;

	private static final String LISTPAGEPATH_BOSS = "fos/fundsGathermanagement/fundsGatherBoss.jsp";
	private static final String LISTPAGEPATH_LEADER = "fos/fundsGathermanagement/fundsGatherLeader.jsp";

	/**
	 * 查询列表.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=queryBoss")
	public String queryBoss(final Model model, final HttpServletRequest request)
			throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, ReportsDetails.class);
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		Object[] params = new Object[] { startDate, endDate,
				Constant.REPORTS_USE_TOTAL };
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		model.addAttribute("pageBean", fundsGatherService
				.getFundsGatherPageBean(pageBean, parameterList, params, null));
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		return LISTPAGEPATH_BOSS;
	}

	/**
	 * 查询列表.
	 * 
	 * @param model
	 * @param request
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(params = "actionMethod=queryLeader")
	public String queryLeader(final Model model,
			final HttpServletRequest request) throws ParseException {
		List<CommonBean> parameterList = QueryCondition.getQueryCondition(
				request, ReportsDetails.class);
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		Object[] params = new Object[] { startDate, endDate,
				Constant.REPORTS_USE_ONE };
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);
		// 获取当前登录系统用户
		FwAccount fwAccount = ThreadLocalClient.get().getOperator();
		model.addAttribute("pageBean", fundsGatherService
				.getFundsGatherPageBean(pageBean, parameterList, params,
						fwAccount));
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		return LISTPAGEPATH_LEADER;
	}
}
