package com.huatek.framework.tag;

import java.io.IOException;
import java.util.List;

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
public class PrintDictionarySelectTag extends BodyTagSupport {
	/**
	 * 当前值.
	 */
	private String value;

	/***
	 * 目录编码.
	 */
	private String category;

	/***
	 * 字段名称.
	 */
	private String name;
	/***
	 * 样式.
	 */
	private String cssClass;


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
		try {
			List<FwDictionary>  fwDictionaryList= DictionaryFactory.getCategoryDictionaryList(category);
			if(fwDictionaryList.size()>0){
				out.println(getSelectHtml(fwDictionaryList));
			}else{
				out.println("错误:没发现指定的字典目录代码为:"+category+"的数据列表");
			}
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


	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	private String getSelectHtml(List<FwDictionary> fwDictionaryList){
		StringBuffer buffer = new StringBuffer("<select ").append(HtmlUtil.getAttrHtml("name", this.name));
		if(this.id!=null){
			buffer.append(HtmlUtil.getAttrHtml("id", this.id));
		}
		if(this.cssClass!=null){
			buffer.append(HtmlUtil.getAttrHtml("class", this.cssClass));
		}
		buffer.append(">").append("\n");
		buffer.append("<option value=\"\">---请选择---</option>");
		for(FwDictionary fwDictionary:fwDictionaryList){
			buffer.append("<option ").append(HtmlUtil.getAttrHtml("value", fwDictionary.getCode()));
			if(this.value!=null && this.value.equals(fwDictionary.getCode())){
				buffer.append("selected ");
			}
			buffer.append(">").append(fwDictionary.getName()).append("</option>\n");
		}
		buffer.append("</select>");
		return buffer.toString();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void release(){
		super.release();
		this.value=null;
		this.category=null;
		this.name=null;
		this.cssClass=null;
	}


}
