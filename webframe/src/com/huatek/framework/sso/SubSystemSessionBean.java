package com.huatek.framework.sso;

public class SubSystemSessionBean implements java.io.Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private String sessionId;
	private String url;
	private String ip;
	private String port;
	private String path;
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
