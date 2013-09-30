<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form:form modelAttribute="entrustLoan" name="entrustLoan" onsubmit="return false">
<div class="widget">
	<div class="widgetTitle">
    	<span class="widgetTitleIco">委托贷款</span>
    	<span class="toggle"><a href="javascript:;">&nbsp;</a></span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
                <tr>
					<td class="formElem labelName"><label><span class="redmark">*</span>借款人：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="loanUser" id="loanUser" value="<c:out value="${entrustLoan.loanUser}"/>"/></td>
                	<td class="formElem labelName"><label><span class="redmark">*</span>委托贷款金额：</label></td>
                    <td class="formElem">
					 <table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText" name="loanMoney" id="loanMoney" value="<c:out value="${entrustLoan.loanMoney}"/>"/></td>
                    			<td>万元</td>
                    		</tr>
                    </table>
               	 	</td>
					<td class="formElem labelName"><label><span class="redmark">*</span>委托代理银行：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="loanBank" id="loanBank" value="<c:out value="${entrustLoan.loanBank}"/>"></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>合同利率：</label></td>
                    <td class="formElem">
					 <table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText" name="contractRates" id="contractRates" value="<c:out value="${entrustLoan.contractRates}"/>"></td>
                    			<td>%</td>
                    		</tr>
                    </table>
               		</td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>实际利率：</label></td>
                    <td class="formElem">
					 <table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText" name="realRates" id="realRates" value="<c:out value="${entrustLoan.realRates}"/>"></td>
                    			<td>%</td>
                    		</tr>
                    </table>
               		</td>
                    <td class="formElem labelName"><label>财务顾问费：</label></td>
                    <td class="formElem">
                    	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText" name="adviserCost" id="adviserCost" value="<c:out value="${entrustLoan.adviserCost}"/>"/></td>
                    			<td>万元</td>
                    		</tr>
                    	</table>
                    </td>
                </tr>
				<tr>

                    <td class="formElem labelName"><label><span class="redmark">*</span>起息日：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="startRateDate" id="startRateDate" value="<fmt:formatDate value="${entrustLoan.startRateDate}" pattern="yyyy-MM-dd" />" readonly="readonly"/>
                    </td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>到期日：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="endRateDate" id="endRateDate" value="<fmt:formatDate value="${entrustLoan.endRateDate}" pattern="yyyy-MM-dd" />"  readonly="readonly"/>
                    </td>
                    <td class="formElem labelName"><span class="redmark">*</span><label>期限：</label></td>
                    <td class="formElem">
                    	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText"  name="timeLimit" id="timeLimit" value="<c:out value="${entrustLoan.timeLimit}"/>"/></td>
                    			<td>月</td>
                    		</tr>
                    	</table>
                    </td>
                </tr>
                <tr>
					<td class="formElem labelName"><label>计提天数：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="provisionDays" id="provisionDays" value="<c:out value="${entrustLoan.provisionDays}"/>"/></td>
                	<td class="formElem labelName"><label>利息收入：</label></td>
                	<td class="formElem">
                    	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText" name="interestIncome" id="interestIncome" value="<c:out value="${entrustLoan.interestIncome}"/>"/></td>
                    			<td>万元</td>
                    		</tr>
                    	</table>
                   	</td>
					<td class="formElem labelName"><span class="redmark">*</span><label>结息日：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'dd'});" name="endInterestDate" id="endInterestDate" value="<c:out value="${entrustLoan.endInterestDate}"/>"/>
                    </td>
                </tr>

				<tr>
                    <td class="formElem labelName"><span class="redmark">*</span><label>付息方式：</label></td>
                    <td class="formElem">
					<select name="endInterestMode" id="endInterestMode">
							<option value="">---请选择---</option>
							<option value="1" <c:if test="${entrustLoan.endInterestMode  eq '1'}">selected </c:if>>月结</option>
							<option value="2" <c:if test="${entrustLoan.endInterestMode  eq '2'}">selected </c:if>>季结</option>
							<option value="3" <c:if test="${entrustLoan.endInterestMode  eq '3'}">selected </c:if>>年结</option>
					</select>
                    </td>
                    <td class="formElem labelName"><span class="redmark">*</span><label>贷款状态：</label></td>
                    <td class="formElem">
						<huatek:dicSelect name="loanStatus" category="loanStatus" id="loanStatus" value="${entrustLoan.loanStatus}"/>
                    </td>
                    <td class="formElem labelName"><label>还款周期:</label></td>
                    <td class="formElem">
                    	<select name="replyPeriod" id="replyPeriod">
							<option value="365" <c:if test="${entrustLoan.replyPeriod  eq '365'}">selected </c:if>>365</option>
							<option value="360" <c:if test="${entrustLoan.replyPeriod  eq '360'}">selected </c:if>>360</option>
						</select>
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label>备注：</label></td>
                    <td class="formElem moreTen" colspan="5">
                    	<textarea name="remarks" id="remarks"><c:out value="${entrustLoan.remarks}"></c:out></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="editePageBtn">
    	<ul>
            <li><input type="button" value="保存" class="buttonCls" onclick="saveData();"/></li>
            <li><input type="button" value="清空" class="buttonCls" onclick="cleanText();"/></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
<div id="resultList">
</div>
</form:form>
<script language="javascript">
$("document").ready(function(){
	queryData();
});
function queryData(){
	postDataByURL('entrustLoan.do?actionMethod=editQuery',$('#entrustLoan').serialize(),'resultList');
}
function saveData(){
	postDataByURL('entrustLoan.do?actionMethod=edit',$('#entrustLoan').serialize(),'workspace');
}
function deleteData(entrustLoanId){
	if(confirm("确定删除？")){
		postDataByURL('entrustLoan.do?actionMethod=delete&entrustLoanId='+entrustLoanId,$('#entrustLoan').serialize(),'workspace');
	}
}
function payInterestDetail(entrustLoanId,endIntMode){
	$.dialog({
		id: entrustLoanId + endIntMode,
		title : '付息明细列表',
		content: 'url:entrustLoan.do?actionMethod=payInterestDetail&entrustLoanId=' + entrustLoanId + '&endIntMode=' + endIntMode,
		width : 800,
		height : 520,
		lock : true
	});
}
/*
清空查询条件操作
	*/
function cleanText(){
	document.getElementById('loanUser').value='';
	document.getElementById('loanMoney').value='';
	document.getElementById('loanBank').value='';

	document.getElementById('contractRates').value='';
	document.getElementById('realRates').value='';
	document.getElementById('adviserCost').value='';

	document.getElementById('startRateDate').value='';
	document.getElementById('endRateDate').value='';
	document.getElementById('timeLimit').value='';

	document.getElementById('provisionDays').value='';
	document.getElementById('interestIncome').value='';

	document.getElementById('endInterestMode').value='';
	document.getElementById('loanStatus').value='';

	document.getElementById('remarks').value='';
}
</script>