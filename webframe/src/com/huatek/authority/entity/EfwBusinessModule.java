package com.huatek.authority.entity;

import java.util.Set;
import com.huatek.base.entity.BaseEntity;

/**
 * 数据权限的实体类
 *
 * @author Allen_Huang
 *
 */
public class EfwBusinessModule extends BaseEntity {

	/**
	 *
	 */
	private static final long serialVersionUID = -5992809026876583514L;

	/**
	 * 业务模块名称.
	 */
	private String name;

	/**业务模块描述.
	 */
	private String title;
	/**
	 * 菜单id.
	 */
	private String menuIds;
	/**
	 * 业务模块状态
	 */
	private String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getName() {
		return name;
	}
	public EfwBusinessModule(){

	}
	public EfwBusinessModule(Long id){
		this.setId(id);
	}
	public void setName(String name) {
		this.name = name;
	}
	private Set<EfwBusinessModuleMap> efwBusinessModuleMapSet;

	public Set<EfwBusinessModuleMap> getEfwBusinessModuleMapSet() {
		return efwBusinessModuleMapSet;
	}
	public void setEfwBusinessModuleMapSet(
			Set<EfwBusinessModuleMap> efwBusinessModuleMapSet) {
		this.efwBusinessModuleMapSet = efwBusinessModuleMapSet;
	}
	public String getMenuIds() {
		return menuIds;
	}
	public void setMenuIds(String menuIds) {
		this.menuIds = menuIds;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}


}
