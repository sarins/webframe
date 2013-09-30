package com.huatek.authority.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.huatek.authority.entity.EfwDataRole;
import com.huatek.authority.entity.EfwUserDataAuthority;
import com.huatek.base.service.BaseServiceImpl;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;
import com.huatek.framework.util.CommonUtil;

public class EfwUserDataServiceImpl extends BaseServiceImpl implements
		EfwUserDataRoleService {
	/**
	 * 日志常量.
	 * **/
	private static final Logger LOGGER = Logger
			.getLogger(EfwDataRoleServiceImpl.class);

	//通过用户Id组查找所有的用户组信息。
	@Override
	public List<EfwUserDataAuthority> findDatasByIds(Long[] ids) {
		String param = CommonUtil.getIdSQLParam(ids);
		if (param != null) {
			return (List<EfwUserDataAuthority>) hibernateTemplate
					.find(
							"select t from EfwUserDataAuthority t,EfwDataRole m,FwAccount n where  t.fwAccount.id=n.id and t.efwDataRole.id=m.id and  t.id in ("
									+ param + ")", ids);
		}
		return null;
	}
	@Override
	public List<EfwUserDataAuthority> getObjectByAccountId(Long id) {
		return (List<EfwUserDataAuthority>) hibernateTemplate
				.find("select t from EfwUserDataAuthority t where t.fwAccount.id="
						+ id);
	}

	@Override
	public EfwUserDataAuthority getObjectById(Long id) {
		return (EfwUserDataAuthority) hibernateTemplate.get(
				EfwUserDataAuthority.class, id);
	}


	@Override
	public CutPageBean getPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList) {
		String totalRowsHsql = " select count(distinct t) from FwAccount t";
		String resultSql = "select distinct t from FwAccount t";
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql,
				resultSql, "order by t.id desc", pageBean, paramterList);
	}

	@Override
	public boolean saveOrUpdateEfwUserDataRole(EfwUserDataAuthority userDataRole) {

		// 如果名称重复
		if (isDuplicate(
				"from EfwUserDataAuthority t where t.fwAccount.acctName=?",
				new Object[] { userDataRole.getFwAccount().getAcctName() },
				userDataRole.getId())) {
			return false;
		}
		if (userDataRole.isNew()) {
			save(userDataRole);
		} else {
			merge(userDataRole);
		}
		return true;
	}
	//查找出所有的数据角色信息。
	@Override
	public List<EfwDataRole> getAllDataRolesList() {
		return (List<EfwDataRole>) hibernateTemplate.find("from EfwDataRole");

	}
	//查找出所有的用户信息
	@Override
	public List<FwAccount> getAllAcctList() {
		return (List<FwAccount>) hibernateTemplate.find("from FwAccount");
	}


	//查找该 用户对应的所有数据角色信息。
	@Override
	public List<EfwUserDataAuthority> findDatas(Long id) {
		return (List<EfwUserDataAuthority>) hibernateTemplate
				.find("select t from EfwUserDataAuthority t,EfwDataRole m,FwAccount n where t.efwDataRole.id=m.id and t.fwAccount.id=n.id and n.id="
						+ id);
	}

	/*
	 * 保存用
	 * 户修改的数据角色信息。
	 * */
	@Override
	public void saveOrUpdateDatas(EfwUserDataAuthority efwUserDataAuthority) {
		List<Long> maxNumbers = hibernateTemplate
				.find("select max(t.id) from EfwUserDataAuthority t");
		Long realNumber = null;
		if (maxNumbers.size() == 1) {
			realNumber = Long.valueOf("1");
		} else {
			realNumber = maxNumbers.get(0) + 1;
		}
		efwUserDataAuthority.setId(realNumber);
		hibernateTemplate.save(efwUserDataAuthority);

	}
	@Override
	public List<FwAccount> findAccountsByIds(Long[] ids) {
		String param = CommonUtil.getIdSQLParam(ids);
		if (param != null) {
			return (List<FwAccount>) hibernateTemplate
					.find(
							"select t from FwAccount t where t.id in ("
									+ param + ")", ids);
		}
		return null;
	}



}
