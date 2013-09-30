/**
 *
 */
package com.huatek.dictionary.entity;

import java.util.Set;

import com.huatek.base.entity.NamedEntity;
import com.huatek.framework.entity.FwSystem;

/**
 * 数据字典类型实体.
 *
 * @author winner pan
 *
 */
public class FwCategory extends NamedEntity {

	/**
	 *
	 */
	private static final long serialVersionUID = -4912360231516449732L;

	/**
	 * 属性编码.
	 */
	private String code;
	/**
	 * 所属系统.
	 */
	private FwSystem fwSystem;
	/**
	 * 是否显示.
	 */
	private String display;
	/**
	 * 不显示.
	 */
	public static final String DISPLAY_NO = "D";
	/**
	 * 显示.
	 */
	public static final String DISPLAY_YES = "A";
	/***
	 * 字典集合.
	 */
	private Set<FwDictionary> fwDictionarySet;
	/**
	 * 获取是否显示属性.
	 * @return display
	 */
	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public Set<FwDictionary> getFwDictionarySet() {
		return fwDictionarySet;
	}

	public void setFwDictionarySet(Set<FwDictionary> fwDictionarySet) {
		this.fwDictionarySet = fwDictionarySet;
	}

	public FwSystem getFwSystem() {
		return fwSystem;
	}

	public void setFwSystem(FwSystem fwSystem) {
		this.fwSystem = fwSystem;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}
