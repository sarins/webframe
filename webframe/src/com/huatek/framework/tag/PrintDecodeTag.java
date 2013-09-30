package com.huatek.framework.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

/***
 * 用于输出指定的长度的字符串.
 *
 * @author winner pan
 *
 */
public class PrintDecodeTag extends BodyTagSupport {
	/**
	 * 当前结果.
	 */
	private boolean result;

	/***
	 * 第一个值.
	 */
	private String firstValue;

	/***
	 * 第二个值.
	 */
	private String secondValue;

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
			if (result) {
				out.println(this.firstValue);
			} else {
				out.println(this.secondValue);
			}
		} catch (IOException ex) {
			throw new JspException(ex);
		}

		return EVAL_BODY_INCLUDE;
	}

	public boolean isResult() {
		return result;
	}

	public void setResult(boolean result) {
		this.result = result;
	}

	public String getFirstValue() {
		return firstValue;
	}

	public void setFirstValue(String firstValue) {
		this.firstValue = firstValue;
	}

	public String getSecondValue() {
		return secondValue;
	}

	public void setSecondValue(String secondValue) {
		this.secondValue = secondValue;
	}

	public void release(){
		super.release();
		this.firstValue=null;
		this.secondValue=null;
	}

}
