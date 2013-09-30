package com.huatek.framework.entity;

import com.huatek.base.entity.NamedEntity;

public class FwSystem extends NamedEntity implements java.io.Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1155807352468031510L;


	/** nullable persistent field */
	private String describe;
	/** nullable persistent field */
	private String sysCode;
	/** nullable persistent field */
	private String sysIp;

	private Integer sysPort;

	private String contextPath;


	public String getDescribe() {
		return describe;
	}


	public void setDescribe(String describe) {
		this.describe = describe;
	}


	public String getSysCode() {
		return sysCode;
	}


	public void setSysCode(String sysCode) {
		this.sysCode = sysCode;
	}


	public String getSysIp() {
		return sysIp;
	}


	public void setSysIp(String sysIp) {
		this.sysIp = sysIp;
	}


	public Integer getSysPort() {
		return sysPort;
	}


	public void setSysPort(Integer sysPort) {
		this.sysPort = sysPort;
	}


	public String getContextPath() {
		return contextPath;
	}


	public void setContextPath(String contextPath) {
		this.contextPath = contextPath;
	}

	public String getSystemURL(String localIp,Integer port){
		if(this.sysIp==null){
			if(this.sysPort==null){
				return "http://"+localIp+":"+port+this.contextPath;
			}else{
				return "http://"+localIp+":"+this.sysPort+this.contextPath;
			}
		}
		return "http://"+this.sysIp+":"+this.sysPort+this.contextPath;
	}


}
