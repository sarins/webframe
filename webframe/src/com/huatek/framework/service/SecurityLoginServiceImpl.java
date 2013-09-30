package com.huatek.framework.service;

import java.util.Date;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.huatek.framework.entity.FwLogin;
import com.huatek.framework.security.SecurityLoginInterFace;

public class SecurityLoginServiceImpl implements SecurityLoginInterFace {
	private Log log = LogFactory.getFactory().getInstance(
			this.getClass().getName());
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public boolean isAccountLocked(Long accountId) {
		FwLogin loginer = null;
		try {
			loginer = (FwLogin)hibernateTemplate.get(FwLogin.class, accountId);
			if(loginer==null || loginer.getIsLocked()==null||loginer.getLockedTime()==null){
				return false;
			}
			//锁定30分钟
			return loginer.getIsLocked().intValue()==1&& System.currentTimeMillis() - loginer.getLockedTime().getTime()<1800;
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return false;
	}

	public void passwordErrorNumRecord(Long accountId) {
		FwLogin loginer = null;
		try {
			loginer = (FwLogin)hibernateTemplate.get(FwLogin.class, accountId);
			if(loginer==null){
				loginer = new FwLogin();
				loginer.setId(accountId);
			}
			if(loginer.getErrorNum()==null){
				loginer.setErrorNum(Integer.valueOf("1"));
			}else{
				loginer.setErrorNum(loginer.getErrorNum()+1);
			}
			//超过五次就锁�?
			if(loginer.getErrorNum()>5){
				loginer.setIsLocked(Integer.valueOf("1"));
				loginer.setLockedTime(new Date());
			}
			hibernateTemplate.saveOrUpdate(loginer);
		} catch (Exception e) {
			log.error(e.getMessage());
		}

	}

	public void unlocked(Long accountId){
		FwLogin loginer = null;
		try {
			loginer = (FwLogin)hibernateTemplate.get(FwLogin.class, accountId);
			if(loginer==null){
				return;
			}
			loginer.setIsLocked(Integer.valueOf("0"));
			loginer.setErrorNum(Integer.valueOf("0"));
			hibernateTemplate.update(loginer);
		} catch (Exception e) {
			log.error(e.getMessage());
		}

	}

}
