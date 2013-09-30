package com.huatek.framework.tag;

import org.apache.log4j.Logger;

public class AjaxCutPageTag extends CutPageTag {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String showAreal = "workspace";

    private String queryFunction = null;
    private static final Logger LOGGER = Logger.getLogger(AjaxCutPageTag.class);

    private String getQueryPageFunction(){
    	if(queryFunction!=null){
    		return queryFunction;
    	}
    	return "changePage('"
                + this.formName + "','"+this.showAreal+"')";
    }

    public String displayPages() {
        StringBuffer displayString = new StringBuffer();
        displayString.append("<li><a href=\"javascript:" + getSubmitString(1) + "\">首页</a></li>");
        if (pageBean.getCurrentPage() > 1) {

            displayString.append("<li><a href=\"javascript:"
                                 + getSubmitString(pageBean.getCurrentPage() - 1) + "\">上一页</a></li>");
        }
        if ((pageNum > pageBean.getCurrentPage()) && (pageBean.getCurrentPage() <= pageNum - 1)) {
            for (int i = 1; i < pageNum + 1 && i < pageBean.getTotalPage() + 1; i++) {
               if (i != pageBean.getCurrentPage()) {
                    displayString.append("<li><a href=\"javascript:" + getSubmitString(i) + "\">" + i
                                         + "</a></li>");
               } else {
            	   displayString.append("<li><a class=\"current\" href=\"javascript:" + getSubmitString(i) + "\">" + i
                           + "</a></li>");
                }
            }
        } else {
            for (int i = ((pageBean.getCurrentPage() + pageNum / 2 + pageNum % 2) > pageBean
                .getTotalPage() ? pageBean.getTotalPage() - pageNum + 1 : (pageBean
                .getCurrentPage() - (pageNum / 2))); i < ((pageBean.getCurrentPage() + pageNum / 2 + pageNum % 2) > pageBean
                .getTotalPage() ? pageBean.getTotalPage() + 1 : (pageBean.getCurrentPage()
                                                                 + pageNum / 2 + pageNum % 2)); i++) {
                if (i != pageBean.getCurrentPage()) {
                    displayString.append("<li><a href=\"javascript:" + getSubmitString(i) + "\">" + i
                                         + "</a></li>");
               } else {
            	   displayString.append("<li><a class=\"current\" href=\"javascript:" + getSubmitString(i) + "\">" + i
                           + "</a></li>");
                }
            }
        }
        if ((pageBean.getTotalPage() != pageBean.getCurrentPage()) && (pageBean.getTotalPage() > 6)) {
            displayString.append("<li>...</li>");
        }
        if (pageBean.getTotalPage() > pageBean.getCurrentPage()) {
            displayString.append("<li><a href=\"javascript:"
                                 + getSubmitString(pageBean.getCurrentPage() + 1) + "\">下一页</a></li>");
        }
        displayString.append("<li><a href=\"javascript:" + getSubmitString(pageBean.getTotalPage())
                             + "\">尾页</a></li>");
        return displayString.toString();
    }

    public String getSubmitString(int currentPage) {
        String submitString = "document.forms." + this.formName + ".currentPage.value='"
                              + currentPage + "';"+getQueryPageFunction();
        return submitString;
    }

    public String getGoToSubmitString(int totalPage) {
        String submitString = "if(document.getElementById('"+super.getGoToPageId()+"').value>0){if(document.getElementById('"+getGoToPageId()+"').value>"
                              + totalPage
                              + "){document.forms."
                              + this.formName
                              + ".currentPage.value="
                              + totalPage
                              + ";}else{document.forms."
                              + this.formName
                              + ".currentPage.value=document.getElementById('"+getGoToPageId()+"').value;}}else{document.forms."
                              + this.formName
                              + ".currentPage.value=1;}"+getQueryPageFunction();
        return submitString;
    }

	public String getShowAreal() {
		return showAreal;
	}

	public void setShowAreal(String showAreal) {
		this.showAreal = showAreal;
	}

	public String getQueryFunction() {
		return queryFunction;
	}

	public void setQueryFunction(String queryFunction) {
		this.queryFunction = queryFunction;
	}

	public int doEndTag(){
		super.release();
		return EVAL_PAGE;
	}
}
