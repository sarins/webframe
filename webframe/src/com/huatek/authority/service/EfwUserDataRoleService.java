package com.huatek.authority.service;

import java.util.List;

import com.huatek.authority.entity.EfwDataRole;
import com.huatek.authority.entity.EfwUserDataAuthority;
import com.huatek.base.service.BaseService;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;

public interface EfwUserDataRoleService extends BaseService {

	CutPageBean getPageBean(CutPageBean pageBean, List<CommonBean> paramterList);

	EfwUserDataAuthority getObjectById(Long id);

	List<EfwUserDataAuthority> findDatasByIds(Long[] ids);

	boolean saveOrUpdateEfwUserDataRole(EfwUserDataAuthority userDataRole);

	List<EfwDataRole> getAllDataRolesList();

	List<FwAccount> getAllAcctList();

	List<EfwUserDataAuthority> findDatas(Long id);

	void saveOrUpdateDatas(EfwUserDataAuthority efwUserDataAuthority);

	List<EfwUserDataAuthority> getObjectByAccountId(Long id);

	List<FwAccount> findAccountsByIds(Long[] ids);

	
}
