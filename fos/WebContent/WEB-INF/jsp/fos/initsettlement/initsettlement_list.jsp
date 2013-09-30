<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="currentGridId" value="tb_initSettlement_table_list"></c:set>
<%@ include file="/init_script.jsp"%>
<div class="gridInfo">
<div class="gridToolbar">
<div class="gridHeaderName">期初结转资金列表</div>
<div class="gridPageBtn"><huatek:ajaxCutPage
	pageBean="${pageBean}" formName="initSettlement"
	offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/></div>
<div class="clear"></div>
</div>
<div class="grid">
<table width="100%" class="resize" id="tb_initSettlement_table_list">
	<thead>
		<tr>
			<th>序号</th>
			<th>类型分类</th>
			<th>统计日期</th>
			<th width="40px">10日内期初结转金额（万元）</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="initSettlement" items="${pageBean.dataList}"
			varStatus="s">
			<tr class="gradeX">
				<td><c:out value="${s.index+1}" /></td>
				<td>
				<c:if test="${initSettlement.useType eq '1'}">自有资金期初结转金额</c:if>
				<c:if test="${initSettlement.useType eq '2'}">财政专户期初结转金额</c:if>
				</td>
				<td><fmt:formatDate value="${initSettlement.gatherDate}" pattern="yyyy-MM-dd"/></td>
				<td><div style="text-align:right;"><fmt:formatNumber value="${initSettlement.settlementMoney}" type="number" pattern="#,##0.00"/></div></td>
				<td>
				<a href="#" onclick="getData('initSettlement.do?actionMethod=editQuery&initSettlementId=${initSettlement.id}','','workspace');">修改</a>&nbsp;
				<a href="#" onclick="deleteData('${initSettlement.id}');">删除</a></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
<div class="gridToolbar">
<div class="gridPageBtn"><huatek:ajaxCutPage
	pageBean="${pageBean}" isOuterForm="true" formName="initSettlement"
	offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/></div>
<div class="clear"></div>
</div>
</div>