package com.huatek.framework.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

/***
 * 用于输出指定的长度的字符串.
 *
 * @author winner pan
 *
 */
public class PrintSelectTag extends BodyTagSupport {
	/**
	 * 当前值.
	 */
	private String value;

	/***
	 * 列表值.
	 */
	private List<?> dataList;

	/***
	 * 字段名称.
	 */
	private String name;
	/***
	 * 样式.
	 */
	private String cssClass;
	/***
	 * 列表数据对象的获取值的方法.
	 */
	private String valueMethod;
	/**
	 * 列表数据对象的获取选项text的方法.
	 */
	private String textMethod;


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
			if(dataList.size()>0){
				out.println(getSelectHtml(dataList));
			}else{
				out.println("");
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


	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	private String getSelectHtml(List<?> objList) throws JspException {
		StringBuffer buffer = new StringBuffer("<select ").append(HtmlUtil.getAttrHtml("name", this.name));
		if(this.id!=null){
			buffer.append(HtmlUtil.getAttrHtml("id", this.id));
		}
		if(this.cssClass!=null){
			buffer.append(HtmlUtil.getAttrHtml("class", this.cssClass));
		}
		buffer.append(">").append("\n");
		buffer.append("<option value=\"\">---请选择---</option>");
		for(Object obj:objList){
			String methodValue = executeMethod(obj,this.valueMethod);
			buffer.append("<option ").append(HtmlUtil.getAttrHtml("value", methodValue));
			if(this.value!=null && this.value.equals(methodValue)){
				buffer.append("selected ");
			}
			buffer.append(">").append(executeMethod(obj,this.textMethod)).append("</option>\n");
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


	public String getValueMethod() {
		return valueMethod;
	}

	public void setValueMethod(String valueMethod) {
		this.valueMethod = valueMethod;
	}

	public String getTextMethod() {
		return textMethod;
	}

	public void setTextMethod(String textMethod) {
		this.textMethod = textMethod;
	}

	private String executeMethod(Object obj,String methodName) throws JspException{
		try {
			Object returnObj = obj.getClass().getMethod(methodName, new Class[]{}).invoke(obj, new Object[]{});
			if(returnObj==null){
				throw new JspException("错误执行方法"+methodName+"没有结果");
			}
			return returnObj.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new JspException(e.getMessage());
		}

	}

	public List<?> getDataList() {
		return dataList;
	}

	public void setDataList(List<?> dataList) {
		this.dataList = dataList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void release(){
		super.release();
		this.dataList=null;
		this.value=null;
		this.valueMethod=null;
		this.textMethod=null;
	}
}
