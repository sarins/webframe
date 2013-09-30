<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="currentGridId" value="tb_security_export_table_list"></c:set>
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
<table width="100%" class="resize" id="tb_security_export_table_list" border="1" cellpadding="0" cellspacing="1">
            <thead>
                <tr>
				<th>序号</th>
				<th>事项分类</th>
				<th>事项名称</th>
				<th>提取类别</th>
				<th>合同金额(万元)</th>
				<th>担保金额(万元)</th>
				<th>起始日期</th>
				<th>截止日期</th>
				<th>事项状态</th>
				<th>审批情况</th>
				<th>事项概述</th>
				<th>备注</th>
			</tr>
            </thead>
            <tbody>
                <c:forEach var="securityAuthories" items="${pageBean.dataList}" varStatus="s">
				<tr <c:if test="${!(s.index%2==0) }"> class="tdbgcolor"</c:if>>
					<td align="center">
						<c:out value="${s.index+1}"/>
					</td>
					<td><c:out value="${securityAuthories.categoryType}"/></td>
					<td><c:out value="${securityAuthories.eventName}"/></td>
					<td><c:out value="${securityAuthories.drawType}"/></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${securityAuthories.contractMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${securityAuthories.securityMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><fmt:formatDate value="${securityAuthories.eventInitialDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${securityAuthories.eventEndDate}" pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${securityAuthories.eventStatus eq '1'}">已到期偿还</c:if>
						<c:if test="${securityAuthories.eventStatus eq '2'}">正常</c:if>
					</td>
					<td><c:out value="${securityAuthories.approveCondition}"/></td>
					<td><c:out value="${securityAuthories.eventSummary}"/></td>
					<td><c:out value="${securityAuthories.remarks}"/></td>
			 </tr>
			</c:forEach>
            </tbody>
        </table>
</body>
</html>