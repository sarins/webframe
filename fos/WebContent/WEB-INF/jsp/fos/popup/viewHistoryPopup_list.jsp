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
<c:set var="currentGridId" value="tb_financingDetailHistory_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form name="financingDetail" onsubmit="return false">
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">历史详情列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="financingDetail" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
   	 	<div class="clear"></div>
    </div>
<div class="grid">
<table  width="100%" class="resize" id="tb_financingDetailHistory_table_list">
	 <thead>
		<tr>
			<th>机构名称</th>
			<th>信息类别</th>
	        <th>合同编码</th>
	        <th>金额</th>
			<th>利率</th>
			<th>结息方式</th>
			<th>起始日</th>
			<th>截止日</th>
			<th>实际截止日期</th>
			<th>付息明细</th>
		</tr>
		</thead>
	<tbody>
	<c:forEach var="financingDetailHistory" items="${pageBean.dataList}" varStatus="s">
	<tr class="gradeX">
		<td ><c:out value="${financingDetailHistory.mecName}"/></td>
		<td >
			<c:if test="${financingDetailHistory.infoCategory eq '1'}">融资</c:if>
			<c:if test="${financingDetailHistory.infoCategory eq '2'}">授信</c:if>
		</td>
		<td><c:out value="${financingDetailHistory.contactNumber}"></c:out></td>
		<td><fmt:formatNumber value="${financingDetailHistory.financingMoney}" type="number" pattern="#,##0.00" /></td>
		<td><c:out value="${financingDetailHistory.interestRate}"></c:out>%</td>
		<td>
			<c:if test="${financingDetailHistory.endIntMode  eq '1'}">月结</c:if>
			<c:if test="${financingDetailHistory.endIntMode  eq '2'}">季结</c:if>
			<c:if test="${financingDetailHistory.endIntMode  eq '3'}">年结</c:if>
		</td>
		<td><fmt:formatDate value="${financingDetailHistory.startDate}" pattern="yyyy-MM-dd" /></td>
		<td><fmt:formatDate value="${financingDetailHistory.endDate}" pattern="yyyy-MM-dd" /></td>
		<td><fmt:formatDate value="${financingDetailHistory.realEndDate}" pattern="yyyy-MM-dd" /></td>
		<td>
			<a href="#"  onclick="payInterestDetail('${financingDetailHistory.id}','${financingDetailHistory.endIntMode}');">付息明细</a>
		</td>
	</tr>
	</c:forEach>
	 </tbody>
</table>
</div>
    <div class="gridToolbar">
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="financingDetail" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
   	 	<div class="clear"></div>
    </div>
</div>
</form:form>
<script language="javascript">
var api = frameElement.api, W = api.opener;
function payInterestDetail(financeId,endIntMode){
	$.dialog( {
		id: financeId,
		title : '付息明细列表',
		content: 'url:financing.do?actionMethod=payInterestDetail&financeId=' + financeId
				+ '&endIntMode=' + endIntMode,
		width : 600,
		height : 320,
		zIndex : "2000",
		parent:api,
		close:function(){
			if($.browser.mozilla || $.browser.msie){
				W.$("body").append("<div id='ldg_lockmask'>&nbsp;</div>");
			}
		}
	});
}
</script>

