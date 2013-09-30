package com.huatek.framework.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.huatek.framework.service.GlobalVar;

/***
 * 用于输出指定的长度的字符串.
 *
 * @author winner pan
 *
 */
public class UrlDecodeTag extends BodyTagSupport {
	/**
	 * 当前的字符.
	 */
	private String value;

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
				String printStr = java.net.URLDecoder.decode(value,GlobalVar.CHARSET_UTF_8);
				out.print(printStr.replaceAll("'", "\\'"));

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

	public void release(){
		super.release();
		this.value=null;
	}

}
