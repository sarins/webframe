package com.huatek.framework.security;

public interface LdapValidateFace {
	public boolean isLdapUser(String userName,String password);
	public Object updateLocalUserInfo(String userName,String password);
}
