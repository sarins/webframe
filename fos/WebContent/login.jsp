<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.huatek.framework.sso.SSOServiceManagement"%>
<%
String SSoURL = SSOServiceManagement.getSSOServerURL(request.getServerName(),request.getServerPort());
response.sendRedirect(SSoURL);
%>