<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.math.BigDecimal,com.huatek.fos.util.FosUtil"%>
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
            	<td>编制单位：</td>
            	<td>${departIn}</td>
            	<td>${departOut}</td>
            	<td>单位：万元</td>
            </tr>
        </table>
       <table width="100%" border='1' class="resize" id="tb_fundsBanlance_gather_table_list">
            <thead>
                <tr>
                <th>序号</th>
				<th align="center" colspan="2">项目</th>
				<th>合计(万元)</th>
				<th>10日内(万元)</th>
				<th>1个月内(万元)</th>
				<th>2个月内(万元)</th>
				<th>3个月内(万元)</th>
				<th>6个月内(万元)</th>
				<th>6个月以上(万元)</th>
			</tr>
            </thead>
            <tbody>
            	<%
            		//期初结转金额
            		BigDecimal totalSettlement = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"total");
            		BigDecimal tenDaysSettlement = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"tenDaysTotal");
            		BigDecimal aMonthSettlement = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"aMonthTotal");
            		BigDecimal twoMonthsSettlement = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"twoMonthsTotal");
            		BigDecimal threeMonthsSettlement = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"threeMonthsTotal");
            		BigDecimal sixMonthsSettlement = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"sixMonthsTotal");
            		BigDecimal moreSixMonthsSettlement = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"moreSixMonthsTotal");
            	%>
	            <tr>
	            	<td align="center"><B>一</B></td>
					<td colspan="2"><B>期初结转金额</B></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=totalSettlement%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=tenDaysSettlement%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=aMonthSettlement%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=twoMonthsSettlement%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=threeMonthsSettlement%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=sixMonthsSettlement%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=moreSixMonthsSettlement%>" type="number" pattern="#,##0.00" /></div></td>
				</tr>
         	  	<%
         	  		//获取本期资金收入汇总金额
            		BigDecimal totalSettlementIncome = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"total");
            		BigDecimal tenDaysSettlementIncome = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"tenDaysTotal");
            		BigDecimal aMonthSettlementIncome = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"aMonthTotal");
            		BigDecimal twoMonthsSettlementIncome = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"twoMonthsTotal");
            		BigDecimal threeMonthsSettlementIncome = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"threeMonthsTotal");
            		BigDecimal sixMonthsSettlementIncome = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"sixMonthsTotal");
            		BigDecimal moreSixMonthsSettlementIncome = FosUtil.getAmountByMapKey(request.getAttribute("totalIncomeMap"),"moreSixMonthsTotal");
              	%>
            	<tr>
            		<td align="center"><B>二</B></td>
					<td colspan="2"><B>本期资金收入:</B></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=totalSettlementIncome %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=tenDaysSettlementIncome %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=aMonthSettlementIncome %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=twoMonthsSettlementIncome %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=threeMonthsSettlementIncome %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=sixMonthsSettlementIncome %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=moreSixMonthsSettlementIncome %>" type="number" pattern="#,##0.00" /></div></td>
				</tr>
         	  	<%
         	  		//获取本期资金支出汇总金额
            		BigDecimal totalOut = FosUtil.getAmountByMapKey(request.getAttribute("totalPayMap"),"total");
            		BigDecimal tenDaysTotalOut = FosUtil.getAmountByMapKey(request.getAttribute("totalPayMap"),"tenDaysTotal");
            		BigDecimal aMonthTotalOut = FosUtil.getAmountByMapKey(request.getAttribute("totalPayMap"),"aMonthTotal");
            		BigDecimal twoMonthsTotalOut = FosUtil.getAmountByMapKey(request.getAttribute("totalPayMap"),"twoMonthsTotal");
            		BigDecimal threeMonthsTotalOut = FosUtil.getAmountByMapKey(request.getAttribute("totalPayMap"),"threeMonthsTotal");
            		BigDecimal sixMonthsTotalOut = FosUtil.getAmountByMapKey(request.getAttribute("totalPayMap"),"sixMonthsTotal");
            		BigDecimal moreSixMonthsTotalOut = FosUtil.getAmountByMapKey(request.getAttribute("totalPayMap"),"moreSixMonthsTotal");
             	 %>
            	<tr>
            		<td align="center"  rowspan="${payCount+1}"><B>三</B></td>
					<td colspan="2"><B>本期资金支出:</B></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=totalOut %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=tenDaysTotalOut %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=aMonthTotalOut %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=twoMonthsTotalOut %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=threeMonthsTotalOut %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=sixMonthsTotalOut %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=moreSixMonthsTotalOut %>" type="number" pattern="#,##0.00" /></div></td>
				</tr>
            	<c:set value="0" var="outCount"></c:set>
                <c:forEach var="sourceUseFunds" items="${payFundsList}" varStatus="s">
	            <tr>
	            	<td>
	            		<c:set value="${outCount+1}" var="outCount"></c:set>
	            		<c:out value="${outCount}"/>
	            	</td>
					<td>
	            		<c:out value="${sourceUseFunds.firstCategory.proCateName}"/>
	            	</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.summaryMoney}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.tenDaysMoney}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.aMonthMoney}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.twoMonthsMoney}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.threeMonthsMoney}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.sixMonthsMoney}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.moreSixMonthsMoney}" type="number" pattern="#,##0.00" /></div></td>
				</tr>
			</c:forEach>
            </tbody>
        </table>
        <table>
            <tr>
            	<td>资金收入编制人：</td>
            	<td>${orgIn}</td>
            	<td>分管领导：</td>
            	<td>${leaderIn}</td>
            </tr>
         </table>
         <table>
            <tr>
            	<td>资金支出编制人：</td>
            	<td>${orgOut}</td>
            	<td>分管领导：</td>
            	<td>${leaderOut}</td>
            </tr>
         </table>
</body>
</html>