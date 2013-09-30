package com.huatek.authority.entity;

import com.huatek.base.entity.BaseEntity;

public class EfwDataRoleAuthority extends BaseEntity {

	/**
	 *
	 */
	private static final long serialVersionUID = -937544392966068924L;
	// 业务模块ID
	private EfwBusinessModule efwBusinessModule;

	//实体
	private EfwSourceEntity efwSourceEntity;


	//字段值
	private String fieldValue;

	// 数据ID
	private String dataId;

	// 数据角色
	private EfwDataRole efwDataRole;

	private String fieldName;



	public EfwDataRole getEfwDataRole() {
		return efwDataRole;
	}

	public void setEfwDataRole(EfwDataRole efwDataRole) {
		this.efwDataRole = efwDataRole;
	}


	public EfwBusinessModule getEfwBusinessModule() {
		return efwBusinessModule;
	}

	public void setEfwBusinessModule(EfwBusinessModule efwBusinessModule) {
		this.efwBusinessModule = efwBusinessModule;
	}


	public String getFieldValue() {
		return fieldValue;
	}

	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}

	public EfwSourceEntity getEfwSourceEntity() {
		return efwSourceEntity;
	}

	public void setEfwSourceEntity(EfwSourceEntity efwSourceEntity) {
		this.efwSourceEntity = efwSourceEntity;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getDataId() {
		return dataId;
	}

	public void setDataId(String dataId) {
		this.dataId = dataId;
	}

}
