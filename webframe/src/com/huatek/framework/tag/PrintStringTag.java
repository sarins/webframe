package com.huatek.framework.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.huatek.base.tree.HTMLEncoder;

/***
 * 用于输出指定的长度的字符串.
 *
 * @author winner pan
 *
 */
public class PrintStringTag extends BodyTagSupport {
	/**
	 * 当前的字符.
	 */
	private String value;

	/***
	 * 指定的长度.
	 */
	private int size;

	/***
	 * 是否编码.
	 */
	private boolean isEncode = true;

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
			try {
				out.print(value);
			} catch (IOException ex) {
				throw new JspException(ex);
			}
		} else {
			try {
				String printStr = value;
				if (size > 0) {
					if (value.length() > size) {
						printStr = value.substring(0, size) + "...";
					} else {
						printStr = value;
					}
				}
				if (isEncode()) {
					out.print(HTMLEncoder.INSTANCE.encode(printStr));
				} else {
					out.print(printStr);
				}
			} catch (IOException ex) {
				throw new JspException(ex);
			}
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

	/**
	 * 获取制定的长度.
	 *
	 * @return 字符长度
	 */
	public int getSize() {
		return size;
	}

	/***
	 * 设置字符长度.
	 *
	 * @param size
	 *            字符长度
	 */
	public void setSize(int size) {
		this.size = size;
	}

	public boolean isEncode() {
		return isEncode;
	}

	public void setEncode(boolean isEncode) {
		this.isEncode = isEncode;
	}

	public void release(){
		super.release();
		this.value=null;
	}
	public int doEndTag(){
		this.release();
		return EVAL_PAGE;
	}
}
