package com.huatek.framework.security;

import javax.servlet.http.HttpServletRequest;

/**
 *Collect and  store the web client information
 * 
 * **/
public interface ClientInformation {
	public ClientInfoBean collectClientInfo(HttpServletRequest request);
}
