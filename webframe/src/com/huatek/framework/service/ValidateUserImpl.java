package com.huatek.framework.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.IValidateUser;
import com.huatek.framework.security.LdapValidateFace;
import com.huatek.framework.security.SecurityLoginInterFace;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.EncryptService;

public class ValidateUserImpl implements IValidateUser {
	private LdapValidateFace ldapValidate;
	private HibernateTemplate hibernateTemplate;

	@Autowired
	EncryptService encryptServiceImpl;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void setLdapValidate(LdapValidateFace ldapValidate) {
		this.ldapValidate = ldapValidate;
	}
	SecurityLoginInterFace securityLogin;
	public void setSecurityLogin(SecurityLoginInterFace securityLogin) {
		this.securityLogin = securityLogin;
	}

	public Object getUser(String userName, String password){
		if(CommonUtil.isZeroLengthTrimString(userName)||CommonUtil.isZeroLengthTrimString(password)){
			throw new BusinessRuntimeException("username.and.password.not.permit.empty");
		}
		FwAccount account = new FwAccount();
		account.setAcctName(userName);
		if (ldapValidate != null) {
			if(ldapValidate.isLdapUser(userName,password)){
				account = (FwAccount)ldapValidate.updateLocalUserInfo(userName, password);
				return account;
			}else{
				throw new BusinessRuntimeException("login.account.or.password.isIncorrect");
			}

		}
		/*if (password == null) {
			throw new BusinessLogicException("login.password.isrequired");
		}*/
		account = (FwAccount)getUserByAccount(userName);
		if (account == null) {
			throw new BusinessRuntimeException("login.account.isIncorrect");
		}
		String md5Password = encryptServiceImpl.encrypt(password);
		if (!md5Password.equals(account.getAcctPwd())) {
			if (securityLogin != null) {
				securityLogin.passwordErrorNumRecord(account.getId());
			}
			throw new BusinessRuntimeException("login.password.isIncorrect");
		}
		if (securityLogin != null) {
			securityLogin.unlocked(account.getId());
		}
		if(account.getStatus().equals("D")){
            throw new BusinessRuntimeException("login.account.disabled");
        }
		//get other data
		return account;
	}
	@SuppressWarnings("unchecked")
	private Object getUserByAccount(String userName){
		List list = hibernateTemplate.find("from FwAccount t where Lower(t.acctName)=?",userName.toLowerCase());
		if(list.size()==1){
			return list.get(0);
		}
		return null;

	}

}
