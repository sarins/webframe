package com.huatek.workflow.service;

import java.util.Map;


/***
 * 用于流程转移条件的判断服务接口.
 * @author winner_pan
 *
 */
public interface TransferExpressService extends java.io.Serializable {
	/**
	 *
	 * @param variableMap 环境变量Map
	 * @return 是否匹配
	 */
	boolean isMatch(final Map<Object,Object> variableMap);
}
