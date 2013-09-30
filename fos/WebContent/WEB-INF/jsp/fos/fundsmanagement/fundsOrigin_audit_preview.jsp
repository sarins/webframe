<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_funds_Ori_table_list"></c:set>
<c:set var="currentGridId" value="tb_funds_reason_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="sourceUseFunds" name="ec" onsubmit="return false">
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">资金来源计划列表</div>
       
        <div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" border='1' class="resize" id="tb_funds_Ori_table_list">
            <thead>
                <tr>
				<th>一级项目分类</th>
				<th>二级项目分类</th>
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
					<td rowspan="${sourceUseFunds.firstProjectCount+sourceUseFunds.secondCountUnderFirst+1}">
	            		<c:if test="${sourceUseFunds.firstProjectCount!=null}"><c:out value="${sourceUseFunds.firstCategory.proCateName}"/></c:if>
	            	</td>
	            	<td><B>一级分类小计</B></td>
	            	<td>&nbsp;</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.firstProjectMoneySummary}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${SummaryMoney+sourceUseFunds.firstProjectMoneySummary}" var="SummaryMoney"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.tenDaysMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${SummaryMoneyTenDays+sourceUseFunds.tenDaysMoneySummaryFirst}" var="SummaryMoneyTenDays"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.aMonthMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${SummaryMoneyAMonth+sourceUseFunds.aMonthMoneySummaryFirst}" var="SummaryMoneyAMonth"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.twoMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${SummaryMoneyTwoMonths+sourceUseFunds.twoMonthsMoneySummaryFirst}" var="SummaryMoneyTwoMonths"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.threeMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${SummaryMoneyThreeMonths+sourceUseFunds.threeMonthsMoneySummaryFirst}" var="SummaryMoneyThreeMonths"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.sixMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${SummaryMoneySixMonths+sourceUseFunds.sixMonthsMoneySummaryFirst}" var="SummaryMoneySixMonths"></c:set>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.moreSixMonthsMoneySummaryFirst}" type="number" pattern="#,##0.00" /></div>
					<c:set value="${SummaryMoneyMoreSixMonths+sourceUseFunds.moreSixMonthsMoneySummaryFirst}" var="SummaryMoneyMoreSixMonths"></c:set>
					</td>
				</tr>
                </c:if>
                <c:if test="${sourceUseFunds.secondProjectCount!=null}">
	            <tr>
	            	<td rowspan="${sourceUseFunds.secondProjectCount+1}">
	            		<c:if test="${sourceUseFunds.secondProjectCount!=null}"><c:out value="${sourceUseFunds.sencondCategory.proCateName}"/></c:if>
	            	</td>
					<td><B>二级分类小计</B></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.secondProjectMoneySummary}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.tenDaysMoneySummarySecond}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.aMonthMoneySummarySecond}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.twoMonthsMoneySummarySecond}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.threeMonthsMoneySummarySecond}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.sixMonthsMoneySummarySecond}" type="number" pattern="#,##0.00" /></div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.moreSixMonthsMoneySummarySecond}" type="number" pattern="#,##0.00" /></div></td>
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
					<td colspan="3"><B>总计</B></td>
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
    <table width="100%">
	<tr>
		<td>
		<div class="gridInfo">
		    <div class="gridToolbar">
		        <div class="gridHeaderName">驳回记录</div>
		        <div class="clear"></div>
		    </div>
		    <div class="grid">
			        <table width="100%"  class="resize" id="tb_funds_reason_table_list">
			            <thead>
			            <tr>
			            	<th>序号</th>
							<th>驳回日期</th>
							<th>驳回原因</th>
							<th>驳回人</th>
						</tr>
			            </thead>
			            <tbody>
			            <c:forEach var="reason" items="${reasonList}" varStatus="s">
			                <tr class="gradeX">
								<td><c:out value="${s.index+1}"/></td>
								<td><fmt:formatDate value="${reason.rejDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
								<td><div title="${reason.rejReason}"><huatek:out value="${reason.rejReason}" size="20" encode="true"/></div></td>
								<td><c:out value="${reason.rejUserName}"/></td>
			                </tr>
			                </c:forEach>
			            </tbody>
			        </table>
		    </div>
	  	</div>
		</td>
	</tr>
	<tr>
		<td class="formElem lessTen"><c:if test="${opType=='audit'}">驳回原因：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="rejectReason" id="rejectReason" class=""></textarea></c:if></td>
	</tr>
	<tr>
		<td>
		<input type="hidden" name="opType" id="opType" value="${opType}">
		<c:if test="${opType=='audit'}"><input type="button" value="审核通过" class="buttonCls" onclick="auditSubmit('${auditId}','1');"/>&nbsp;
		<input type="button" value="驳回" class="buttonCls" onclick="auditSubmit('${auditId}','2');"/>
		</c:if>
		<c:if test="${opType=='editSubmit'}"><input type="button" value="确认提交" class="buttonCls" onclick="confirmSubmit('${auditId}');"/></c:if>
		&nbsp;&nbsp;<input type="button" value="返回" class="buttonCls" onclick="getData('fundsOriginAudit.do?actionMethod=query&opType=${opType}','','workspace');"/>
		</td>
	</tr>
</table>
</form:form>
<script language="javascript">
$("document").ready(function(){
});
function confirmSubmit(auditId){
	if(confirm('确认要提交吗?')){
		postDataByURL('fundsOriginAudit.do?actionMethod=confirmSubmit&id='+auditId,$('#sourceUseFunds').serialize(),'workspace');
	}
}
function auditSubmit(auditId,status){
	if(confirm('确认操作?')){
		postDataByURL('fundsOriginAudit.do?actionMethod=auditSubmit&id='+auditId+'&status='+status,$('#sourceUseFunds').serialize(),'workspace');
	}
}
</script>