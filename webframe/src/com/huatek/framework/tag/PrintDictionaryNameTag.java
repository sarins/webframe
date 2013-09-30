package com.huatek.framework.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.huatek.dictionary.entity.FwDictionary;
import com.huatek.dictionary.service.DictionaryFactory;

/***
 * 用于输出指定的长度的字符串.
 *
 * @author winner pan
 *
 */
public class PrintDictionaryNameTag extends BodyTagSupport {
	/**
	 * 当前值.
	 */
	private String value;

	/***
	 * 目录编码.
	 */
	private String category;


	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	/***
	 * 输出是否显示当前按钮.
	 *
	 * @throws JspException
	 *             输出JSP错误.
	 * @return 返回执行结果.
	 */
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		if (value == null || value.length() == 0) {
			value = "";
		} else {
			FwDictionary  fwDictionary= DictionaryFactory.getAllDictionaryMap().get(category+"_"+value);
			if(fwDictionary!=null){
				value = fwDictionary.getName();
			}
		}
		try {
			out.print(value);
		} catch (IOException ex) {
			throw new JspException(ex);
		}
		return EVAL_BODY_INCLUDE;
	}

	/***
	 * 获取输入的字符串.
	 *
	 * @return 字符串
	 */
	public String getValue() {
		return value;
	}

	/***
	 * 设置输入的字符串.
	 *
	 * @param value
	 */
	public void setValue(String value) {
		this.value = value;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void release(){
		super.release();
		this.category=null;
		this.value=null;
	}


}
