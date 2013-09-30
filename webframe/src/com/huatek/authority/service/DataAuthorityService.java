package com.huatek.authority.service;

import java.util.Map;

import com.huatek.authority.factory.FieldAuthority;

/****
 * 本类用于获取用户的数据权限.
 *
 * @author winner pan
 */
public interface DataAuthorityService {
	/***
	 * 获取用户的数据权限.
	 *
	 * @param userId
	 *            登录用户ID.
	 * @return Map<Class<? extends BaseEntity>,String> 类和对应的权限列表.
	 */
	Map<String, Map<String,Map<String,FieldAuthority>>> getUserDataAuthority(long userId);

}
