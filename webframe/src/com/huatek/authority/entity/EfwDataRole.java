package com.huatek.authority.entity;

import com.huatek.base.entity.BaseEntity;
/**
 * 数据权限的实体类
 *
 * @author Joey_deng
 *
 */
public class EfwDataRole extends BaseEntity {
	/**
	 *
	 */
	private static final long serialVersionUID = 5040316178480356197L;
	//数据角色名称
	private String daName;
	//数据角色的描述
	private String description;
	//状态：A可用，D禁用
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDaName() {
		return daName;
	}
	public void setDaName(String daName) {
		this.daName = daName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
