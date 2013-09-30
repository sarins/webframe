<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style type="text/css">
.hetong{display:display;}
.formElem input.inTextc {
    background-color: #FFFFFF;
    border: 1px solid #D5D5D5;
    font-family: Arial,Helvetica,sans-serif;
    font-size: 12px;
    padding: 2px;
    width: 90%;
}
</style>
<form:form modelAttribute="interiorLoan" name="interiorLoan" onsubmit="return false">
<div class="widget">
	<div class="widgetTitle">
    	<span class="widgetTitleIco">集团内部借款</span>
    	<span class="toggle"><a href="javascript:;">&nbsp;</a></span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
                <tr>
					<td class="formElem labelName"><label><span class="redmark">*</span>借款人：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="loanUser" id="loanUser" value="<c:out value="${interiorLoan.loanUser}"/>"/></td>
                	<td class="formElem labelName"><label><span class="redmark">*</span>借款金额：</label></td>
                	<td class="formElem">
					 	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText" name="loanMoney" id="loanMoney" value="<c:out value="${interiorLoan.loanMoney}"/>"/></td>
                    			<td>万元</td>
                    		</tr>
                     	</table>
               	 	</td>
					<td class="formElem labelName"><label><span class="redmark">*</span>代理银行：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="loanBank" id="loanBank" value="<c:out value="${interiorLoan.loanBank}"/>"></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>合同利率：</label></td>
                	<td class="formElem">
					 	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText" name="contractRates" id="contractRates" value="<c:out value="${interiorLoan.contractRates}"/>"></td>
                    			<td>%</td>
                    		</tr>
                     	</table>
               	 	</td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>实际利率：</label></td>
                    <td class="formElem">
					 	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText" name="realRates" id="realRates" value="<c:out value="${interiorLoan.realRates}"/>"></td>
                    			<td>%</td>
                    		</tr>
                     	</table>
               	 	</td>
                    <td class="formElem labelName"><label>财务顾问费：</label></td>
                    <td class="formElem">
					 	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText" name="adviserCost" id="adviserCost" value="<c:out value="${interiorLoan.adviserCost}"/>"/></td>
                    			<td>万元</td>
                    		</tr>
                     	</table>
               	 	</td>
                </tr>
				<tr>

                    <td class="formElem labelName"><label><span class="redmark">*</span>起息日：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="startRateDate" id="startRateDate" value="<fmt:formatDate value="${interiorLoan.startRateDate}" pattern="yyyy-MM-dd" />" readonly="readonly"/>
                    </td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>到期日：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="endRateDate" id="endRateDate" value="<fmt:formatDate value="${interiorLoan.endRateDate}" pattern="yyyy-MM-dd" />" readonly="readonly"/>
                    </td>
                    <td class="formElem labelName"><label>期限：</label></td>
                    <td class="formElem">
					 	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText"  name="timeLimit" id="timeLimit" value="<c:out value="${interiorLoan.timeLimit}"/>"/></td>
                    			<td>天</td>
                    		</tr>
                     	</table>
               	 	</td>
                </tr>
                <tr>
					<td class="formElem labelName"><label>计提天数：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="provisionDays" id="provisionDays" value="<c:out value="${interiorLoan.provisionDays}"/>"/></td>
                	<td class="formElem labelName"><label>利息收入：</label></td>
                	<td class="formElem">
					 	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inText" name="interestIncome" id="interestIncome" value="<c:out value="${interiorLoan.interestIncome}"/>"/></td>
                    			<td>万元</td>
                    		</tr>
                     	</table>
               	 	</td>
					<td class="formElem labelName"><label>结息日：</label></td>
					<td class="formElem">
						<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'dd'});" name="endInterestDate" id="endInterestDate" value="<c:out value="${interiorLoan.endInterestDate}"/>"/>
               	 	</td>
                </tr>

				<tr>
                    <td class="formElem labelName"><label><span class="redmark">*</span>付息方式：</label></td>
                    <td class="formElem">
					<select name="endInterestMode" id="endInterestMode">
							<option value="">---请选择---</option>
							<option value="1" <c:if test="${interiorLoan.endInterestMode  eq '1'}">selected </c:if>>月结</option>
							<option value="2" <c:if test="${interiorLoan.endInterestMode  eq '2'}">selected </c:if>>季结</option>
							<option value="3" <c:if test="${interiorLoan.endInterestMode  eq '3'}">selected </c:if>>年结</option>
					</select>
                    </td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>借款状态：</label></td>
                    <td class="formElem">
                    <select name="loanStatus" id="loanStatus">
                    		<option value="">---请选择---</option>
							<option value="1" <c:if test="${interiorLoan.loanStatus  eq '1'}">selected </c:if>>正常</option>
							<option value="2" <c:if test="${interiorLoan.loanStatus  eq '2'}">selected </c:if>>逾期还款</option>
							<option value="3" <c:if test="${interiorLoan.loanStatus  eq '3'}">selected </c:if>>续贷</option>
						</select>
                    </td>
                    <td class="formElem labelName"><span class="redmark">*</span><label>是否延期：</label></td>
                    <td class="formElem">
                    	<select onchange="changeDiv(this.value);" name="isDelay" id="isDelay">
							<option value="0" <c:if test="${interiorLoan.isDelay  eq '0'}">selected </c:if>>否</option>
							<option value="1" <c:if test="${interiorLoan.isDelay  eq '1'}">selected </c:if>>是</option>
						</select>
                    </td>
                </tr>
				<tr>
                	  <td class="formElem labelName hetong"><label>延期起始日：</label></td>
                    <td class="formElem hetong">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="delayStartDate" id="delayStartDate" value="<c:out value="${interiorLoan.delayStartDate}"/>"/>
                    </td>
                    <td class="formElem labelName hetong"><label>延期截至日：</label></td>
                    <td class="formElem hetong">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="delayEndDate" id="delayEndDate" value="<c:out value="${interiorLoan.delayEndDate}"/>"/>
                    </td>
                    <td class="formElem labelName hetong"><label></label></td>
                    <td class="formElem hetong"></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label>还款周期：</label></td>
                    <td class="formElem">
                    	<select name="repayPeriod" id="repayPeriod">
							<option value="365" <c:if test="${interiorLoan.repayPeriod  eq '365'}">selected </c:if>>365</option>
							<option value="360" <c:if test="${interiorLoan.repayPeriod  eq '360'}">selected </c:if>>360</option>
						</select>
                    </td>
                    <td class="formElem labelName"><label></label></td>
                    <td class="formElem">
                    </td>
                    <td class="formElem labelName"><label></label></td>
                    <td class="formElem"></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label>备注：</label></td>
                    <td class="formElem moreTen" colspan="5">
                    	<textarea name="remarks" id="remarks"><c:out value="${interiorLoan.remarks}"></c:out></textarea>
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
	$(".hetong").hide();
	var state = $("#isDelay").val();
	if (state == "1"){
 	 	$(".hetong").show();
	}else if(state=="0"){
		$(".hetong").hide();
	}
});
function queryData(){
	postDataByURL('orgInner.do?actionMethod=editQuery',$('#interiorLoan').serialize(),'resultList');
}
function saveData(){
	postDataByURL('orgInner.do?actionMethod=edit',$('#interiorLoan').serialize(),'workspace');
}
function deleteData(interiorLoanId){
	if(confirm("确定删除？")){
		postDataByURL('orgInner.do?actionMethod=delete&id='+interiorLoanId,$('#interiorLoan').serialize(),'workspace');
	}
}
function payInterestDetail(interiorId,endIntMode){
	$.dialog( {
		id: interiorId + endIntMode,
		title : '付息明细列表',
		content: 'url:orgInner.do?actionMethod=payInterestDetail&interiorId=' + interiorId + '&endIntMode=' + endIntMode,
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
	document.getElementById('isDelay').value='0';

	document.getElementById('delayStartDate').value='';
	document.getElementById('delayEndDate').value='';
	document.getElementById('remarks').value='';

}

function changeDiv(type){
	if (type == "1"){
 	 	$(".hetong").show();
	}else if(type=="0"){
		$(".hetong").hide();
	}
}
</script>