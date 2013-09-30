package com.huatek.authority.entity;

import java.util.List;

import com.huatek.base.entity.BaseEntity;
import com.huatek.dictionary.entity.FwDictionary;

/***
 * 用于过滤某些实体的指定字段数据.
 * @author winner pan
 *
 */
public class EfwClassFieldAuthority extends BaseEntity{
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	/***
	 * 类名称.
	 */
	private Class authorityClass;

	/***
	 * 字段名称.
	 */
	private String fieldName;
	/***
	 * 描述.
	 */
	private String comment;

	/***
	 * 字段数据范围;
	 */

	private List<FwDictionary> fieldValueList;

	public Class getAuthorityClass() {
		return authorityClass;
	}

	public void setAuthorityClass(Class authorityClass) {
		this.authorityClass = authorityClass;
	}

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public List<FwDictionary> getFieldValueList() {
		return fieldValueList;
	}

	public void setFieldValueList(List<FwDictionary> fieldValueList) {
		this.fieldValueList = fieldValueList;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}


}
