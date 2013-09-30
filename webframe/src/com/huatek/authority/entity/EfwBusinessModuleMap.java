package com.huatek.authority.entity;

import com.huatek.base.entity.BaseEntity;
/**
 * 数据权限的实体类
 *
 * @author Apple Liu
 *
 */
public class EfwBusinessModuleMap extends BaseEntity {
	private static final long serialVersionUID = 1L;
	private EfwSourceEntity efwSourceEntity;
	private EfwBusinessModule efwBusinessModule;
	public EfwBusinessModule getEfwBusinessModule() {
		return efwBusinessModule;
	}

	public void setEfwBusinessModule(EfwBusinessModule efwBusinessModule) {
		this.efwBusinessModule = efwBusinessModule;
	}

	private String name;

	public EfwSourceEntity getEfwSourceEntity() {
		return efwSourceEntity;
	}

	public void setEfwSourceEntity(EfwSourceEntity efwSourceEntity) {
		this.efwSourceEntity = efwSourceEntity;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
