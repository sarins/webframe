<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form:form modelAttribute="fundsApplyGather" name="ec" target="_blank" action="fundsApplyGather.do?actionMethod=gatherExport">
<div class="operationTool">
	<ul>
    	<li><a href="javascript:;" title="查询结果导出Excel">
				<img src="${ht_globalUrl}/images/excel.jpg" width="55px" height="23px" onclick="exportExcel();"/>
				<input type="hidden" name="gatherDate" id="gatherDate" value="${gatherDate}">
			</a>
		</li>
		<li>
		<input type="button" value="返回" class="buttonCls" onclick="getData('fundsGatherView.do?actionMethod=queryBoss','','workspace');"/>
		</li>
    </ul>
    <div class="clear"></div>
</div>
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">资金运用计划汇总列表</div>
        <div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize" border='1' id="tb_fundsApply_gather_table_list">
            <thead>
                <tr>
				<th>项目分类</th>
				<th>项目</th>
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
            <c:set value="0" var="SummaryMoney"></c:set>
            <c:set value="0" var="SummaryMoneyTenDays"></c:set>
            <c:set value="0" var="SummaryMoneyAMonth"></c:set>
            <c:set value="0" var="SummaryMoneyTwoMonths"></c:set>
            <c:set value="0" var="SummaryMoneyThreeMonths"></c:set>
            <c:set value="0" var="SummaryMoneySixMonths"></c:set>
            <c:set value="0" var="SummaryMoneyMoreSixMonths"></c:set>
                <c:forEach var="sourceUseFunds" items="${pageBean.dataList}" varStatus="s">
                <c:if test="${sourceUseFunds.firstProjectCount!=null}">
	            <tr>
					<td rowspan="${sourceUseFunds.firstProjectCount+1}">
	            		<c:if test="${sourceUseFunds.firstProjectCount!=null}"><c:out value="${sourceUseFunds.firstCategory.proCateName}"/></c:if>
	            	</td>
	            	<td><B>分类小计</B></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.firstProjectMoneySummary}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${SummaryMoney+sourceUseFunds.firstProjectMoneySummary}" var="SummaryMoney"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.tenDaysMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${SummaryMoneyTenDays+sourceUseFunds.tenDaysMoneySummaryFirst}" var="SummaryMoneyTenDays"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.aMonthMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${SummaryMoneyAMonth+sourceUseFunds.aMonthMoneySummaryFirst}" var="SummaryMoneyAMonth"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.twoMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${SummaryMoneyTwoMonths+sourceUseFunds.twoMonthsMoneySummaryFirst}" var="SummaryMoneyTwoMonths"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.threeMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${SummaryMoneyThreeMonths+sourceUseFunds.threeMonthsMoneySummaryFirst}" var="SummaryMoneyThreeMonths"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.sixMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${SummaryMoneySixMonths+sourceUseFunds.sixMonthsMoneySummaryFirst}" var="SummaryMoneySixMonths"></c:set>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.moreSixMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div></td>
					<c:set value="${SummaryMoneyMoreSixMonths+sourceUseFunds.moreSixMonthsMoneySummaryFirst}" var="SummaryMoneyMoreSixMonths"></c:set>
				</tr>
                </c:if>
				<tr <c:if test="${!(s.index%2==0)}"> class="tdbgcolor"</c:if>>
					<td><c:out value="${sourceUseFunds.projectName}"/></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.summaryMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.tenDaysMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.aMonthMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.twoMonthsMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.threeMonthsMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.sixMonthsMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.moreSixMonthsMoney}" type="number" pattern="#,##0.00" />
					</div></td>
			 </tr>
			</c:forEach>
	            <tr>
					<td colspan="2"><B>总计</B></td>
	            	
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${SummaryMoney}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${SummaryMoneyTenDays}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${SummaryMoneyAMonth}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${SummaryMoneyTwoMonths}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${SummaryMoneyThreeMonths}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${SummaryMoneySixMonths}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${SummaryMoneyMoreSixMonths}" type="number" pattern="#,##0.00" /></div></td>
				</tr>
            </tbody>
        </table>
    </div>
    <div class="gridToolbar">
        <div class="clear"></div>
    </div>
    </div>
</form:form>
<script language="javascript">
function exportExcel(){
	document.ec.submit();
}
</script>

