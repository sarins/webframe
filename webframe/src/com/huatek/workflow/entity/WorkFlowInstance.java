package com.huatek.workflow.entity;

import java.util.HashMap;
import java.util.Map;

import com.huatek.base.entity.BaseEntity;

public class WorkFlowInstance extends BaseEntity {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	/***
	 * 流程环境变量.
	 */
	public final Map<Object, Object> variableMap = new HashMap<Object, Object>();

}
