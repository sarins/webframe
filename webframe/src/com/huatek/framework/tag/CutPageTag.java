package com.huatek.framework.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.huatek.framework.tag.CutPageBean;

public abstract class  CutPageTag extends BodyTagSupport{

	String formName;
	boolean isExistForm;
	StringBuffer tag =null;
	public StringBuffer getTag() {
		return tag;
	}
	public boolean getIsExistForm() {
		return isExistForm;
	}
	public void setIsExistForm(boolean isExistForm) {
		this.isExistForm = isExistForm;
	}
	String actionUrl;
	String offerPageSize;
	boolean isOuterForm;
	public boolean getIsOuterForm() {
		return isOuterForm;
	}
	public void setIsOuterForm(boolean isOuterForm) {
		this.isOuterForm = isOuterForm;
	}
	public String getOfferPageSize() {
		return offerPageSize;
	}
	String getGoToPageId(){
		return "goNumberId_"+formName+"_"+(isOuterForm?1:0);
	}
	public void setOfferPageSize(String offerPageSize) {
		this.offerPageSize = offerPageSize;
	}
	int pageNum = 6;
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getActionUrl() {
		return actionUrl;
	}
	public void setActionUrl(String actionUrl) {
		this.actionUrl = actionUrl;
	}
	CutPageBean pageBean;

	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public CutPageBean getPageBean() {
		return pageBean;
	}
	public void setPageBean(CutPageBean page) {
		this.pageBean = page;
	}
	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	 public int doStartTag() throws JspException {
		 tag = new StringBuffer();
		 if(formName==null){
			 formName = "defaultQueryForm";
		 }
		 if(!isExistForm){
			 tag.append("<form id=\""+formName+"\" name=\""+formName+"\" action=\""+actionUrl+"\" method=\"post\">");
		 }
		 if(!isOuterForm){
			 tag.append("<input type=\"hidden\" name=\"currentPage\" value=\""+pageBean.getCurrentPage()+"\"/>");
			 tag.append("<input type=\"hidden\" name=\"pageSize\" value=\""+pageBean.getPageSize()+"\"/>");
		 }


		 if(pageBean.getTotalPage()==0){
			 if(!isOuterForm){
				 tag.append(" ");
			 }
		 }else{
			 tag.append("<ul>");
			 tag.append(displayPages());
			 int gotonumber =pageBean.getTotalPage();
			 if(pageBean.getCurrentPage()<pageBean.getTotalPage()){
				 gotonumber = pageBean.getCurrentPage()+1;
			 }
			 tag.append("<li class=\"pageNum\">共"+pageBean.getTotalPage()+"页</li><li  class=\"pageNum\">"+pageBean.getTotalRows()+"条数据<li><li>到第 <input id=\""+getGoToPageId()+"\" value=\""+gotonumber+"\"  onKeyUp=\"this.value=this.value.replace(/\\D/g,'')\"/> 页<li><li><a href='#' onclick=\"javascript:"+getGoToSubmitString(pageBean.getTotalPage())+"\">跳转</a></li>");
			 tag.append("</ul>");
		 }
		 if(!isExistForm){
			 tag.append("</form>");
		 }
		 try {
	            JspWriter out = pageContext.getOut();
	            out.print(tag.toString());
	        } catch (IOException ex) {
	            throw new JspException(ex);
	        }
		 return EVAL_BODY_INCLUDE;
	 }

	 public abstract String displayPages();

	 public String getGoToSubmitString(int totalPage){
		 String submitString = "if(document.getElementById('"+getGoToPageId()+"').value>0){if(document.getElementById('"+getGoToPageId()+"').value>"+totalPage+"){document.forms."+this.formName+".currentPage.value="+totalPage+";}else{document.forms."+this.formName+".currentPage.value=document.getElementById('"+getGoToPageId()+"').value;}}else{document.forms."+this.formName+".currentPage.value=1;}document.forms."+this.formName+".submit();";
		 if(isOuterForm){
			 submitString = "getFilterPageVariable(document.forms."+this.formName+","+pageBean.getPageSize()+",\"if(document.getElementById('"+getGoToPageId()+"').value>0){if(document.getElementById('"+getGoToPageId()+"').value>"+totalPage+"){return "+totalPage+";}else{return document.getElementById('"+getGoToPageId()+"').value;}}else{return 1;}\");document.forms."+this.formName+".submit();";
		 }
		 return submitString;
	 }
	public void release(){
		super.release();
		this.actionUrl=null;
		this.formName=null;
		this.offerPageSize=null;
		this.tag=null;
		this.pageBean=null;
	 }
}
