package com.huatek.authority.factory;

import java.util.Map;

public class ModuleAuthorityBean implements java.io.Serializable {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	Map<String,Map<String,FieldAuthority>> classAuthorityMap;
	String moduleId;

	public ModuleAuthorityBean(){

	}

	public ModuleAuthorityBean(Map<String,Map<String,FieldAuthority>> classAuthorityMap,String moduleId){
		this.classAuthorityMap = classAuthorityMap;
		this.moduleId = moduleId;
	}
	public Map<String, Map<String, FieldAuthority>> getClassAuthorityMap() {
		return classAuthorityMap;
	}
	public void setClassAuthorityMap(
			Map<String, Map<String, FieldAuthority>> classAuthorityMap) {
		this.classAuthorityMap = classAuthorityMap;
	}
	public String getModuleId() {
		return moduleId;
	}
	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

}
