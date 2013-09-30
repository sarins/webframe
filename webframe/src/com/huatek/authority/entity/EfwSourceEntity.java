package com.huatek.authority.entity;

import com.huatek.base.entity.BaseEntity;
/**
 * 数据权限的实体类
 *
 * @author winner
 *
 */
public class EfwSourceEntity extends BaseEntity {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 实体名称.
	 */
	private String entityName;
	/***
	 * 实体类.
	 */
	private String entityClass;
	/***
	 * 实体权限字段.
	 */
	private String entityField;
	/**
	 * 通过其他服务接口获取权限数据.
	 * 返回值为fwDiction的数据列表.
	 */
	private String queryUrl;
	/**
	 * 输出值查询参数.
	 */
	private String queryParam;
	/***
	 * 输出值的类.
	 */
	private String outputClass;
	/***
	 * 输出值的标题名称.
	 */
	private String outputTitle;
	/***
	 * 输出值的key值.
	 */
	private String outputKey;
	/***
	 * 输出权限的数据值.
	 */
	private String outputValue;
	/***
	 * 实体别名.
	 * 可能有多个别名，比如多个视图等，使用的实体还是同一个.
	 * 每一个别名和具体的视图实体名是一样的，多个视图实体名
	 * 使用分号;隔开.
	 */
	private String entityAlias;
	/**
	 * 是否允许为空.
	 */
	private Integer notNull;

	public String getEntityName() {
		return entityName;
	}
	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}
	public String getEntityClass() {
		return entityClass;
	}
	public void setEntityClass(String entityClass) {
		this.entityClass = entityClass;
	}

	public String getEntityField() {
		return entityField;
	}
	public void setEntityField(String entityField) {
		this.entityField = entityField;
	}


	public String getQueryUrl() {
		return queryUrl;
	}
	public void setQueryUrl(String queryUrl) {
		this.queryUrl = queryUrl;
	}

	public String getEntityAlias() {
		return entityAlias;
	}
	public void setEntityAlias(String entityAlias) {
		this.entityAlias = entityAlias;
	}


	public String getQueryParam() {
		return queryParam;
	}
	public void setQueryParam(String queryParam) {
		this.queryParam = queryParam;
	}
	public String getOutputClass() {
		return outputClass;
	}
	public void setOutputClass(String outputClass) {
		this.outputClass = outputClass;
	}
	public String getOutputTitle() {
		return outputTitle;
	}
	public void setOutputTitle(String outputTitle) {
		this.outputTitle = outputTitle;
	}
	public String getOutputKey() {
		return outputKey;
	}
	public void setOutputKey(String outputKey) {
		this.outputKey = outputKey;
	}
	public String getOutputValue() {
		return outputValue;
	}
	public void setOutputValue(String outputValue) {
		this.outputValue = outputValue;
	}

	public boolean isApplyQueryParam(){
		if(this.queryParam!=null&&this.entityClass.equals(this.outputClass)){
			return true;
		}
		return false;
	}
	public Integer getNotNull() {
		return notNull;
	}
	public void setNotNull(Integer notNull) {
		this.notNull = notNull;
	}

}
