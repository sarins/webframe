package com.huatek.framework.util;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.runtime.TagHandlerPool;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;

import com.huatek.framework.security.ClientInfoBean;
import com.huatek.framework.security.ClientInformation;
import com.huatek.framework.security.ClientInformationImpl;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.sso.SSOServiceManagement;
import com.huatek.framework.tag.CutPageBean;

public class CommonFilter implements Filter {
	protected String charset = "utf-8";
	protected boolean ignore = true;
	private FilterConfig fConfig;
	private static final String PARAM_PORTAL_LOCALE_LANGUAGE = "language";
	private ClientInformation clientInformationImpl;
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.fConfig = fConfig;
		this.charset = fConfig.getInitParameter("charset");
		String value = fConfig.getInitParameter("ignore");
		if (value == null)
			this.ignore = true;
		else if (value.equalsIgnoreCase("true"))
			this.ignore = true;
		else if (value.equalsIgnoreCase("yes"))
			this.ignore = true;
		else
			this.ignore = false;
		if (fConfig.getInitParameter("clientInformationImpl") != null) {
			try {
				clientInformationImpl = (ClientInformation)Class.forName(fConfig.getInitParameter("clientInformationImpl")).newInstance();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}else{
			clientInformationImpl = new ClientInformationImpl();
		}
	}

	protected String selectEncoding(ServletRequest request) {
		return (this.charset);
	}

	private void setLocalCookie(HttpServletRequest request,
			HttpServletResponse response) {
		String locale = request.getParameter(PARAM_PORTAL_LOCALE_LANGUAGE);
		CookieLocaleResolver resover = (CookieLocaleResolver) SpringContext
				.getBean("localeResolver");
		if (locale != null) {
			String[] localeInfo = locale.split("_");
			java.util.Locale newLocale = new java.util.Locale(localeInfo[0],
					localeInfo[1]);
			resover.setLocale(request, response, newLocale);
		}
		request.setAttribute(DispatcherServlet.LOCALE_RESOLVER_ATTRIBUTE,
				resover);
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// Conditionally select and set the character encoding to be used
		if (ignore || (request.getCharacterEncoding() == null)) {
			String encoding = selectEncoding(request);
			if (encoding != null)
				request.setCharacterEncoding(encoding);
		}
		setLocalCookie((HttpServletRequest)request, (HttpServletResponse)response);
		HttpServletRequest hRequest = (HttpServletRequest) request;
		ClientInfoBean clientInfoBean = clientInformationImpl.collectClientInfo(hRequest);
		ThreadLocalClient.put(clientInfoBean);
		request.setAttribute("ht_globalUrl", SSOServiceManagement.getSSOServerURL(hRequest.getServerName(),hRequest.getServerPort()));
		chain.doFilter(request, response);
		//清空线程池本地变量中的数据，以免内存溢出
		ThreadLocalClient.remove();
		clientInfoBean = null;
		//清空页面上的翻页标签数据，以免放入缓存池中引起内存溢出
		/*Enumeration pageEnumeration = request.getAttributeNames();
		while(pageEnumeration.hasMoreElements()){
			String attriName = pageEnumeration.nextElement().toString();
			if(request.getAttribute(attriName) instanceof CutPageBean){
				CutPageBean pageBean = (CutPageBean)request.getAttribute(attriName);
				request.removeAttribute(attriName);
				pageBean = null;
			}
		}*/
	}

	public void destroy() {

	}
}
