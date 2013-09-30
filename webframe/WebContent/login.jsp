<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setAttribute("globalUrl","http://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=8"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>资金运营管理平台</title>
<link rel="stylesheet" type="text/css" href="${globalUrl}css/cmsDefault.css"/>
<link rel="stylesheet" type="text/css" href="${globalUrl}css/jquery.dataTables.css"/>
<script type="text/javascript" src="${globalUrl}js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${globalUrl}js/cmsDefault.js"></script>
</head>
<body class="loginBg">
    <div class="loginLogo"><img src="${globalUrl }images/loginLogo.gif"/></div>
    <div class="loginInfo">
    	
    	<div class="loginInfoTitle">LOGIN</div>
    	<div class="loginDecorate"><img src="${globalUrl }images/loginDecorate.png"/></div>
        <div class="loginForm">
         <form name="login" id="login" method="post" class="mainForm" action="${globalUrl}login.do?actionMethod=doLogin">
				<input type="hidden" name="loginForm" value="loginForm"/>
        	<table class="formInfo">
                <tbody>
                    <tr>
                        <td class="formElem labelName"><label>用户名：</label></td>
                        <td class="formElem"><input type="text" class="inText" name="userName" value="${userName}"/></td>
                    </tr>
                    <tr>
                        <td class="formElem labelName"><label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label></td>
                        <td class="formElem"><input type="password" class="inText" name="password" value=""  /></td>
                    </tr>
                    <tr>
                        <td class="formElem labelName"><label>&nbsp;</label></td>
                        <td class="formElem"><div class="loginBtnBorder"><input type="submit" class="loginBtn" value="登&nbsp;录" /></div></td>
                    </tr>

                </tbody>
            </table>
            </form>
        </div>
        <div style="position:absolute;top:55px;right:25px;">
	        <c:if test="${errorLable ne null}">
				<font color=red size=2 style="padding:10px;border:1px red solid;"><spring:message code="${errorLable}"/></font>
			</c:if>
			<c:if test="${errorMessage ne null}">
				<font color=red size=2 style="padding:10px;border:1px red solid;">${errorMessage}</font>
			</c:if>
	     </div>
    </div>
    <div class="copyright">Copyright © 西安投资控股有限公司&nbsp;&nbsp;版权所有</div>
</body>
</html>
