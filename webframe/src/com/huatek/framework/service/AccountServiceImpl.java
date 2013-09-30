package com.huatek.framework.service;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwAccountDuty;
import com.huatek.framework.entity.FwDuty;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.GlobalFilterManagement;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.EncryptService;

public class AccountServiceImpl extends BaseServiceImpl implements
		AccountService {

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		super.hibernateTemplate = hibernateTemplate;
	}

	EncryptService encryptServiceImpl;

	public void saveAccount(FwAccount account) {
		if(account.getFwGroup()==null){
			account.setFwGroup(new FwGroup());
		}
		if(account.getFwGroup().isNew()){
			account.getFwGroup().setId(Long.valueOf("3"));
		}
		if (account.isNew()) {
			account.setAcctPwd(encryptServiceImpl.encrypt("111111"));
			save(account);
		} else {
			merge(account);
		}

	}

	public void processAssignDuty(Long accountId, Long[] dutyId) {
		FwAccount account = (FwAccount) super.getHibernateTemplate().get(
				FwAccount.class, accountId);
		account.getFwAccountDuties().clear();
		super.hibernateTemplate.flush();
		for (Long curDutyId : dutyId) {
			FwDuty fwDuty = new FwDuty();
			fwDuty.setId(curDutyId);
			FwAccountDuty actDuty = new FwAccountDuty();
			actDuty.setFwDuty(fwDuty);
			actDuty.setFwAccount(account);
			account.getFwAccountDuties().add(actDuty);
		}
		super.update(account);
		super.hibernateTemplate.flush();

	}

	public FwAccount getAccountById(Long accountId) {
	    FwAccount fwAccount= (FwAccount) hibernateTemplate.get(FwAccount.class, accountId);
	    if(fwAccount==null){
	        throw new BusinessRuntimeException("error.data.deleted");
	    }
	    return fwAccount;
	}

	public CutPageBean getAccountPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList) {
		String condition = GlobalFilterManagement.getSystemGroupFilter("t");
		String totalRowsHsql = " select count(t) from FwAccount t where "+condition;
		String resultSql = "from FwAccount t where "+condition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.id asc", pageBean, paramterList);
	}

	@SuppressWarnings("unchecked")
	public List<FwAccount> getAvailableAccount() {
		return hibernateTemplate.find("from FwAccount t where t.status='A' and "+GlobalFilterManagement.getSystemGroupFilter("t"));
	}

	@Override
	public void deleteAccount(Long accountId, Long[] dutyId) {
		FwAccount account = (FwAccount) super.getHibernateTemplate().get(FwAccount.class, accountId);
		account.getFwAccountDuties().clear();
		super.hibernateTemplate.flush();
		super.update(account);
		super.hibernateTemplate.flush();

	}
	/**
	 * 根据用户名称查找用户.
	 * @param acctName 用户名称
	 * @return 用户列表
	 */
	public List<FwAccount> getAccountByAcctName(String acctName) {

		return hibernateTemplate.find("from FwAccount t where t.acctName=?",acctName);
	}



	/**
	 * 更新用户修改后的密码.
	 *
	 * @param user
	 *            用户的对象
	 */
	public void updatePwd(final FwAccount user) {
		FwAccount account = ThreadLocalClient.get().getOperator();
		account.setAcctPwd(encryptServiceImpl.encrypt(user.getNewPwd()));
		hibernateTemplate.update(account);
	}

	public EncryptService getEncryptServiceImpl() {
		return encryptServiceImpl;
	}

	public void setEncryptServiceImpl(EncryptService encryptServiceImpl) {
		this.encryptServiceImpl = encryptServiceImpl;
	}

}
