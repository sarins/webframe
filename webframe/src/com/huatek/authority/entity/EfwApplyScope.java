package com.huatek.authority.entity;

import com.huatek.base.entity.BaseEntity;
/**
 * 数据权限的实体类
 *
 * @author winner
 *
 */
public class EfwApplyScope extends BaseEntity {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private String targetClass;
	private String targetField;
	private EfwBusinessModuleMap efwBusinessModuleMap;
	private Integer isEnabled;
	public String getTargetClass() {
		return targetClass;
	}
	public void setTargetClass(String targetClass) {
		this.targetClass = targetClass;
	}
	public String getTargetField() {
		return targetField;
	}
	public void setTargetField(String targetField) {
		this.targetField = targetField;
	}
	public Integer getIsEnabled() {
		return isEnabled;
	}
	public void setIsEnabled(Integer isEnabled) {
		this.isEnabled = isEnabled;
	}
	public EfwBusinessModuleMap getEfwBusinessModuleMap() {
		return efwBusinessModuleMap;
	}
	public void setEfwBusinessModuleMap(EfwBusinessModuleMap efwBusinessModuleMap) {
		this.efwBusinessModuleMap = efwBusinessModuleMap;
	}

}
