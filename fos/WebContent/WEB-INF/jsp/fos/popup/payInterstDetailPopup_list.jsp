<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="${ht_globalUrl}/css/cmsDefault.css"/>
<link rel="stylesheet" type="text/css" href="${ht_globalUrl}/css/jquery.dataTables.css"/>
<script type="text/javascript" src="${ht_globalUrl}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/lhgdialog.min.js"></script>
<c:set var="currentGridId" value="tb_financingDetailHistory1_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form name="financingDetail" target="_blank" action="financing.do?actionMethod=exportPaymentInterst" onsubmit="return false">
<input type="hidden" id="financeId" name="financeId" value="${financingDetail.id}"></input>
<div class="gridInfo">
<div class="grid">
<div class="operationTool">
	<ul>
    	<li><a href="javascript:;" title="查询结果导出Excel">
				<img src="${ht_globalUrl}/images/excel.jpg" width="55px" height="23px" onclick="exportExcel();"/>
			</a>
		</li>
    </ul>
    <div class="clear"></div>
</div>
<table>
	<tr>
		<td colspan="4">机构名称:<c:out value="${financingDetail.mecName}"/>&nbsp;&nbsp;&nbsp;&nbsp;融资总额:<c:out value="${financingDetail.financingMoney}"/>万元</td>
	</tr>
</table>
<table  width="100%" class="resize" id="tb_financingDetailHistory1_table_list">
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
</div>
</div>
</form:form>
<script language="javascript">
function exportExcel(){
	document.financingDetail.submit();
}
</script>

