package com.huatek.dictionary.entity;

import com.huatek.base.entity.NamedEntity;
/****
 * 实现系统数据字典的管理.
 *
 * @author 潘仁胜
 *
 */
public class FwDictionary extends NamedEntity {

	/**
	 *
	 */
	private static final long serialVersionUID = 672390836669453253L;

	//属性编码
	private String code;
	//字典排序
	private String orderNum;
	//字典目录
	private FwCategory fwCategory;


	public FwDictionary(){

	}

	/***
	 * 构造函数.
	 * @param id 实例ID
	 * @param code 实例编码
	 * @param name 实例名称
	 */
	public FwDictionary(Long id,String code,String name){
		super.setId(id);
		this.code = code;
		super.setName(name);
	}

	public FwCategory getFwCategory() {
		return fwCategory;
	}

	public void setFwCategory(FwCategory fwCategory) {
		this.fwCategory = fwCategory;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
}
