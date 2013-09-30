<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="currentGridId" value="tb_interiorLoan_table_list"></c:set>
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
 <table width="100%" class="resize" id="tb_interiorLoan_table_list" border="1">
            <thead>
               <tr>
				<th>序号</th>
				<th>借款人</th>
				<th>借款金额(万元)</th>
				<th>合同利率(%)</th>
				<th>实际利率(%)</th>
				<th>财务顾问费(万元)</th>
				<th>起息日</th>
				<th>结息日</th>
				<th>还款周期</th>
				<th>期限(天)</th>
				<th>计提天数(天)</th>
				<th>利息收入(万元)</th>
				<th>结息日期</th>
				<th>代理银行</th>
				<th>付息方式</th>
				<th>借款状态</th>
				<th>是否延期</th>
				<th>延期起始日</th>
				<th>延期截至日</th>
			</tr>
            </thead>
            <tbody>
            <c:set value="0" var="SummaryLoanMoney"></c:set>
            <c:set value="0" var="SummaryInterestIncome"></c:set>
               <c:forEach var="interiorLoan" items="${pageBean.dataList}" varStatus="s">
				<tr class="gradeX">
					<td>
						<c:out value="${s.index+1}"/>
					</td>
					<td><c:out value="${interiorLoan.loanUser}"/></td>
					<td>
						<div style="text-align:right;"><fmt:formatNumber value="${interiorLoan.loanMoney}" type="number" pattern="#,##0.00" />
						</div>
						<c:set value="${SummaryLoanMoney+interiorLoan.loanMoney}" var="SummaryLoanMoney"></c:set>
					</td>
					<td><c:out value="${interiorLoan.contractRates}"/>%</td>
					<td><c:out value="${interiorLoan.realRates}"/>%</td>
					<td><div style="text-align:right;"><fmt:formatNumber value="${interiorLoan.adviserCost}" type="number" pattern="#,##0.00" />
						</div>
					</td>
					<td><fmt:formatDate value="${interiorLoan.startRateDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${interiorLoan.endRateDate}" pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${interiorLoan.repayPeriod  eq '365'}">365</c:if>
						<c:if test="${interiorLoan.repayPeriod  eq '360'}">360</c:if>
					</td>
					<td><c:out value="${interiorLoan.timeLimit}"/></td>
					<td><c:out value="${interiorLoan.provisionDays}"/></td>
					<td><div style="text-align:right;"><fmt:formatNumber value="${interiorLoan.interestIncome}" type="number" pattern="#,##0.00" />
						</div>
						<c:set value="${SummaryInterestIncome+interiorLoan.interestIncome}" var="SummaryInterestIncome"></c:set>
					</td>
					<td><c:out value="${interiorLoan.endInterestDate}"/>日</td>
					<td><c:out value="${interiorLoan.loanBank}"/></td>
					<td>
						<c:if test="${interiorLoan.endInterestMode  eq '1'}">月结</c:if>
						<c:if test="${interiorLoan.endInterestMode  eq '2'}">季结</c:if>
						<c:if test="${interiorLoan.endInterestMode  eq '3'}">年结</c:if>
					</td>
					<td>
						<c:if test="${interiorLoan.loanStatus  eq '1'}">正常</c:if>
						<c:if test="${interiorLoan.loanStatus  eq '2'}">逾期还款</c:if>
						<c:if test="${interiorLoan.loanStatus  eq '3'}">续贷</c:if>
					</td>
					<td>
						<c:if test="${interiorLoan.isDelay  eq '0'}">否</c:if>
						<c:if test="${interiorLoan.isDelay  eq '1'}">是</c:if>
					</td>
					<td><fmt:formatDate value="${interiorLoan.delayStartDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${interiorLoan.delayEndDate}" pattern="yyyy-MM-dd" /></td>
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
				<td><div style="text-align:right;">
				<fmt:formatNumber value="${SummaryInterestIncome}" type="number" pattern="#,##0.00" /></div></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
            </tbody>
        </table>
</body>
</html>