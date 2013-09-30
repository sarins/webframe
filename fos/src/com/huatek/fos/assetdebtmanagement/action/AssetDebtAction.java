/**
 * Xi’an Huatek Technologies Co., Ltd.
 * Created since: 2013-5-27 下午03:00:34
 * Author: allen_huang
 * Copyright (c) 2013 Huatek. All rights reserved.
 */
package com.huatek.fos.assetdebtmanagement.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huatek.fos.assetdebtmanagement.entity.hibernate.AssetDebt;
import com.huatek.fos.assetdebtmanagement.service.AssetDebtService;
import com.huatek.fos.orginnermanagement.entity.hibernate.InteriorLoan;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.util.QueryCondition;

/**
 * 
 * @author: allen_huang
 * 
 * @version $Id: InteriorLoanAction.java, v 0.1 2013-5-21 下午03:00:34 $
 * 
 *          Comment: 资产负债率管理控制器.
 */
@Controller
@RequestMapping("/assetDebt.do")
@SessionAttributes(types = AssetDebt.class)
public class AssetDebtAction {

	@Autowired
	private AssetDebtService assetDebtService;

	// 资产负债页面路径
	private static final String QUERY_PAGE_PATH = "fos/assetdebtmanagement/asset_debt_list.jsp";
	// 重定集团内部借款审核提交前查询路径
	private static final String AUDITREDIRECTPATH = "redirect:assetDebt.do?actionMethod=query";

	/**
	 * 查询登录用户所在部门表头.
	 * 
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "actionMethod=query")
	public String query(final Model model, final HttpServletRequest request) {
		// 取得查询条件
		List<CommonBean> paramterList = QueryCondition.getQueryCondition(
				request, AssetDebt.class);

		// 查询操作
		CutPageBean pageBean = QueryCondition.getQueryPageBean(request);

		// 获取分页查询参数
		model.addAttribute("queryParams", paramterList);

		// 获取分页查询结果
		model.addAttribute("pageBean",
				assetDebtService.getAssetDebtPageBean(pageBean, paramterList));

		return QUERY_PAGE_PATH;
	}

	/**
	 * 删除.
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(params = "actionMethod=delete", method = RequestMethod.POST)
	public String delete(@RequestParam("id") final Long id) {
		AssetDebt assetDebt = (AssetDebt) assetDebtService.getObjectById(
				AssetDebt.class, id);
		if (assetDebt != null) {
			assetDebtService.delete(assetDebt);
		}
		return AUDITREDIRECTPATH;
	}

}
