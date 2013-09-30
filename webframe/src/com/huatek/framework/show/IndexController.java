package com.huatek.framework.show;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huatek.base.tree.HTMLEncoder;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwSource;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ClientInformationImpl;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.service.GlobalVar;
import com.huatek.framework.sso.HttpClientUtil;
import com.huatek.framework.sso.SSOServiceManagement;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.Constant;
import com.huatek.framework.util.Util;
@Controller
@RequestMapping("/menu.do")
public class IndexController {
	private static final String WELCOME_ACTION = "welcome";

	@RequestMapping(params = "actionMethod=getMenu")
	public String getMenu(final Model model, final HttpServletRequest request,final HttpServletResponse response) throws Exception{
		//如果是本地请求,则转发到SSO服务器
		if(!SSOServiceManagement.isSSOServer()){
			String SSoURL = SSOServiceManagement.getSSOServerURL(request.getServerName(), request.getServerPort());
			SSoURL = SSoURL + "/menu.do?"+request.getQueryString();
			String token = (String)request.getSession().getAttribute(ClientInformationImpl.SSO_TOKEN);
			if(token==null){
				throw new BusinessRuntimeException("没有获取到SSO服务器登录令牌!");
			}
			request.setAttribute(Constant.AJAX_OUT_DATA, HttpClientUtil.getMethod(SSoURL,token));
			return "frame/out_data.jsp";
		//如果是SSO服务器自己的请求，使用当前的应用模板
		}else{
			return getModule(model,request,response);
		}
	}

	public static String getModule(final Model model, final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		FwAccount user =  ThreadLocalClient.get().getOperator();
		if(user==null){
			return "redirect:sso.show?actionMethod=logout";
		}
		//获取导航条信息
		List<FwSource> sourceList = user.getUserMenuTree();
		StringBuffer navHtml=new StringBuffer("");
		String menuId = request.getParameter("menuId");
		for(int i=0;i<sourceList.size();i++){
			FwSource source = (FwSource)sourceList.get(i);
			if(source.getLevel().intValue()==1){
				if(source.getId().toString().equals(menuId)){
					navHtml.append("<li class='active'><a class='current' ");
				}else{
					navHtml.append("<li><a ");
				}
				navHtml.append(" href='");
				if(source.getFwSystem().getId()!=1 || source.getFwSystem().getContextPath()!=null){
					navHtml.append(source.getFwSystem().getSystemURL(request.getServerName(),request.getServerPort())).append("/");
				}else{
					navHtml.append("http://").append(request.getServerName()).append(":").append(request.getServerPort()).append(request.getContextPath()).append("/");
				}
				navHtml.append("menu.do?actionMethod=getMenu&menuId="+source.getId());
				if(source.getSourceCode()!=null&&!source.getSourceCode().equals("#")){
					navHtml.append("&").append(WELCOME_ACTION).append("=").append(java.net.URLEncoder.encode(source.getSourceCode(), GlobalVar.CHARSET_UTF_8));
				}
				navHtml.append("'>"+HTMLEncoder.INSTANCE.encode(source.getTitle())+"</a></li>");
			}
		}
		model.addAttribute("navHtml", navHtml);

		if(CommonUtil.isNotZeroLengthTrimString(menuId)){
			//获取当前的模块信息
			FwSource source = (FwSource)Util.getObject(user.getUserMenuTree(), Long.valueOf(menuId));
			model.addAttribute("fwSource",source);
			//获取当前的二级菜单信息
			model.addAttribute("subMenuHtml", getSubMenuStr(source,user));

		}
		//设置布局页面上调用的action
		if(CommonUtil.isNotZeroLengthTrimString(request.getParameter(WELCOME_ACTION))){
			request.setAttribute(WELCOME_ACTION, request.getParameter(WELCOME_ACTION));
		}
		return "layout/common.jsp";
	}

	private static String getSubMenuStr(FwSource fwSource, FwAccount user) {
		if(fwSource!=null){
			StringBuffer menuStr = new StringBuffer();
			List<FwSource> sourceList = user.getUserMenuTree();
			if(sourceList!=null && sourceList.size()>0){

				for(int i=0;i<sourceList.size();i++){
					FwSource source = sourceList.get(i);
					if(source.getLevel()==2 && source.getParent().getId().longValue() == fwSource.getId().longValue()){
						menuStr.append("<ul>\n");
						if(source.isContainChild()){
							FwSource nextNode = (FwSource)source.getNextNode();
							if(nextNode.getIsMenu()==1){
								menuStr.append("<li class='button'><a href='javascript:;'>");
								menuStr.append(source.getName());
								menuStr.append("</a></li>\n<li class='dropdown'>\n<ul>\n");
							}else{
								menuStr.append("<li class='button'> <a href='javascript:;' onclick=\"getInitModule('"+nextNode.getLink()+"','"+fwSource.getName()+" > "+ source.getName() +"');\" >");
								menuStr.append(source.getName()+"</a></li></ul>\n");
							}
						}else{
							menuStr.append("<li class='button'> <a  onclick=\"getInitModule('"+source.getLink()+"','"+fwSource.getName()+" > "+ source.getName() +"');\" >");
							menuStr.append(source.getName()+"</a></li></ul>\n");
						}
					}else if(source.getIsMenu()==1 && source.getLevel()==3 && source.getParent().getParent().getId().longValue() == fwSource.getId().longValue()){
						FwSource nextNode = (FwSource)source.getNextNode();
						if(!source.isContainChild()){
							menuStr.append("<li class='button'><a href='javascript:;'  onclick=\"getInitModule('"+source.getLink()+"','"+fwSource.getName()+" > "+ source.getParent().getName() +" > "+source.getName()+"');\" >"+source.getName()+"</a></li></ul>\n");
						}else{
							menuStr.append("<li class='button'><a  onclick=\"getInitModule('"+nextNode.getLink()+"','"+fwSource.getName()+" > "+ source.getParent().getName() +" > "+source.getName()+"');\" >"+source.getName()+"</a></li>\n");
							while(nextNode!=null&&nextNode.getIsMenu()==2){
								nextNode = (FwSource)nextNode.getNextNode();
							}
						}
						if(nextNode==null || nextNode.getParent()==null || nextNode!=null && nextNode.getParent() != null &&
								nextNode.getParent().getId().longValue() != source.getParent().getId().longValue()){
							menuStr.append("</ul>\n");
						}
					}
				}

			}
			if(menuStr.length()>0){
				return "<div class='menuTitle'>"+fwSource.getName()+"</div>\n"+menuStr;
			}
			return null;
		}else{
			return null;
		}

	}

}
