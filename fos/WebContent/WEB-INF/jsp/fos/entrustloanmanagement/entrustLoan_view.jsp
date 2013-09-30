<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="currentGridId" value="tb_entrust_reason_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="entrustLoan" name="entrustLoan" onsubmit="return false">
	<div class="widget">
	<div class="widgetTitle"><span class="widgetTitleIco">委托贷款详细信息</span>
	</div>
	<div class="widgetContainer">
	<table class="formInfo">
		<tbody>
			<tr>
				<td class="formElem labelName"><label>借款人：</label></td>
				<td class="formElem lessTen"><c:out value="${entrustLoan.loanUser}"/></td>
				<td class="formElem labelName"><label>起息日：</label></td>
				<td class="formElem lessTen"><fmt:formatDate value="${entrustLoan.startRateDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>贷款金额：</label></td>
				<td class="formElem lessTen"><fmt:formatNumber value="${entrustLoan.loanMoney}" type="number" pattern="#,##0.00" />万元</td>
				<td class="formElem labelName"><label>到期日：</label></td>
				<td class="formElem lessTen"><fmt:formatDate value="${entrustLoan.endRateDate}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>代理银行：</label></td>
				<td class="formElem lessTen"><c:out value="${entrustLoan.loanBank}"/></td>
				<td class="formElem labelName"><label>期限：</label></td>
				<td class="formElem lessTen"><c:out value="${entrustLoan.timeLimit}"/>月</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>合同利率：</label></td>
				<td class="formElem lessTen"><c:out value="${entrustLoan.contractRates}"/>%</td>
				<td class="formElem labelName"><label>计提天数：</label></td>
				<td class="formElem lessTen"><c:out value="${entrustLoan.provisionDays}"/>天</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>实际利率：</label></td>
				<td class="formElem lessTen"><c:out value="${entrustLoan.realRates}"/>%</td>
				<td class="formElem labelName"><label>利息收入：</label></td>
				<td class="formElem lessTen"><fmt:formatNumber value="${entrustLoan.interestIncome}" type="number" pattern="#,##0.00" />万元</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>财务顾问费：</label></td>
				<td class="formElem lessTen"><fmt:formatNumber value="${entrustLoan.adviserCost}" type="number" pattern="#,##0.00" />万元</td>
				<td class="formElem labelName"><label>结息日：</label></td>
				<td class="formElem lessTen"><c:out value="${entrustLoan.endInterestDate}"/>日</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>付息方式：</label></td>
				<td class="formElem lessTen">
					<c:if test="${entrustLoan.endInterestMode  eq '1'}">月结</c:if>
					<c:if test="${entrustLoan.endInterestMode  eq '2'}">季结</c:if>
					<c:if test="${entrustLoan.endInterestMode  eq '3'}">年结</c:if>
				</td>
				<td class="formElem labelName"><label>借款状态：</label></td>
				<td class="formElem lessTen">
					<huatek:dicOut category="loanStatus" value="${entrustLoan.loanStatus}"/>
				</td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>还款周期：</label></td>
				<td class="formElem lessTen">
						<c:if test="${entrustLoan.replyPeriod  eq '360'}">360</c:if>
						<c:if test="${entrustLoan.replyPeriod  eq '365'}">365</c:if>
				</td>
				<td class="formElem labelName"><label></label></td>
				<td class="formElem lessTen"></td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>备注：</label></td>
				<td class="formElem lessTen" colspan="3"><c:out value="${entrustLoan.remarks}"/></td>
			</tr>
		</tbody>
	</table>
	<table width="100%">
	<tr>
		<td>
		<div class="gridInfo">
		    <div class="gridToolbar">
		        <div class="gridHeaderName">驳回记录</div>
		        <div class="clear"></div>
		    </div>
		    <div class="grid">
			        <table width="100%"  class="resize" id="tb_entrust_reason_table_list">
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
		<c:if test="${opType=='audit'}"><input type="button" value="审核通过" class="buttonCls" onclick="auditSubmit('${entrustLoan.id}','1');"/>&nbsp;
		<input type="button" value="驳回" class="buttonCls" onclick="auditSubmit('${entrustLoan.id}','2');"/>
		</c:if>
		<c:if test="${opType=='editSubmit'}"><input type="button" value="确认提交" class="buttonCls" onclick="confirmSubmit('${entrustLoan.id}');"/></c:if>
		&nbsp;&nbsp;<input type="button" value="返回" class="buttonCls" onclick="getData('entrustLoan.do?actionMethod=querySubmitAudit&opType=${opType}','','workspace');"/>
		</td>
	</tr>
</table>
	</div>
	</div>
	<div id="resultList"></div>
</form:form>
<script language="javascript">
$("document").ready(function(){
});
function confirmSubmit(entrustLoanId){
	if(confirm('确认要提交吗?')){
		postDataByURL('entrustLoan.do?actionMethod=confirmSubmit&id='+entrustLoanId,$('#entrustLoan').serialize(),'workspace');
	}
}
function auditSubmit(entrustLoanId,status){
	if(confirm('确认操作?')){
		postDataByURL('entrustLoan.do?actionMethod=auditSubmit&id='+entrustLoanId+'&status='+status,$('#entrustLoan').serialize(),'workspace');
	}
}
</script>
