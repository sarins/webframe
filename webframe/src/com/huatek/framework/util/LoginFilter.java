package com.huatek.framework.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.apache.log4j.Logger;

import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ClientInfoBean;
import com.huatek.framework.security.ClientInformationImpl;
import com.huatek.framework.security.IValidateUser;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.sso.HttpClientUtil;
import com.huatek.framework.sso.ResponseBean;
import com.huatek.framework.sso.SSOServiceManagement;
import com.huatek.framework.sso.SessionManagmentController;

public class LoginFilter implements Filter {
	public static final String ERRORS_LOGIN_SESSION_TIMEOUT = "error.login.session.timeout";
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String ERROR_LABLE = "errorLable";
	public static final String VALIDATE_USER_SERVICE = "validateUserService";
	private static final Logger LOGGER = Logger.getLogger(LoginFilter.class);

	private String userNameField = "userName";

	private String passwordField = "password";

	private String formNameField = "loginForm";

	private String welcomeAction = "/";

	// private ServletContext servletContext;

	// private static WebApplicationContext webContext = null;

	public void destroy() {
		ThreadLocalClient.remove();
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hRequest = (HttpServletRequest) request;
		HttpServletResponse hResponse = (HttpServletResponse) response;
		if (hRequest.getSession().getAttribute(
				ClientInformationImpl.LOGIN_ACCOUNT) == null||
				request.getParameter(formNameField) != null) {
			if (request.getParameter(formNameField) != null) {
				// 用户登录
				try {
					IValidateUser validateUserService = (IValidateUser) SpringContext
							.getBean(VALIDATE_USER_SERVICE);
					FwAccount user = (FwAccount) validateUserService.getUser(
							request.getParameter(userNameField), request
									.getParameter(passwordField));
					hRequest.getSession().setAttribute(
							ClientInformationImpl.LOGIN_ACCOUNT, user);
				} catch (BusinessRuntimeException e) {
					if (LOGGER.isDebugEnabled()) {
						LOGGER.debug(e.getMessage());
					}
					request.setAttribute(ERROR_LABLE, e.getErrorKey());
				} catch (Exception e) {
					e.printStackTrace();
					if (LOGGER.isDebugEnabled()) {
						LOGGER.debug(e.getMessage());
					}
					request.setAttribute(ERROR_MESSAGE, e.getMessage());
				}
			}
			// 使用SSO登录校验
			else if (!SSOServiceManagement.isSSOServer()){
					if (request.getParameter("tokenId") != null) {
					try {
						SSOServiceManagement.ssoLogin(hRequest, hResponse);
					} catch (BusinessRuntimeException e) {
						if (LOGGER.isDebugEnabled()) {
							LOGGER.debug(e.getMessage());
						}
						request.setAttribute(ERROR_LABLE, e.getErrorKey());
					} catch (Exception e) {
						e.printStackTrace();
						if (LOGGER.isDebugEnabled()) {
							LOGGER.debug(e.getMessage());
						}
						request.setAttribute(ERROR_MESSAGE, e.getMessage());
					}
				// 获取SSO令牌
				} else {
					String ssoLogin = SSOServiceManagement.getSsoTokenURL(hRequest);
					hResponse.sendRedirect(ssoLogin);
					return;
				}
			}
		//超过5分钟校验SSO身份，保持SSO服务器Session会话，避免超时
		}else if(hRequest.getSession().getAttribute(ClientInformationImpl.SSO_LOGIN_TIME)!=null&&
				hRequest.getSession().getAttribute(ClientInformationImpl.SSO_TOKEN)!=null){
			long loginTime = System.currentTimeMillis() - (Long)hRequest.getSession().getAttribute(ClientInformationImpl.SSO_LOGIN_TIME);
			if(loginTime>=ClientInformationImpl.SSO_CHECK_TIME){
				//保持SSO服务器Session会话，避免超时
				try {
					List<NameValuePair> nameValuePairList = new ArrayList<NameValuePair>();
					String tokenId = hRequest.getSession().getAttribute(ClientInformationImpl.SSO_TOKEN).toString();
					nameValuePairList.add(new BasicNameValuePair("mainSysSessionId",tokenId));
					String httpresponse = HttpClientUtil.postMethod(SSOServiceManagement.getSSOServerURL(hRequest.getServerName(),hRequest.getServerPort())
							+ "/sso.show?actionMethod=ssoCheck",nameValuePairList, tokenId);
					httpresponse = HttpClientUtil.trimJSONSata(httpresponse);
					ResponseBean responseBean = SessionManagmentController.GSON.fromJson(
							httpresponse, ResponseBean.class);
					if(responseBean.isSuccess()){
						hRequest.getSession().setAttribute(ClientInformationImpl.SSO_LOGIN_TIME, System.currentTimeMillis());
					}else{
						hRequest.getSession().invalidate();
						request.setAttribute(ERROR_MESSAGE, "error.login.session.timeout");
					}
				} catch (Exception e) {
					e.printStackTrace();
					LOGGER.error("和SSO服务器保持SESSION会话时出错:"+e.getMessage());
				}
			}
		}
		//clear browse cache
		hResponse.setHeader("Pragma","No-Cache");
		hResponse.setHeader("Cache-Control","No-Cache");
		hResponse.setDateHeader("Expires", 0);

		if (hRequest.getAttribute(ERROR_MESSAGE) != null
				|| hRequest.getAttribute(ERROR_LABLE) != null) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher(welcomeAction);
			dispatcher.forward(request, response);
		} else {
			if (ThreadLocalClient.get() != null) {
				ClientInfoBean cientInfo = (ClientInfoBean) ThreadLocalClient
						.get();
				cientInfo.setOperator((FwAccount) hRequest.getSession()
						.getAttribute(ClientInformationImpl.LOGIN_ACCOUNT));
			}
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {

		if (fConfig.getInitParameter("formNameField") != null) {
			formNameField = fConfig.getInitParameter("formNameField");
		}
		if (fConfig.getInitParameter("userNameField") != null) {
			userNameField = fConfig.getInitParameter("userNameField");
		}
		if (fConfig.getInitParameter("passwordField") != null) {
			passwordField = fConfig.getInitParameter("passwordField");
		}
		if (fConfig.getInitParameter("welcomeAction") != null) {
			welcomeAction = fConfig.getInitParameter("welcomeAction");
		}

	}

}
