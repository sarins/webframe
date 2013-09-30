package com.huatek.framework.service;

import java.util.List;

import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.entity.FwSource;

public interface LoginService {
	 List<FwSource> loadAllFwSource();
	 FwAccount loadUserAuthority(final Long accountId);
	 abstract void initAccountDefaultAuthority(FwAccount account);
	 abstract List<FwSource> getAccountPermitSource(Long accountId);
	 void flushCache(boolean islocal);
}
