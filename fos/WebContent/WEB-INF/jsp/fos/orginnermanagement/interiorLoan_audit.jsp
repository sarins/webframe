<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="currentGridId" value="tb_interior_reason_audit"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="interiorLoan" name="interiorLoan" onsubmit="return false">
	<div class="widget">
	<div class="widgetTitle"><span class="widgetTitleIco">审核详细信息</span>
	</div>
	<div class="widgetContainer">
	<table class="formInfo">
		<tbody>
			<tr>
				<td class="formElem labelName"><label>借款人：</label></td>
				<td class="formElem lessTen"><c:out value="${interiorLoan.loanUser}"/></td>
				<td class="formElem labelName"><label>起息日：</label></td>
				<td class="formElem lessTen"><fmt:formatDate value="${interiorLoan.startRateDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>借款金额：</label></td>
				<td class="formElem lessTen"><fmt:formatNumber value="${interiorLoan.loanMoney}" type="number" pattern="#,##0.00" />万元</td>
				<td class="formElem labelName"><label>到期日：</label></td>
				<td class="formElem lessTen"><fmt:formatDate value="${interiorLoan.endRateDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>代理银行：</label></td>
				<td class="formElem lessTen"><c:out value="${interiorLoan.loanBank}"/></td>
				<td class="formElem labelName"><label>期限：</label></td>
				<td class="formElem lessTen"><c:out value="${interiorLoan.timeLimit}"/>天</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>合同利率：</label></td>
				<td class="formElem lessTen"><c:out value="${interiorLoan.contractRates}"/>%</td>
				<td class="formElem labelName"><label>计提天数：</label></td>
				<td class="formElem lessTen"><c:out value="${interiorLoan.provisionDays}"/>天</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>实际利率：</label></td>
				<td class="formElem lessTen"><c:out value="${interiorLoan.realRates}"/>%</td>
				<td class="formElem labelName"><label>利息收入：</label></td>
				<td class="formElem lessTen"><fmt:formatNumber value="${interiorLoan.interestIncome}" type="number" pattern="#,##0.00" />万元</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>财务顾问费：</label></td>
				<td class="formElem lessTen"><fmt:formatNumber value="${interiorLoan.adviserCost}" type="number" pattern="#,##0.00" />万元</td>
				<td class="formElem labelName"><label>结息日：</label></td>
				<td class="formElem lessTen"><c:out value="${interiorLoan.endInterestDate}"/>日</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>付息方式：</label></td>
				<td class="formElem lessTen">
					<c:if test="${interiorLoan.endInterestMode  eq '1'}">月结</c:if>
					<c:if test="${interiorLoan.endInterestMode  eq '2'}">季结</c:if>
					<c:if test="${interiorLoan.endInterestMode  eq '3'}">年结</c:if>
				</td>
				<td class="formElem labelName"><label>借款状态：</label></td>
				<td class="formElem lessTen">
					<c:if test="${interiorLoan.loanStatus  eq '1'}">正常</c:if>
					<c:if test="${interiorLoan.loanStatus  eq '2'}">逾期还款</c:if>
					<c:if test="${interiorLoan.loanStatus  eq '3'}">续贷</c:if>
				</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>是否延期：</label></td>
				<td class="formElem lessTen">
					<c:if test="${interiorLoan.isDelay  eq '0'}">否</c:if>
					<c:if test="${interiorLoan.isDelay  eq '1'}">是</c:if>
				</td>
				<td class="formElem labelName"><label>延期起始日：</label></td>
				<td class="formElem lessTen"><fmt:formatDate value="${interiorLoan.delayStartDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>延期截至日：</label></td>
				<td class="formElem lessTen"><fmt:formatDate value="${interiorLoan.delayEndDate}" pattern="yyyy-MM-dd" /></td>
				<td class="formElem labelName"><label>还款周期：</label></td>
				<td class="formElem lessTen">
						<c:if test="${interiorLoan.repayPeriod  eq '365'}">365</c:if>
						<c:if test="${interiorLoan.repayPeriod  eq '360'}">360</c:if>
				</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>备注：</label></td>
				<td class="formElem lessTen"><c:out value="${interiorLoan.remarks}"/></td>
				<td class="formElem labelName"><label></label></td>
				<td class="formElem lessTen"></td>
			</tr>
		</tbody>
	</table>
	<table class="formInfo">
		<tr>
			<td>
			<div class="gridInfo">
			<div class="gridToolbar">
			<div class="gridHeaderName">驳回记录</div>
			<div class="clear"></div>
			</div>
			<div class="grid">
			<table width="100%" class="resize" id="tb_interior_reason_audit">
				<thead>
					<tr>
						<th>序号</th>
						<th>驳回日期</th>
						<th>驳回原因</th>
						<th>驳回人</th>
					</tr>
				</thead>
				<tbody>
				 <c:forEach var="ioanReasonRecord" items="${ioanReasonRecord}" varStatus="s">
					<tr >
						<td><c:out value="${s.index+1}"/></td>
						<td><fmt:formatDate value="${ioanReasonRecord.rejDate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
						<td>
							<div title="${ioanReasonRecord.rejReason}">
							<huatek:out value="${ioanReasonRecord.rejReason}" size="20" encode="true"/>
							</div>
						</td>
						<td><c:out value="${ioanReasonRecord.rejUserName}"/></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			</div>
			</div>
			</td>
		</tr>
	</table>
	<table class="formInfo">

		<tr>
			<td class="formElem lessTen">驳回原因：<textarea name="rejectReason" id="rejectReason" class=""></textarea></td>
		</tr>
		<tr>
			<td><input type="button" value="审核通过" class="buttonCls" onclick="auditSubmit('${interiorLoan.id}','1');"/>&nbsp;&nbsp;
				<input type="button" value="驳回" class="buttonCls" onclick="auditSubmit('${interiorLoan.id}','2');"/>&nbsp;&nbsp;
				<input type="button" value="返回" class="buttonCls" onclick="getData('orgInner.do?actionMethod=queryAudit','','workspace');"/></td>
		</tr>
	</table>
	</div>
	</div>
	<div id="resultList"></div>
</form:form>
<script language="javascript">
$("document").ready(function(){
});

function auditSubmit(interiorId,status){
	if(confirm('确认操作?')){
		postDataByURL('orgInner.do?actionMethod=audit&interiorId='+interiorId+'&status='+status,$('#interiorLoan').serialize(),'workspace');
	}
}
</script>
