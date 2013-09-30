package com.huatek.framework.dbcp;

import org.apache.commons.dbcp.BasicDataSource;

import com.huatek.framework.util.DESEncryptor;

public class HuatekDbcpDataSource extends BasicDataSource{
	public void setPassword(String password){
		DESEncryptor des = new DESEncryptor();
		super.password =  des.decrypt(password);
	}
}
