<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.ServletException" %>
<%@page import="com.huatek.framework.util.Constant"%>
<%@page import="com.huatek.framework.util.Util" %>
<%@page import="com.huatek.framework.tag.HtmlUtil" %>
<%@page import="javax.servlet.http.HttpServletRequest" %>
<%
Throwable exception = (Throwable) request.getAttribute("javax.servlet.error.exception");
if(exception!=null){
		exception.printStackTrace();
}
/***
*打开窗口报错时直接打印错误信息.
*/
if("1".equals(request.getParameter("openWin"))){
	out.println(exception.getMessage());
	return;
}
if(Util.isAjaxRequest(request)){
	response.setStatus(Constant.VALIDATE_ERROR_CODE);
	if(exception==null){
		out.println("Unkonw exception, please login again.");
		return;
	}
	String error =  null;
	if(exception.getCause()!=null){
		Throwable cause =  exception.getCause();
		while( cause.getCause()!=null && !cause.getCause().getClass().equals(cause.getClass())){
			cause = cause.getCause();
		}
		error = cause.getMessage();
	}else{
		if(exception.getMessage()!=null&&exception.getMessage().length()>0){
			error = exception.getMessage();
		}else{
			 error = exception.getClass().getName();
		}
	}
	if(error!=null){
		error = error.replaceAll("\"","\'");
		error = error.replaceAll("\n",";");
		error = error.replaceAll("\r",";");

		if (error.indexOf("ORA-02292")>=0) {
			String errorInfo = HtmlUtil.getOracleErrorDicInfo(error,"foreignKey");
			if(errorInfo==null){
				errorInfo = "该数据被其它数据引用，不能删除。";
			}
			out.println(errorInfo);
		} else if(error.indexOf("ORA-00001")>=0){
			String errorInfo = HtmlUtil.getOracleErrorDicInfo(error,"uniqueKey");
			if(errorInfo==null){
				errorInfo = "违反唯一约束条件。";
			}
			out.println(errorInfo);
		}else{
			out.println(error);
		}
	}else{
		out.println("系统内部发生错误！");
	}
}else{
	if(session.getAttribute("javax.servlet.error.exception")!=null){
		//Util.getReturnMessage 该方法包含对ESB接口发送数据
		out.print("系统发生错误："+exception.getLocalizedMessage());
		session.removeAttribute("javax.servlet.error.exception");
		if(session.getAttribute("sendNum")!=null){
			session.removeAttribute("sendNum");
		}
	}else{
		if(exception!=null){
			out.print("系统发生错误："+exception.getLocalizedMessage());
		}else{
			out.print("系统发生错误：系统内部发生错误！");
		}
	}
}
%>