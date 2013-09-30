package com.huatek.springframework.view.extn;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;

public class JstlViewResolver implements ViewResolver {
	private static final Logger LOGGER = Logger
			.getLogger(JstlViewResolver.class);

	private ViewResolver jspResolver;

	public void setJspResolver(ViewResolver jspResolver) {
		this.jspResolver = jspResolver;
	}

	public View resolveViewName(String viewName, Locale locale)
			throws Exception {
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug("请求资源：" + viewName);
		}
		return jspResolver.resolveViewName(viewName, locale);
	}

}
