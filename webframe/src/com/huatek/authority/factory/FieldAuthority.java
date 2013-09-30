package com.huatek.authority.factory;

public class FieldAuthority implements java.io.Serializable{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	public FieldAuthority(){

	}
	public FieldAuthority(String fieldName){
		this.fieldName = fieldName;
	}
	public FieldAuthority(String fieldName, String authorityDatas){
		this.fieldName = fieldName;
		this.authorityDatas = authorityDatas;
	}
	public FieldAuthority(String entityName,String fieldName, String authorityDatas){
		this.entityName = entityName;
		this.fieldName = fieldName;
		this.authorityDatas = authorityDatas;
	}
	/**
	 * 实体名称.
	 */
	private String entityName;
	/***
	 * 字段名称
	 */
	private String fieldName;
	/***
	 * 实体对应的权限列表.
	 */
	private String authorityDatas;
	/***
	 * 不在过滤范围的数据.
	 * 不能设置作为权限数据设置.
	 * 表现为：_prefix.字段名=某个数据   and _prefix.字段名=某个数据
	 */
	private String queryParam;
	/***
	 * 是否必填.
	 * 1必填，0非必填.
	 */
	private Integer notNull;

	public String getFieldName() {
		return fieldName;
	}
	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getAuthorityDatas() {
		return authorityDatas;
	}

	public String getAuthorityDatas(String prefixName) {
		if(this.notNull==1){
			return "("+prefixName+"."+fieldName+" in ("+authorityDatas+"))";
		}
		return "("+prefixName+"."+fieldName+" is null or "+prefixName+"."+fieldName+" in ("+authorityDatas+"))";
	}

	public void setAuthorityDatas(String authorityDatas) {
		this.authorityDatas = authorityDatas;
	}
	/***
	 *
	 * @param prefixName 实体别名
	 * @return 返回对应的SQL语句
	 */
	public String getFieldAuthoritySql(String prefixName){
		if(queryParam==null){
			return prefixName+"."+fieldName+" in ("+authorityDatas+")";
		}
		return "( "+prefixName+"."+fieldName+" is null or exists ( select 1 from "+this.entityName+" _tb where ("+queryParam.replaceAll("_prefix", "_tb")+" or _tb."+fieldName+" in ("+authorityDatas+") ) and _tb="+prefixName+"."+fieldName+"))";
	}

	public String getEntityName() {
		return entityName;
	}
	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}
	public String getQueryParam() {
		return queryParam;
	}
	public void setQueryParam(String queryParam) {
		this.queryParam = queryParam;
	}
	public Integer getNotNull() {
		return notNull;
	}
	public void setNotNull(Integer notNull) {
		this.notNull = notNull;
	}


}
