package com.huatek.framework.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.huatek.framework.entity.FwSrcAction;
import com.huatek.framework.security.ThreadLocalClient;

/***
 * 用于显示当前权限的操作.
 *
 * @author winner pan
 *
 */
public class PermitMenuMethodTag extends BodyTagSupport {
	/**
	 * 当前的方法名称.
	 */
	private String methodName;
	/**
	 * 菜单ID.
	 */
	private Long menuId;

	/**
	 * 当前的控制器名称
	 */
	private String moduleUrl;
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
		String tag = "";
		if (ThreadLocalClient.get() != null
				&& ThreadLocalClient.get().getSrcAction() != null) {
			List<FwSrcAction> fwSrcActionList = ThreadLocalClient.get().getPermitAction();
			boolean isPermit = false;
			for (int i = 0; i < fwSrcActionList.size(); i++) {
				if (fwSrcActionList.get(i).getFwSource().getId().longValue() == menuId) {
					String methods = fwSrcActionList.get(i).getActionMethods();
					if ((methods.startsWith(methodName + ";")
							|| methods.endsWith(";" + methodName) || methods
							.indexOf(";" + methodName + ";") > 0)
							&& (moduleUrl == null || (fwSrcActionList.get(i)
									.getActionPath() != null && fwSrcActionList.get(i)
									.getActionPath().equals(moduleUrl)))) {
						isPermit = true;
						break;
					}
				}
			}

			if (!isPermit) {
				tag = " style=\"display:none\"";
			}
		}
		try {
			JspWriter out = pageContext.getOut();
			out.print(tag);
		} catch (IOException ex) {
			throw new JspException(ex);
		}
		return EVAL_BODY_INCLUDE;
	}

	/**
	 *获取当前方法.
	 *
	 * @return 返回当前方法.
	 */
	public String getMethodName() {
		return methodName;
	}

	/**
	 * 设置当期方法.
	 *
	 * @param methodName
	 *            方法名称.
	 */
	public void setMethodName(final String methodName) {
		this.methodName = methodName;
	}

	/***
	 * 获取菜单ID.
	 *
	 * @return 菜单ID
	 */
	public Long getMenuId() {
		return menuId;
	}

	/***
	 * 设置当前菜单ID.
	 *
	 * @param menuId
	 *            菜单ID
	 */
	public void setMenuId(final Long menuId) {
		this.menuId = menuId;
	}

	public String getModuleUrl() {
		return moduleUrl;
	}

	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl;
	}

	public void release(){
		super.release();
		this.menuId=null;
		this.methodName=null;
		this.moduleUrl=null;
	}

	public int doEndTag(){
		this.release();
		return EVAL_PAGE;
	}


}
