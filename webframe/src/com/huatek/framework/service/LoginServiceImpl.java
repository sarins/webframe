package com.huatek.framework.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.huatek.base.tree.TreeUtil;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwAccountDuty;
import com.huatek.framework.entity.FwSource;
import com.huatek.framework.entity.FwSrcAction;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.util.CommonUtil;

@Service
public class LoginServiceImpl implements LoginService {
	@Resource(name = "hibernateTemplate")
	public HibernateTemplate hibernateTemplate;

	public FwAccount loadUserAuthority(final Long accountId) {
		if (accountId == null) {
			throw new BusinessRuntimeException("error.account.id.empty");
		}
		FwAccount account = (FwAccount) hibernateTemplate.get(FwAccount.class,
				accountId);
		if (account == null) {
			throw new BusinessRuntimeException("error.account.notexisted");
		}
		//获取角色列表
		Iterator<FwAccountDuty> it = account.getFwAccountDuties().iterator();
		while(it.hasNext()){
			FwAccountDuty  fwAccountDuty = it.next();
			fwAccountDuty.getFwDuty().getName();
		}
		//init account default group
		account.getFwGroup().getName();
		// get user default authority
		initAccountDefaultAuthority(account);
		account.setPermitSource(getAccountPermitSource(account.getId()));
		account.setUserMenuTree(getUserMenuTree(account.getPermitSource()));
		Map<String, FwSource> userMenuMap = new HashMap<String, FwSource>();
		for(FwSource fwSource:account.getUserMenuTree()){
			userMenuMap.put(fwSource.getId().toString(), fwSource);
		}
		account.setUserMenuMap(userMenuMap);
		return account;
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see
	 * com.huatek.framework.service.LoginService1#initAccountDefaultAuthority
	 * (com.huatek.framework.FwAccount, java.util.Hashtable)
	 */
	@SuppressWarnings("unchecked")
	public void initAccountDefaultAuthority(final FwAccount account) {
		String defaultActionSql = "select distinct t from FwSrcAction "
				+ " t,FwDutyAction d,FwAccountDuty a "
				+ " where t.id=d.fwSrcAction.id "
				+ " and d.fwDuty.id=a.fwDuty.id " + " and a.fwAccount.id=? "
				//+ " and a.fwDuty.fwSystem.sysCode=? "
				+ " and d.fwDuty.status = 'A'" + " order by t.actionOrder asc";
		List<FwSrcAction> permitActionList = hibernateTemplate.find(
				defaultActionSql, account.getId());
		HashMap<String, List<FwSrcAction>> menusActionMap = new HashMap<String, List<FwSrcAction>>();
		HashMap permitActionMap = new HashMap();
		for (FwSrcAction fwSrcAction : permitActionList) {
			if(menusActionMap.containsKey(fwSrcAction.getFwSource().getId().toString())){
				menusActionMap.get(fwSrcAction.getFwSource().getId().toString()).add(fwSrcAction);
			}else{
				List<FwSrcAction> menusActionList = new ArrayList();
				menusActionList.add(fwSrcAction);
				menusActionMap.put(fwSrcAction.getFwSource().getId().toString(), menusActionList);
			}
			String url = fwSrcAction.getActionPath();
			if (url == null) {
				url = fwSrcAction.getFwSource().getSourceCode();
			}
			if(url.indexOf("?")>0){
				url = url.substring(0,url.indexOf("?"));
			}
			String menuId = fwSrcAction.getFwSource().getId().toString();
			String[] methods = fwSrcAction.getActionMethods().split(";");
			for (String method : methods) {
				if (method.trim().length() > 0) {
					String actionKey = CommonUtil.getURL(url, menuId, method);
					if(!permitActionMap.containsKey(actionKey)){
						permitActionMap.put(actionKey,fwSrcAction);
					}

				}
			}
		}
		account.setMenusActionMap(menusActionMap);
		account.setPermitActionMap(permitActionMap);
	}

	/*
	 * (non-Javadoc)
	 *
	 * @see
	 * com.huatek.framework.service.LoginService1#getAccountPermitSource(java
	 * .lang.Long, java.util.Vector)
	 */
	@SuppressWarnings("unchecked")
	public List<FwSource> getAccountPermitSource(Long accountId) {
		String HSQl = "select distinct t from FwSource "
				+ " t,FwSrcAction s,FwDutyAction d,FwAccountDuty a "
				+ " where t.id=s.fwSource.id " + " and s.id=d.fwSrcAction.id "
				+ " and d.fwDuty.id=a.fwDuty.id " + " and a.fwAccount.id=? "
				//+ " and a.fwDuty.fwSystem.sysCode=? "
				+ " and a.fwDuty.status='A'";
		List<FwSource> list = hibernateTemplate.find(HSQl
				+ " order by t.style asc",accountId);
		return list;

	}

	@SuppressWarnings("unchecked")
	private List<FwSource> getUserMenuTree(final List<FwSource> inputlist) {
		List<FwSource> list = TreeUtil.getMenuTree(inputlist, FwSource.class, hibernateTemplate);
		for (int i = 0; i < list.size(); i++) {
			FwSource source = list.get(i);
			if (source.getIsMenu() == 0) {
				list.remove(i);
				i--;
				continue;
			}
			source.setNodeLabel(source.getName());
			source.setTitle(source.getName());
			source.setAlt(source.getAlt());
			source.setLink(source.getSourceCode()
					+ (source.getSourceCode().indexOf("?") > 0 ? "&" : "?")
					+ "menuId=" + source.getId());
		}
		com.huatek.base.tree.TreeEntity.generalTreeNode(false, "", "", list);
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<FwSource> loadAllFwSource() {
		return hibernateTemplate
				.find("from FwSource t where t.status='A' order by t.style ASC");
	}

	public List<FwSource> getMenuTree(List<FwSource> childSourceList) {
		List<FwSource> allSourceList = loadAllFwSource();
		for (int i = 0; i < allSourceList.size(); i++) {
			FwSource source = allSourceList.get(i);
			if (!TreeUtil.isContain(source, childSourceList)) {
				allSourceList.remove(i);
				i--;
			}
		}
		return allSourceList;
	}

	public void flushCache(boolean islocal) {

	}

}
