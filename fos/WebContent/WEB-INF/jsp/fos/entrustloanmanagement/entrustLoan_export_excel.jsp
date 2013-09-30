<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="currentGridId" value="tb_entrustLoan_export_table_list"></c:set>
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
 <table width="100%" class="resize" id="tb_entrustLoan_export_table_list" border="1">
            <thead>
               <tr>
				<th>序号</th>
				<th>借款人</th>
				<th>贷款金额(万元)</th>
				<th>贷款状态</th>
				<th>合同利率(%)</th>
				<th>实际利率(%)</th>
				<th>财务顾问费(万元)</th>
				<th>起息日</th>
				<th>结息日</th>
				<th>还款周期</th>
				<th>期限(月)</th>
				<th>计提天数(天)</th>
				<th>利息收入(万元)</th>
				<th>结息日期</th>
				<th>代理银行</th>
				<th>付息方式</th>
			</tr>
            </thead>
            <tbody>
            <c:set value="0" var="SummaryLoanMoney"></c:set>
            <c:set value="0" var="SummaryInterestIncome"></c:set>
               <c:forEach var="entrustLoan" items="${pageBean.dataList}" varStatus="s">
				<tr class="gradeX">
					<td>
						<c:out value="${s.index+1}"/>
					</td>
					<td><c:out value="${entrustLoan.loanUser}"/></td>
					<td>
						<div style="text-align:right;"><fmt:formatNumber value="${entrustLoan.loanMoney}" type="number" pattern="#,##0.00" />
						</div>
						<c:set value="${SummaryLoanMoney+entrustLoan.loanMoney}" var="SummaryLoanMoney"></c:set>
					</td>
					<td>
						<huatek:dicOut category="loanStatus" value="${entrustLoan.loanStatus}"/>
					</td>
					<td><c:out value="${entrustLoan.contractRates}"/>%</td>
					<td><c:out value="${entrustLoan.realRates}"/>%</td>
					<td><div style="text-align:right;"><fmt:formatNumber value="${entrustLoan.adviserCost}" type="number" pattern="#,##0.00" />
						</div>
					</td>
					<td><fmt:formatDate value="${entrustLoan.startRateDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${entrustLoan.endRateDate}" pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${entrustLoan.replyPeriod  eq '360'}">360</c:if>
						<c:if test="${entrustLoan.replyPeriod  eq '365'}">365</c:if>
					</td>
					<td><c:out value="${entrustLoan.timeLimit}"/></td>
					<td><c:out value="${entrustLoan.provisionDays}"/></td>
					<td><div style="text-align:right;"><fmt:formatNumber value="${entrustLoan.interestIncome}" type="number" pattern="#,##0.00" />
						</div>
						<c:set value="${SummaryInterestIncome+entrustLoan.interestIncome}" var="SummaryInterestIncome"></c:set>
					</td>
					<td><c:out value="${entrustLoan.endInterestDate}"/>日</td>
					<td><c:out value="${entrustLoan.loanBank}"/></td>
					<td>
						<c:if test="${entrustLoan.endInterestMode  eq '1'}">月结</c:if>
						<c:if test="${entrustLoan.endInterestMode  eq '2'}">季结</c:if>
						<c:if test="${entrustLoan.endInterestMode  eq '3'}">年结</c:if>
					</td>
			 </tr>
			</c:forEach>
			<tr>
				<td><B>总计</B></td>
				<td>&nbsp;</td>
				<td><div style="text-align:right;">
				<fmt:formatNumber value="${SummaryLoanMoney}" type="number" pattern="#,##0.00" /></div></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><div style="text-align:right;">
				<fmt:formatNumber value="${SummaryInterestIncome}" type="number" pattern="#,##0.00" /></div></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
            </tbody>
        </table>
</body>
</html>