package com.huatek.framework.util;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
public class HuatekSessionListener implements HttpSessionListener {
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		HuatekSessionContext.getInstance().addSession(arg0.getSession());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		HuatekSessionContext.getInstance().delSession(arg0.getSession());
	}

}
