package com.huatek.framework.security;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.LocaleResolver;

import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.LoginFilter;
import com.huatek.framework.util.SpringContext;


public class ClientInformationImpl implements  ClientInformation{

	private static final String SYSTEM_CODE = "SYSTEM_CODE";
	public static final String CREATE_GROUP = "createGroup";
	public static final String MENU_ID = "menuId";
	public static final String LOGIN_ACCOUNT = "LoginAccount";
	public static final String ACTION_URL = "actionURL";
	public static final String DEFAULT_METHOD = "query";
	public static final String ACTION_METHOD = "actionMethod";
	public static final String SSO_TOKEN = "SSO_TOKEN";
	/**
	 * SSO登录或校验时间.
	 */
	public static final String SSO_LOGIN_TIME = "SSO_LOGIN_TIME";
	/**
	 * SSO校验时间间隔.
	 */
	public final static int SSO_CHECK_TIME = 100000;

	private static final Logger LOGGER = Logger.getLogger(ClientInformationImpl.class);


	public ClientInfoBean collectClientInfo(HttpServletRequest request) {
		ClientInfoBean frameBean = new ClientInfoBean();
		LocaleResolver localeResolver = (LocaleResolver)SpringContext.getBean("localeResolver");
		frameBean.setLocale(localeResolver.resolveLocale(request));
		String actionName = getActionName(request);
		frameBean.setHostIp(request.getRemoteHost());
		frameBean.setHostPort(request.getRemotePort());
		if(CommonUtil.isNotZeroLengthTrimString(request.getParameter(MENU_ID))){
			frameBean.setMenuId(Long.valueOf(request.getParameter(MENU_ID)));
			request.getSession().setAttribute(MENU_ID, frameBean.getMenuId());
		}else{
			if(request.getSession().getAttribute(MENU_ID)!=null){
				frameBean.setMenuId((Long)request.getSession().getAttribute(MENU_ID));
			}
		}

		frameBean.setContextPath(request.getContextPath());
		frameBean.setRequestURL(request.getRequestURI());
		String queryString = request.getQueryString();
		LOGGER.info("请求路径:"+frameBean.getRequestURL()+(queryString==null?"":"?"+queryString));
		frameBean.setServerPort(request.getServerPort());
		frameBean.setServerHost(request.getServerName());
		frameBean.setActionURL(actionName);
		frameBean.setActualActionPath(actionName);
		String actionMethod = request.getParameter(ACTION_METHOD);
		if (actionMethod == null) {
			actionMethod = DEFAULT_METHOD;
		}
		frameBean.setRequestMethod(request.getMethod());
		frameBean.setActionMethod(actionMethod);
		frameBean.setAccessCalendar(Calendar.getInstance());
		HttpSession session = request.getSession();
		FwAccount accountBean = (FwAccount) session.getAttribute(LOGIN_ACCOUNT);
		frameBean.setOperator(accountBean);
		//frameBean.setRequest(request);
		return frameBean;
	}
	protected static String getActionName(HttpServletRequest request) {
		String actionName = request.getParameter(ACTION_URL);
		if (CommonUtil.isZeroLengthTrimString(actionName)) {
			String requestURL = request.getRequestURI();
			if (requestURL != null) {
				actionName = requestURL
						.substring(requestURL.lastIndexOf("/") + 1);
				/*if (actionName.indexOf("?") > 0) {
					actionName = actionName.substring(0, actionName
							.indexOf("?"));
				}*/
			}
		}
		return actionName;
	}

}
