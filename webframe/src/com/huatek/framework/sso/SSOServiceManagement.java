package com.huatek.framework.sso;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.apache.log4j.Logger;

import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwSystem;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ClientInformationImpl;
import com.huatek.framework.service.GlobalVar;
import com.huatek.framework.service.SystemService;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.Parameter;
import com.huatek.framework.util.SpringContext;

public class SSOServiceManagement {


	/**
	 * 日志常量.
	 * **/
	private static final Logger LOGGER = Logger.getLogger(SSOServiceManagement.class);

	public static String ssoServerUrl = null;

	public static String localServerUrl = null;

	// 获取服务器端SessionID
	public static String getSsoTokenURL(final HttpServletRequest request)
			throws UnsupportedEncodingException {

		// 服务器IP获取
		StringBuffer ssoServerUrl = new StringBuffer(getSSOServerURL(request.getServerName(),request.getServerPort()));
		StringBuffer localUrl = new StringBuffer(getLocalServerURL(request.getServerName(),request.getServerPort()));
		String URI = request.getRequestURI();
		URI = URI.substring(URI.lastIndexOf("/"));
		localUrl.append(URI).append("?").append(
				request.getQueryString());
		ssoServerUrl.append("/sso.show?actionMethod=getToken&oldUrl="
				+ java.net.URLEncoder.encode(localUrl.toString(), GlobalVar.CHARSET_UTF_8));
		return ssoServerUrl.toString();
	}

	// 实现子业务系统登录
	/**
	 * 检查单点登录用户.
	 *
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	public static void ssoLogin(final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {
		String mainSysSessionId = request.getParameter("tokenId");
		if (CommonUtil.isZeroLengthTrimString(mainSysSessionId)) {
			return;
		}
	/*	AccountService accountService = (AccountService) SpringContext
				.getBean("accountService");
		LoginService loginService = (LoginService) SpringContext
				.getBean("loginService");
		DataAuthorityService dataAuthorityService = (DataAuthorityService) SpringContext
				.getBean("dataAuthorityService");*/
		String url = getSSOServerURL(request.getServerName(),request.getServerPort());
		List<NameValuePair> nameValuePairList = new ArrayList<NameValuePair>();
		nameValuePairList.add(new BasicNameValuePair("mainSysSessionId",mainSysSessionId));
		setSubSysInformation(nameValuePairList,request);
		String httpresponse = HttpClientUtil.postMethod(url
				+ "/sso.show?actionMethod=ssoCheck&doLogin=true", nameValuePairList,mainSysSessionId);
		httpresponse = HttpClientUtil.trimJSONSata(httpresponse);
		ResponseBean responseBean = SessionManagmentController.GSON.fromJson(
				httpresponse, ResponseBean.class);
		if (responseBean.isSuccess()) {
				FwAccount account = (FwAccount)HttpClientUtil.unSerializeableEntity(responseBean.getRetData());
				if(account==null){
					throw new BusinessRuntimeException("error.login.session.timeout");
				}
				request.getSession().setAttribute(
						ClientInformationImpl.LOGIN_ACCOUNT, account);
				request.getSession().setAttribute(ClientInformationImpl.SSO_TOKEN, mainSysSessionId);
				request.getSession().setAttribute(ClientInformationImpl.SSO_LOGIN_TIME, System.currentTimeMillis());

		} else {
			// 重定向到主系统的登录界面
			url = url + "/";
			response.sendRedirect(url);
		}

	}


	/**
	 * 校验主系统的session成功之后将子系统的信息传递至主系统保存.
	 *
	 * @throws Exception
	 *
	 */
	private static void setSubSysInformation(List<NameValuePair> nameValuePairList,final HttpServletRequest request) throws Exception {
		// 服务器ip
		String subIp = request.getServerName();
		// 子系统的session
		String subSessionId = request.getSession().getId();
		// 端口号
		String port = String.valueOf(request.getServerPort());
		// 工程名称
		String path = request.getContextPath();
		// 子系统注销路径
		String logoutUrl = "/Logout";
		nameValuePairList.add(new BasicNameValuePair("subIp", subIp));
		nameValuePairList.add(new BasicNameValuePair("port", port));
		nameValuePairList.add(new BasicNameValuePair("path", path));
		nameValuePairList.add(new BasicNameValuePair("logoutUrl", logoutUrl));
		nameValuePairList.add(new BasicNameValuePair("subSysSessionId",subSessionId));

	}

	public static String getSSOServerURL(final String sysIp, final Integer port){
		if(ssoServerUrl==null){
			setSSOURL(sysIp,port);
		}
		return ssoServerUrl;
	}

	private  static synchronized void setSSOURL(final String sysIp, final Integer port){
		if(ssoServerUrl==null){
			FwSystem fwSystem = ((SystemService)SpringContext.getBean("systemService")).getFwSystemBySysCode("default");
			ssoServerUrl = fwSystem.getSystemURL(sysIp, port);
		}
	}

	public static boolean isSSOServer(){
		return Parameter.getInstance().getProp().getProperty("app.system.code", "").equals("default");
	}

	private  static synchronized void setlocalURL(final String sysIp, final Integer port){
		if(localServerUrl==null){
			FwSystem fwSystem = ((SystemService)SpringContext.getBean("systemService")).getFwSystemBySysCode(Parameter.getInstance().getProp().getProperty("app.system.code"));
			localServerUrl = fwSystem.getSystemURL(sysIp, port);
		}
	}

	public static String getLocalServerURL(final String sysIp, final Integer port){
		if(localServerUrl==null){
			setlocalURL(sysIp,port);
		}
		return localServerUrl;
	}

}
