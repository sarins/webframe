<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.math.BigDecimal"%>
<%@page import="com.huatek.fos.util.FosUtil"%>
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
            	<td>${depart }</td>
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
            		//财政专户期初结转金额
            		BigDecimal totalSettlementFinance = FosUtil.getAmountByMapKey(request.getAttribute("financeSettlementMoneyMap"),"totalSettlement");
            		BigDecimal tenDaysSettlementFinance = FosUtil.getAmountByMapKey(request.getAttribute("financeSettlementMoneyMap"),"tenDaysSettlement");
            		BigDecimal aMonthSettlementFinance = FosUtil.getAmountByMapKey(request.getAttribute("financeSettlementMoneyMap"),"aMonthSettlement");
            		BigDecimal twoMonthsSettlementFinance = FosUtil.getAmountByMapKey(request.getAttribute("financeSettlementMoneyMap"),"twoMonthsSettlement");
            		BigDecimal threeMonthsSettlementFinance = FosUtil.getAmountByMapKey(request.getAttribute("financeSettlementMoneyMap"),"threeMonthsSettlement");
            		BigDecimal sixMonthsSettlementFinance = FosUtil.getAmountByMapKey(request.getAttribute("financeSettlementMoneyMap"),"sixMonthsSettlement");
            		BigDecimal moreSixMonthsSettlementFinance = FosUtil.getAmountByMapKey(request.getAttribute("financeSettlementMoneyMap"),"moreSixMonthsSettlement");
            	%>
	            <tr>
	            	<td align="center"><B>一</B></td>
					<td colspan="2"><B>财政专户期初结转金额</B></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=totalSettlementFinance%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=tenDaysSettlementFinance%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=aMonthSettlementFinance%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=twoMonthsSettlementFinance%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=threeMonthsSettlementFinance%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=sixMonthsSettlementFinance%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=moreSixMonthsSettlementFinance%>" type="number" pattern="#,##0.00" /></div></td>
				</tr>
            	<%	
            		//获取自有资金期初结转金额
            		BigDecimal totalSettlementOwn = FosUtil.getAmountByMapKey(request.getAttribute("ownSettlementMoneyMap"),"totalSettlement");
            		BigDecimal tenDaysSettlementOwn = FosUtil.getAmountByMapKey(request.getAttribute("ownSettlementMoneyMap"),"tenDaysSettlement");
            		BigDecimal aMonthSettlementOwn = FosUtil.getAmountByMapKey(request.getAttribute("ownSettlementMoneyMap"),"aMonthSettlement");
            		BigDecimal twoMonthsSettlementOwn = FosUtil.getAmountByMapKey(request.getAttribute("ownSettlementMoneyMap"),"twoMonthsSettlement");
            		BigDecimal threeMonthsSettlementOwn = FosUtil.getAmountByMapKey(request.getAttribute("ownSettlementMoneyMap"),"threeMonthsSettlement");
            		BigDecimal sixMonthsSettlementOwn = FosUtil.getAmountByMapKey(request.getAttribute("ownSettlementMoneyMap"),"sixMonthsSettlement");
            		BigDecimal moreSixMonthsSettlementOwn = FosUtil.getAmountByMapKey(request.getAttribute("ownSettlementMoneyMap"),"moreSixMonthsSettlement");
            	%>
	            <tr>
	            		<td align="center"><B>二</B></td>
						<td colspan="2"><B>自有资金期初结转金额</B></td>
						<td><div style="text-align:right;">
						<fmt:formatNumber value="<%=totalSettlementOwn%>" type="number" pattern="#,##0.00" /></div></td>
						<td><div style="text-align:right;">
						<fmt:formatNumber value="<%=tenDaysSettlementOwn%>" type="number" pattern="#,##0.00" /></div></td>
						<td><div style="text-align:right;">
						<fmt:formatNumber value="<%=aMonthSettlementOwn%>" type="number" pattern="#,##0.00" /></div></td>
						<td><div style="text-align:right;">
						<fmt:formatNumber value="<%=twoMonthsSettlementOwn%>" type="number" pattern="#,##0.00" /></div></td>
						<td><div style="text-align:right;">
						<fmt:formatNumber value="<%=threeMonthsSettlementOwn%>" type="number" pattern="#,##0.00" /></div></td>
						<td><div style="text-align:right;">
						<fmt:formatNumber value="<%=sixMonthsSettlementOwn%>" type="number" pattern="#,##0.00" /></div></td>
						<td><div style="text-align:right;">
						<fmt:formatNumber value="<%=moreSixMonthsSettlementOwn%>" type="number" pattern="#,##0.00" /></div></td>
				</tr>
         	  	<%	
         	  		//获取本期资金收入汇总金额
            		BigDecimal totalOri = FosUtil.getAmountByMapKey(request.getAttribute("totalOriginMap"),"total");
            		BigDecimal tenDaysTotalOri = FosUtil.getAmountByMapKey(request.getAttribute("totalOriginMap"),"tenDaysTotal");
            		BigDecimal aMonthTotalOri = FosUtil.getAmountByMapKey(request.getAttribute("totalOriginMap"),"aMonthTotal");
            		BigDecimal twoMonthsTotalOri = FosUtil.getAmountByMapKey(request.getAttribute("totalOriginMap"),"twoMonthsTotal");
            		BigDecimal threeMonthsTotalOri = FosUtil.getAmountByMapKey(request.getAttribute("totalOriginMap"),"threeMonthsTotal");
            		BigDecimal sixMonthsTotalOri = FosUtil.getAmountByMapKey(request.getAttribute("totalOriginMap"),"sixMonthsTotal");
            		BigDecimal moreSixMonthsTotalOri = FosUtil.getAmountByMapKey(request.getAttribute("totalOriginMap"),"moreSixMonthsTotal");
              	%>
            	<tr>
            		<td align="center" <c:if test="${fundsOriList !=null}"> rowspan="${fundsOriList[0].categoryCount+1}"</c:if>><B>三</B></td>
					<td colspan="2"><B>本期资金收入:</B></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=totalOri %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=tenDaysTotalOri %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=aMonthTotalOri %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=twoMonthsTotalOri %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=threeMonthsTotalOri %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=sixMonthsTotalOri %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=moreSixMonthsTotalOri %>" type="number" pattern="#,##0.00" /></div></td>
				</tr>
				<c:set value="<%=new BigDecimal(0)%>" var="financeMoney"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="financeMoneyTenDays"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="financeMoneyAMonth"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="financeMoneyTwoMonths"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="financeMoneyThreeMonths"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="financeMoneySixMonths"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="financeMoneyMoreSixMonths"></c:set>
            	<c:set value="0" var="oriCount"></c:set>
                <c:forEach var="sourceUseFunds" items="${fundsOriList}" varStatus="s">
                <c:if test="${sourceUseFunds.secondProjectCount!=null}">
                	<!-- 如果当前项目类目编码是财政资金 -->
	            	<c:if test="${sourceUseFunds.sencondCategory.proCateCode == '0107'}">
	            		<c:set value="${financeMoney+sourceUseFunds.secondProjectMoneySummary}" var="financeMoney"></c:set>
	            		<c:set value="${financeMoneyTenDays+sourceUseFunds.tenDaysMoneySummarySecond}" var="financeMoneyTenDays"></c:set>
	            		<c:set value="${financeMoneyAMonth+sourceUseFunds.aMonthMoneySummarySecond}" var="financeMoneyAMonth"></c:set>
	            		<c:set value="${financeMoneyTwoMonths+sourceUseFunds.twoMonthsMoneySummarySecond}" var="financeMoneyTwoMonths"></c:set>
	            		<c:set value="${financeMoneyThreeMonths+sourceUseFunds.threeMonthsMoneySummarySecond}" var="financeMoneyThreeMonths"></c:set>
	            		<c:set value="${financeMoneySixMonths+sourceUseFunds.sixMonthsMoneySummarySecond}" var="financeMoneySixMonths"></c:set>
	            		<c:set value="${financeMoneyMoreSixMonths+sourceUseFunds.moreSixMonthsMoneySummarySecond}" var="financeMoneyMoreSixMonths"></c:set>
	            	</c:if>
	            <tr>
	            	<td>
	            		<c:set value="${oriCount+1}" var="oriCount"></c:set>
	            		<c:out value="${oriCount}"/>
	            	</td>
	            	<td>
	            		<c:if test="${sourceUseFunds.secondProjectCount!=null}"><c:out value="${sourceUseFunds.sencondCategory.proCateName}"/></c:if>
	            	</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.secondProjectMoneySummary}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${sourceUseFunds.secondProjectMoneySummary}" var="SummaryMoney"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.tenDaysMoneySummarySecond}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${sourceUseFunds.tenDaysMoneySummarySecond}" var="SummaryMoneyTenDays"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.aMonthMoneySummarySecond}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${sourceUseFunds.aMonthMoneySummarySecond}" var="SummaryMoneyAMonth"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.twoMonthsMoneySummarySecond}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${sourceUseFunds.twoMonthsMoneySummarySecond}" var="SummaryMoneyTwoMonths"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.threeMonthsMoneySummarySecond}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${sourceUseFunds.threeMonthsMoneySummarySecond}" var="SummaryMoneyThreeMonths"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.sixMonthsMoneySummarySecond}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${sourceUseFunds.sixMonthsMoneySummarySecond}" var="SummaryMoneySixMonths"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.moreSixMonthsMoneySummarySecond}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${sourceUseFunds.moreSixMonthsMoneySummarySecond}" var="SummaryMoneyMoreSixMonths"></c:set>
					</td>
				</tr>
                </c:if>
			</c:forEach>
         	  	<%	
         	  		//获取本期资金支出汇总金额
            		BigDecimal totalApp = FosUtil.getAmountByMapKey(request.getAttribute("totalApplyMap"),"total");
            		BigDecimal tenDaysTotalApp = FosUtil.getAmountByMapKey(request.getAttribute("totalApplyMap"),"tenDaysTotal");
            		BigDecimal aMonthTotalApp = FosUtil.getAmountByMapKey(request.getAttribute("totalApplyMap"),"aMonthTotal");
            		BigDecimal twoMonthsTotalApp = FosUtil.getAmountByMapKey(request.getAttribute("totalApplyMap"),"twoMonthsTotal");
            		BigDecimal threeMonthsTotalApp = FosUtil.getAmountByMapKey(request.getAttribute("totalApplyMap"),"threeMonthsTotal");
            		BigDecimal sixMonthsTotalApp = FosUtil.getAmountByMapKey(request.getAttribute("totalApplyMap"),"sixMonthsTotal");
            		BigDecimal moreSixMonthsTotalApp = FosUtil.getAmountByMapKey(request.getAttribute("totalApplyMap"),"moreSixMonthsTotal");
             	 %>	
            	<tr>
            		<td align="center" <c:if test="${applyDataList !=null}"> rowspan="${applyDataList[0].categoryCount+1}" </c:if>><B>四</B></td>
					<td colspan="2"><B>本期资金支出:</B></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=totalApp %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=tenDaysTotalApp %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=aMonthTotalApp %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=twoMonthsTotalApp %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=threeMonthsTotalApp %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=sixMonthsTotalApp %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=moreSixMonthsTotalApp %>" type="number" pattern="#,##0.00" /></div></td>
				</tr>
				<c:set value="<%=new BigDecimal(0)%>" var="governmentMoney"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="governmentMoneyTenDays"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="governmentMoneyAMonth"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="governmentMoneyTwoMonths"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="governmentMoneyThreeMonths"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="governmentMoneySixMonths"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="governmentMoneyMoreSixMonths"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="holdMoney"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="holdMoneyTenDays"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="holdMoneyAMonth"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="holdMoneyTwoMonths"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="holdMoneyThreeMonths"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="holdMoneySixMonths"></c:set>
            	<c:set value="<%=new BigDecimal(0)%>" var="holdMoneyMoreSixMonths"></c:set>
            	<c:set value="0" var="appCount"></c:set>
                <c:forEach var="sourceUseFunds" items="${applyDataList}" varStatus="s">
                <c:if test="${sourceUseFunds.firstProjectCount!=null}">
                	<!-- 如果当前项目类目编码是财政扶持项目-->
	            	<c:if test="${sourceUseFunds.firstCategory.proCateCode == '0202'}">
	            		<c:set value="${governmentMoney+sourceUseFunds.firstProjectMoneySummary}" var="governmentMoney"></c:set>
	            		<c:set value="${governmentMoneyTenDays+sourceUseFunds.tenDaysMoneySummaryFirst}" var="governmentMoneyTenDays"></c:set>
	            		<c:set value="${governmentMoneyAMonth+sourceUseFunds.aMonthMoneySummaryFirst}" var="governmentMoneyAMonth"></c:set>
	            		<c:set value="${governmentMoneyTwoMonths+sourceUseFunds.twoMonthsMoneySummaryFirst}" var="governmentMoneyTwoMonths"></c:set>
	            		<c:set value="${governmentMoneyThreeMonths+sourceUseFunds.threeMonthsMoneySummaryFirst}" var="governmentMoneyThreeMonths"></c:set>
	            		<c:set value="${governmentMoneySixMonths+sourceUseFunds.sixMonthsMoneySummaryFirst}" var="governmentMoneySixMonths"></c:set>
	            		<c:set value="${governmentMoneyMoreSixMonths+sourceUseFunds.moreSixMonthsMoneySummaryFirst}" var="governmentMoneyMoreSixMonths"></c:set>
	            	</c:if>
	            	<!-- 如果当前项目类目编码是代持项目-->
	            	<c:if test="${sourceUseFunds.firstCategory.proCateCode == '0203'}">
	            		<c:set value="${holdMoney+sourceUseFunds.firstProjectMoneySummary}" var="holdMoney"></c:set>
	            		<c:set value="${holdMoneyTenDays+sourceUseFunds.tenDaysMoneySummaryFirst}" var="holdMoneyTenDays"></c:set>
	            		<c:set value="${holdMoneyAMonth+sourceUseFunds.aMonthMoneySummaryFirst}" var="holdMoneyAMonth"></c:set>
	            		<c:set value="${holdMoneyTwoMonths+sourceUseFunds.twoMonthsMoneySummaryFirst}" var="holdMoneyTwoMonths"></c:set>
	            		<c:set value="${holdMoneyThreeMonths+sourceUseFunds.threeMonthsMoneySummaryFirst}" var="holdMoneyThreeMonths"></c:set>
	            		<c:set value="${holdMoneySixMonths+sourceUseFunds.sixMonthsMoneySummaryFirst}" var="holdMoneySixMonths"></c:set>
	            		<c:set value="${holdMoneyMoreSixMonths+sourceUseFunds.moreSixMonthsMoneySummaryFirst}" var="holdMoneyMoreSixMonths"></c:set>
	            	</c:if>
	            <tr>
	            	<td>
	            		<c:set value="${appCount+1}" var="appCount"></c:set>
	            		<c:out value="${appCount}"/>
	            	</td>
					<td>
	            		<c:if test="${sourceUseFunds.firstProjectCount!=null}"><c:out value="${sourceUseFunds.firstCategory.proCateName}"/></c:if>
	            	</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.firstProjectMoneySummary}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${sourceUseFunds.firstProjectMoneySummary}" var="SummaryMoneyApply"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.tenDaysMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${sourceUseFunds.tenDaysMoneySummaryFirst}" var="SummaryMoneyTenDaysApply"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.aMonthMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${sourceUseFunds.aMonthMoneySummaryFirst}" var="SummaryMoneyAMonthApply"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.twoMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${sourceUseFunds.twoMonthsMoneySummaryFirst}" var="SummaryMoneyTwoMonthsApply"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.threeMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${sourceUseFunds.threeMonthsMoneySummaryFirst}" var="SummaryMoneyThreeMonthsApply"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.sixMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${sourceUseFunds.sixMonthsMoneySummaryFirst}" var="SummaryMoneySixMonthsApply"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.moreSixMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${sourceUseFunds.moreSixMonthsMoneySummaryFirst}" var="SummaryMoneyMoreSixMonthsApply"></c:set>
				</tr>
                </c:if>
			</c:forEach>
	            <tr>
	            	<td align="center"><B>五</B></td>
					<td colspan="2"><B>自有资金缺口</B></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=totalSettlementOwn.add(totalOri).subtract(totalApp) %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=tenDaysSettlementOwn.add(tenDaysTotalOri).subtract(tenDaysTotalApp) %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=aMonthSettlementOwn.add(aMonthTotalOri).subtract(aMonthTotalApp) %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=twoMonthsSettlementOwn.add(twoMonthsTotalOri).subtract(twoMonthsTotalApp) %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=threeMonthsSettlementOwn.add(threeMonthsTotalOri).subtract(threeMonthsTotalApp) %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=sixMonthsSettlementOwn.add(sixMonthsTotalOri).subtract(sixMonthsTotalApp) %>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=moreSixMonthsSettlementOwn.add(moreSixMonthsTotalOri).subtract(moreSixMonthsTotalApp) %>" type="number" pattern="#,##0.00" /></div></td>
				</tr>
				<%	
					//获取财政资金合计金额（资金收入）
					BigDecimal finMoneys = (BigDecimal)pageContext.findAttribute("financeMoney");
					BigDecimal finMoneyTenDays = (BigDecimal)pageContext.findAttribute("financeMoneyTenDays");
					BigDecimal finMoneyAMonth = (BigDecimal)pageContext.findAttribute("financeMoneyAMonth");
					BigDecimal finMoneyTwoMonths = (BigDecimal)pageContext.findAttribute("financeMoneyTwoMonths");
					BigDecimal finMoneyThreeMonths = (BigDecimal)pageContext.findAttribute("financeMoneyThreeMonths");
					BigDecimal finMoneySixMonths = (BigDecimal)pageContext.findAttribute("financeMoneySixMonths");
					BigDecimal finMoneyMoreSixMonths = (BigDecimal)pageContext.findAttribute("financeMoneyMoreSixMonths");
					//获取财政扶持项目合计金额（资金支出）
					BigDecimal govMoney = (BigDecimal)pageContext.findAttribute("governmentMoney");
					BigDecimal govMoneyTenDays = (BigDecimal)pageContext.findAttribute("governmentMoneyTenDays");
					BigDecimal govMoneyAMonth = (BigDecimal)pageContext.findAttribute("governmentMoneyAMonth");
					BigDecimal govMoneyTwoMonths = (BigDecimal)pageContext.findAttribute("governmentMoneyTwoMonths");
					BigDecimal govMoneyThreeMonths = (BigDecimal)pageContext.findAttribute("governmentMoneyThreeMonths");
					BigDecimal govMoneySixMonths = (BigDecimal)pageContext.findAttribute("governmentMoneySixMonths");
					BigDecimal govMoneyMoreSixMonths = (BigDecimal)pageContext.findAttribute("governmentMoneyMoreSixMonths");
					//获取代持项目合计金额（资金支出）
					BigDecimal hdMoneys = (BigDecimal)pageContext.findAttribute("holdMoney");
					BigDecimal hdMoneyTenDays = (BigDecimal)pageContext.findAttribute("holdMoneyTenDays");
					BigDecimal hdMoneyAMonth = (BigDecimal)pageContext.findAttribute("holdMoneyAMonth");
					BigDecimal hdMoneyTwoMonths = (BigDecimal)pageContext.findAttribute("holdMoneyTwoMonths");
					BigDecimal hdMoneyThreeMonths = (BigDecimal)pageContext.findAttribute("holdMoneyThreeMonths");
					BigDecimal hdMoneySixMonths = (BigDecimal)pageContext.findAttribute("holdMoneySixMonths");
					BigDecimal hdMoneyMoreSixMonths = (BigDecimal)pageContext.findAttribute("holdMoneyMoreSixMonths");
					//计算财政资金缺口合计金额
					BigDecimal financeTotal = ((totalSettlementFinance.add(finMoneys)).subtract(govMoney)).subtract(hdMoneys);
					BigDecimal financeTenDaysTotal = tenDaysSettlementFinance.add(finMoneyTenDays).subtract(govMoneyTenDays).subtract(hdMoneyTenDays);
					BigDecimal financeAMonthTotal = aMonthSettlementFinance.add(finMoneyAMonth).subtract(govMoneyAMonth).subtract(hdMoneyAMonth);
					BigDecimal financeTwoMonthsTotal = twoMonthsSettlementFinance.add(finMoneyTwoMonths).subtract(govMoneyTwoMonths).subtract(hdMoneyTwoMonths);
					BigDecimal financeThreeMonthsTotal = threeMonthsSettlementFinance.add(finMoneyThreeMonths).subtract(govMoneyThreeMonths).subtract(hdMoneyThreeMonths);
					BigDecimal financeSixMonthsTotal = sixMonthsSettlementFinance.add(finMoneySixMonths).subtract(govMoneySixMonths).subtract(hdMoneyMoreSixMonths);
					BigDecimal financeMoreSixMonthsTotal = moreSixMonthsSettlementFinance.add(finMoneyMoreSixMonths).subtract(govMoneyMoreSixMonths).subtract(hdMoneyMoreSixMonths);
				 %>
				 <tr>
				 	<td align="center"><B>六</B></td>
					<td colspan="2"><B>财政资金缺口</B></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=financeTotal%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=financeTenDaysTotal%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=financeAMonthTotal%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=financeTwoMonthsTotal%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=financeThreeMonthsTotal%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=financeSixMonthsTotal%>" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="<%=financeMoreSixMonthsTotal%>" type="number" pattern="#,##0.00" /></div></td>
				</tr>
            </tbody>
        </table>
        <table>
            <tr>
            	<td>编制人：</td>
            	<td>${org }</td>
            	<td>分管领导：</td>
            	<td>${leader }</td>
            </tr>
         </table>
          <table>
            <tr>
            <td>未上报部门为：</td>
            <c:forEach var="group" items="${groupList}">
            	<td>${group.name}</td>
            </c:forEach>
            </tr>
         </table>
</body>
</html>