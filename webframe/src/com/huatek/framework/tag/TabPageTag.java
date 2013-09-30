package com.huatek.framework.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.huatek.framework.entity.FwSource;
import com.huatek.framework.security.ThreadLocalClient;

public class TabPageTag extends BodyTagSupport {
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private static final String TAB_HEADER = "<div class=\"container_tab\">\n"+
							"<ul class=\"tabs\">";
	//private RequestContext requestContext;
	/***
	 * 输出当前的菜单下的页签内容.
	 *
	 * @throws JspException
	 *             输出JSP错误.
	 * @return 返回执行结果.
	 */
	public int doStartTag() throws JspException {
		/*
		this.requestContext = (RequestContext) this.pageContext.getAttribute(RequestContextAwareTag.REQUEST_CONTEXT_PAGE_ATTRIBUTE);
		this.pageContext.setAttribute(RequestContextAwareTag.REQUEST_CONTEXT_PAGE_ATTRIBUTE, this.requestContext);
		if (this.requestContext == null) {
			this.requestContext = new JspAwareRequestContext(this.pageContext);
			this.pageContext.setAttribute(RequestContextAwareTag.REQUEST_CONTEXT_PAGE_ATTRIBUTE, this.requestContext);
		}*/
		StringBuffer tag = new StringBuffer(TAB_HEADER);
		boolean isEnd = false;
		if (ThreadLocalClient.get() != null
				&& ThreadLocalClient.get().getSrcAction() != null) {

			FwSource source = ThreadLocalClient.get().getSrcAction().getFwSource();
			List<FwSource> sourceList = ThreadLocalClient.get().getOperator().getUserMenuTree();
			for(int i=0;i<sourceList.size();i++){
				if(sourceList.get(i).getParent()!=null && sourceList.get(i).getParent().getId().longValue()==source.getParent().getId().longValue()){
					if(sourceList.get(i).getIsMenu()==2){
						tag.append("<li");
						if(sourceList.get(i).getId().longValue()==source.getId().longValue()){
							tag.append(" class=\"active\" ");
						}
						tag.append(">\n");
						tag.append("<a onclick=\"getTabPage('"+sourceList.get(i).getLink()+"');\" style=\"cursor:pointer\">"+sourceList.get(i).getName()+"</a>\n");
						tag.append("</li>");
						isEnd = true;
					}
				}else if(isEnd){
					break;
				}
			}
		}
		tag.append("</ul>\n<div class=\"tab_container\">\n<div id=\"tab1\" class=\"tab_content\" style=\"display: block;\">\n");

		try {
			JspWriter out = pageContext.getOut();
			out.print(tag);
		} catch (IOException ex) {
			throw new JspException(ex);
		}
		return EVAL_BODY_INCLUDE;
	}
	/***
	 * 输出是否显示当前按钮.
	 *
	 * @throws JspException
	 *             输出JSP错误.
	 * @return 返回执行结果.
	 */
	public int doEndTag() throws JspException{
		try {
			JspWriter out = pageContext.getOut();
			out.print("</div>\n</div>\n</div>\n");
		} catch (IOException ex) {
			throw new JspException(ex);
		}
		return EVAL_PAGE;
	}

	public void release(){
		super.release();
	}
}
