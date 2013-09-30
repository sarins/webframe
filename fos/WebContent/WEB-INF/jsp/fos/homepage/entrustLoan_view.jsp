<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="${ht_globalUrl}/css/cmsDefault.css"/>
<link rel="stylesheet" type="text/css" href="${ht_globalUrl}/css/jquery.dataTables.css"/>
<script type="text/javascript" src="${ht_globalUrl}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/cmsDefault.js"></script>
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
				</td>
				<td class="formElem labelName"><label>贷款状态：</label></td>
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
				<td class="formElem labelName"></td>
				<td class="formElem lessTen"></td>
			</tr>
			<tr>
				<td class="formElem labelName"><label>备注：</label></td>
				<td class="formElem lessTen" colspan="3"><c:out value="${entrustLoan.remarks}"/></td>
			</tr>
		</tbody>
	</table>
	</div>
	</div>
</form:form>
