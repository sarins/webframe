package com.huatek.framework.service;

import java.util.List;

import com.huatek.base.service.BaseService;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
public interface AccountService extends BaseService {
	 void saveAccount(FwAccount account);
	 void processAssignDuty(Long accountId,Long[] dutyId);
	 FwAccount getAccountById(Long accountId);
	 List<FwAccount> getAvailableAccount();
	 CutPageBean getAccountPageBean(CutPageBean pageBean,List<CommonBean> paramterList);
	 void deleteAccount(Long accountId, Long[] dutyId);
	/**
	 * 根据用户名称查找用户.
	 * @param acctName 用户名称
	 * @return 用户列表
	 */
	List<FwAccount> getAccountByAcctName(String acctName);

	/**
	 * 更新用户修改后的密码.
	 *
	 * @param user
	 *            用户的对象
	 */
	void updatePwd(FwAccount user);
}
