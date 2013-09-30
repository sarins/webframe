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
<!-- html 添加mlns:x是为了解决过长数字在导出时出现Excel科学计数法问题 ，同时需要在解决的td中添加x:str -->
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk"/>
</head>
<body>
 <table width="100%" class="resize" id="tb_financingDetail_table_list" border="1" cellpadding="0" cellspacing="1">
            <thead>
               <tr>
				<th>序号</th>
				<th>机构</th>
				<th>信息类别</th>
				<th>合同编号</th>
				<th>机构种类</th>
				<th>融资种类</th>
				<th>融资金额(万元)</th>
				<th>融资用途</th>
				<th>起始日</th>
				<th>截止日</th>
				<th>实际截止日期</th>
				<th>融资期限(月)</th>
				<th>结息日</th>
				<th>利率(%)</th>
				<th>利率调整方式</th>
				<th>结算方式</th>
				<th>还款周期</th>
				<th>是否提前还款</th>
				<th>提前还款日期</th>
				<th>担保/抵押方式</th>
				<th>备注</th>
			</tr>
            </thead>
            <tbody>
               <c:forEach var="financingDetail" items="${pageBean.dataList}" varStatus="s">
				<tr class="gradeX">
					<td>
						<c:out value="${s.index+1}"/>
					</td>
					<td><c:out value="${financingDetail.mecName}"/></td>
					<td>
						<c:if test="${financingDetail.infoCategory eq '1'}">融资</c:if>
						<c:if test="${financingDetail.infoCategory eq '2'}">授信</c:if>
					</td>
					<td x:str><c:out value="${financingDetail.contactNumber}"/></td>
					<td>
						<c:if test="${financingDetail.mecCategory eq '1'}">银行</c:if>
						<c:if test="${financingDetail.mecCategory eq '2'}">信托</c:if>
						<c:if test="${financingDetail.mecCategory eq '3'}">券商</c:if>
					</td>
					<td>
						<c:out value="${financingDetail.financingCategory}"/>
					</td>
					<td>
						<div style="text-align:right;">
							<fmt:formatNumber value="${financingDetail.financingMoney}" type="number" pattern="#,##0.00" />
						</div>
					</td>
					<td><c:out value="${financingDetail.use}"/></td>
					<td><fmt:formatDate value="${financingDetail.startDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${financingDetail.endDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${financingDetail.realEndDate}" pattern="yyyy-MM-dd" /></td>
					<td><c:out value="${financingDetail.timeLimit}"/></td>
					<td><c:out value="${financingDetail.endIntDate}"/>日</td>
					<td><c:out value="${financingDetail.interestRate}"/>%</td>
					<td><c:out value="${financingDetail.rateAdjustMode}"/></td>
					<td>
						<c:if test="${financingDetail.endIntMode  eq '1'}">月结</c:if>
						<c:if test="${financingDetail.endIntMode  eq '2'}">季结</c:if>
						<c:if test="${financingDetail.endIntMode  eq '3'}">年结</c:if>
					</td>
					<td>
						<c:if test="${financingDetail.replyPeriod  eq '360'}">360</c:if>
						<c:if test="${financingDetail.replyPeriod  eq '365'}">365</c:if>
					</td>
					<td>
						<c:if test="${financingDetail.isAdvanceReply  eq '1'}">是</c:if>
						<c:if test="${financingDetail.isAdvanceReply  eq '2'}">否</c:if>
					</td>
					<td><fmt:formatDate value="${financingDetail.earlyReplyDate}" pattern="yyyy-MM-dd" /></td>
					<td><c:out value="${financingDetail.mortMode}"/></td>
					<td><c:out value="${financingDetail.remark}"/></td>
			 </tr>
			</c:forEach>
            </tbody>
        </table>
</body>
</html>