package com.huatek.framework.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Hashtable;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.BasicAttribute;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.ModificationItem;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.naming.ldap.Control;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;
import javax.naming.ldap.PagedResultsControl;
import javax.naming.ldap.PagedResultsResponseControl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwAccountDuty;
import com.huatek.framework.entity.FwDuty;
import com.huatek.framework.security.LdapValidateFace;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.EncryptService;

public class LdapValidateServiceImpl implements LdapValidateFace {
	private static final Logger LOGGER = Logger.getLogger(LdapValidateServiceImpl.class);
	private static final String EMAIL_DOMAIN = "huatek.com";
	//private static final String BaseDomain = "DC=huatekxa,DC=com";
	protected static final String LDAP_LCF = "com.sun.jndi.ldap.LdapCtxFactory";
	protected static final String LDAP_AUTHORITY_MODE = "simple";
	protected static String ldapURL = "LDAP://192.168.128.92:389/DC=huatekxa,DC=com";
	private static  String adminName = "winner_pan";
	private static  String adminPassword = "prs654321";

	private HibernateTemplate hibernateTemplate;
	@Autowired
	EncryptService encryptServiceImpl;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}



	@SuppressWarnings("unchecked")
	public boolean isLdapUser(String userName, String password) {
		if(CommonUtil.isZeroLengthTrimString(userName)||CommonUtil.isZeroLengthTrimString(password)){
			return false;
		}
		boolean bRtn = false;
		Hashtable env = new Hashtable(4);
		env.put(Context.INITIAL_CONTEXT_FACTORY, LDAP_LCF);
		env.put(Context.PROVIDER_URL, ldapURL);
		env.put(Context.SECURITY_AUTHENTICATION, LDAP_AUTHORITY_MODE);
		env.put(Context.SECURITY_PRINCIPAL, "huatekxa\\" + userName);
		env.put(Context.SECURITY_CREDENTIALS, password);
		DirContext ctx = null;
		try {
			ctx = new InitialDirContext(env);
			bRtn = true;

		} catch (Exception ex) {
			if(LOGGER.isDebugEnabled()){
				LOGGER.debug(ex.getMessage());
			}
		} finally {
			if (ctx != null) {
				try {
					ctx.close();
				} catch (NamingException e) {
					e.printStackTrace();
				}
			}
		}
		return (bRtn);
	}

	@SuppressWarnings("unchecked")
	private LdapContext getLdapContext(String userName,String password) throws NamingException{
		Hashtable env = new Hashtable();
		env.put(Context.INITIAL_CONTEXT_FACTORY,LDAP_LCF);
		env.put(Context.SECURITY_AUTHENTICATION, LDAP_AUTHORITY_MODE);
		env.put(Context.SECURITY_PRINCIPAL, "huatekxa\\"+userName);
		env.put(Context.SECURITY_CREDENTIALS, password);
		// connect to my domain controller
		env.put(Context.PROVIDER_URL,ldapURL);
		return new InitialLdapContext(env, null);
	}


	public boolean updateLdapUserPassword(String userName, String password,
			String newPassword,HashMap<String,String> ldapUserMap) {
		String userKey = userName.toLowerCase()+"@"+EMAIL_DOMAIN;
		String userCN = ldapUserMap.get("mail: "+userKey);
		LdapContext ctx = null;
		try {
			ctx = getLdapContext(userName,password);
			ModificationItem[] mods = new ModificationItem[1];
			//Firstly delete the "unicdodePwd" attribute, using the old password
			//Then add the new password,Passwords must be both Unicode and a quoted string
			//String oldQuotedPassword = "\"" + password + "\"";
			//byte[] oldUnicodePassword = oldQuotedPassword.getBytes("UTF-16LE");
			String newQuotedPassword = "\"" + newPassword + "\"";
			byte[] newUnicodePassword = newQuotedPassword.getBytes("UTF-16LE");
			//mods[0] = new ModificationItem(DirContext.REMOVE_ATTRIBUTE, new BasicAttribute("unicodePwd", oldUnicodePassword));
			mods[0] = new ModificationItem(DirContext.REPLACE_ATTRIBUTE,  new BasicAttribute("unicodePwd",newUnicodePassword));
			// Perform the update
			ctx.modifyAttributes(userCN, mods);
		} catch (NamingException e) {
			if(LOGGER.isDebugEnabled()){
				LOGGER.debug(e.getMessage());
			}
			return false;
		} catch (UnsupportedEncodingException e) {
			if(LOGGER.isDebugEnabled()){
				LOGGER.debug(e.getMessage());
			}
			return false;
		}catch(Exception e){
			if(LOGGER.isDebugEnabled()){
				LOGGER.debug(e.getMessage());
			}
			return false;
		}
		return true;
	}
	@SuppressWarnings("unchecked")
	public HashMap<String,String> getLdapUserMap(){
		HashMap<String,String> map = new HashMap<String,String>();
		LdapContext ctx = null;
		try {
			ctx = getLdapContext(adminName,adminPassword);
			String searchBase = "";
			String searchFilter = "(&(objectClass=user)(mail=*))";
			// Create the search controls
			SearchControls searchCtls = new SearchControls();

			// Specify the attributes to return
			String returnedAtts[] = { "mail" };
			searchCtls.setReturningAttributes(returnedAtts);

			// Specify the search scope
			searchCtls.setSearchScope(SearchControls.SUBTREE_SCOPE);

			// Set the page size and initialize the cookie that we pass back in
			// subsequent pages
			int pageSize = 10;
			byte[] cookie = null;

			// Request the paged results control
			Control[] ctls = new Control[] { new PagedResultsControl(pageSize,true) };
			ctx.setRequestControls(ctls);

			// initialize counter to total the results
			int totalResults = 0;

			// Search for objects using the filter

			do {
				NamingEnumeration results = ctx.search(searchBase,
						searchFilter, searchCtls);

				// loop through the results in each page

				while (results != null && results.hasMoreElements()) {
					SearchResult sr = (SearchResult) results.next();

					// print out the name
					map.put(sr.getAttributes().get("mail").toString().toLowerCase(), sr.getName());
					// increment the counter
					totalResults++;

				}

				// examine the response controls
				cookie = parseControls(ctx.getResponseControls());

				// pass the cookie back to the server for the next page
				ctx.setRequestControls(new Control[] { new PagedResultsControl(
						pageSize, cookie, Control.CRITICAL) });

			} while ((cookie != null) && (cookie.length != 0));


		} catch (NamingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(ctx!=null){
					ctx.close();
				}
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return map;
	}

	public FwAccount updateLocalUserInfo(String userName, String password) {
		FwAccount account = new FwAccount();
		account.setAcctName(userName);
		try {
			String md5Password = encryptServiceImpl.encrypt(password);
			/*account.setAcctPwd( passwordEncryptor.encrypt(password));*/
			account = (FwAccount) loadSampleObject(account);
			if (account == null) {
				account = new FwAccount();
				account.setAcctName(userName);
				account.setUserName(userName);
				account.setAcctPwd(md5Password);
				account.setStatus("A");
				FwAccountDuty ad = new FwAccountDuty();
				ad.setFwAccount(account);
				FwDuty duty = (FwDuty) hibernateTemplate.get(FwDuty.class,Long.valueOf("101"));
				ad.setFwDuty(duty);
				account.setFwAccountDuties(new HashSet<FwAccountDuty>());
				account.getFwAccountDuties().add(ad);
				hibernateTemplate.save(account);
				//hibernateTemplate.save(ad);
			} else {
				account.setAcctPwd(md5Password);
				hibernateTemplate.update(account);
			}
			return account;
		} catch (Exception e) {
			if(LOGGER.isDebugEnabled()){
				LOGGER.debug(e.getMessage());
			}
			return null;
		}
	}


	@SuppressWarnings("unchecked")
	private Object loadSampleObject(Object obj) {
		List list = hibernateTemplate.findByExample(obj);
		if (list.size() == 1) {
			return list.get(0);
		}
		return null;

	}
/*	 @SuppressWarnings("unchecked")
	 public static void modifyAttributes(String userName, String oldPassword,String password) throws  NamingException {
		  Hashtable   env   =   new   Hashtable(4);
		  env.put(   Context.INITIAL_CONTEXT_FACTORY,ldapCF);
		  env.put(   Context.PROVIDER_URL,ldapURL);
		  env.put(   Context.SECURITY_AUTHENTICATION,ldapAuthMode);
		  env.put(   Context.SECURITY_PRINCIPAL,"huatekxa\\"+userName);
		  env.put(   Context.SECURITY_CREDENTIALS,oldPassword);
		  DirContext   context   = null;
		  try   {
			  context = new   InitialDirContext(env);
			 context.getEnvironment();
		  }
		  catch(Exception   ex)   {
			  ex.printStackTrace();
		  }
		  try {
	            ModificationItem[] mods = new ModificationItem[1];
	            String newQuotedPassword = "\"" + password + "\"";
	            byte[] newUnicodePassword = newQuotedPassword.getBytes("UTF-16LE");
	             mods[0] = new ModificationItem(DirContext.REPLACE_ATTRIBUTE,new BasicAttribute("userPassword",newUnicodePassword));
	             context.modifyAttributes("huatekxa\\"+userName, mods);
	             System.out.println("Reset Password for: " + userName);
	             context.close();
	         } catch (Exception e) {
	             e.printStackTrace();
	         }finally{
	        	 if(context!=null){
					  try {
						 context.close();
					} catch (NamingException e) {
						e.printStackTrace();
					}
				  }
	         }
		} */
	private static byte[] parseControls(Control[] controls) throws NamingException {

		byte[] cookie = null;

		if (controls != null) {

			for (int i = 0; i < controls.length; i++) {
				if (controls[i] instanceof PagedResultsResponseControl) {
					PagedResultsResponseControl prrc = (PagedResultsResponseControl) controls[i];
					cookie = prrc.getCookie();
					//System.out.println(">>Next Page \n");
				}
			}
		}

		return (cookie == null) ? new byte[0] : cookie;
	}

}
