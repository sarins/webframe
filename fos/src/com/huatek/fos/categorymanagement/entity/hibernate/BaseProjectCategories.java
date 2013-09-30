package com.huatek.fos.categorymanagement.entity.hibernate;

import java.util.Set;

import com.huatek.base.tree.TreeEntity;
import com.huatek.fos.fundsmanagement.entity.hibernate.SourceUseFunds;

/**
 * 项目类目实体类
 * 
 * @author alan_zhang
 * 
 */
public class BaseProjectCategories extends TreeEntity implements
		java.io.Serializable {

	private static final long serialVersionUID = -2297445333018450643L;

	// 类别编码
	private String proCateCode;
	// 类别名称
	private String proCateName;
	// 模块名称
	private String moduleName;

	// 资金来源运用滚动计划对象
	private Set<SourceUseFunds> sourceUseFunds;

	public String getProCateCode() {
		return proCateCode;
	}

	public void setProCateCode(String proCateCode) {
		this.proCateCode = proCateCode;
	}

	public String getProCateName() {
		return proCateName;
	}

	public void setProCateName(String proCateName) {
		this.proCateName = proCateName;
	}

	public Set<SourceUseFunds> getSourceUseFunds() {
		return sourceUseFunds;
	}

	public void setSourceUseFunds(Set<SourceUseFunds> sourceUseFunds) {
		this.sourceUseFunds = sourceUseFunds;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
}
