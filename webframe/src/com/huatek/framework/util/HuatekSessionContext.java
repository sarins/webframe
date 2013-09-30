package com.huatek.framework.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

public final class HuatekSessionContext {
	private static HuatekSessionContext instance = new HuatekSessionContext();

	public static HuatekSessionContext getInstance() {
		return instance;
	}

	private HuatekSessionContext() {
		sessionMap = new HashMap<String, HttpSession>();
	}

	private Map<String, HttpSession> sessionMap;

	public synchronized void addSession(HttpSession session) {
		if (session != null) {
			sessionMap.put(session.getId(), session);
		}
	}

	public synchronized void delSession(HttpSession session) {
		if (session != null) {
			sessionMap.remove(session.getId());
		}
	}

	public synchronized HttpSession getSession(String session_id) {
		if (session_id == null)
			return null;
		return (HttpSession) sessionMap.get(session_id);
	}
}
