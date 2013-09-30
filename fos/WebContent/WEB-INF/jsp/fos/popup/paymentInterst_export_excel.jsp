<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="currentGridId" value="tb_financing_export_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<%
	String fileName=(String)request.getAttribute("fileName");
	fileName = new String(fileName.getBytes("GBK"), "iso-8859-1");
	response.reset();
	response.setContentType("application/vnd.ms-excel;charset=GBK");
	response.addHeader("Content-Disposition","attachment; filename=" + fileName);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk"/>
</head>
<body>
<table>
	<tr>
		<td colspan="4">机构名称:<c:out value="${financingDetail.mecName}"/>&nbsp;&nbsp;&nbsp;&nbsp;融资总额:<c:out value="${financingDetail.financingMoney}"/>万元</td>
	</tr>
</table>
<table  width="100%" class="resize" id="tb_financingDetailHistory1_table_list" border="1" cellpadding="0" cellspacing="1">
	 <thead>
		<tr>
			<th>付息日期</th>
			<th>利率</th>
			<th>结息金额（万元）</th>
			<th>还款周期</th>
		</tr>
		</thead>
	<tbody>
	<c:forEach var="payIntestDetail" items="${financingDetailList}" varStatus="s">
	<tr class="gradeX">
		<td ><c:out value="${payIntestDetail.payIntestDate}"/></td>
		<td><c:out value="${payIntestDetail.interestRate}"></c:out>%</td>
		<td>
			<c:out value="${payIntestDetail.payAmount}"></c:out>
		</td>
		<td><c:out value="${payIntestDetail.replyPeriod}"></c:out></td>
	</tr>
	</c:forEach>
	 </tbody>
</table>
</body>
</html>