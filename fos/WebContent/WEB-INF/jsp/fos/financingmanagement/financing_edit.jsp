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
<form:form modelAttribute="financingDetail" name="financingDetail" onsubmit="return false">
<div class="widget">
	<div class="widgetTitle">
    	<span class="widgetTitleIco">融资/授信</span>
    	<span class="toggle"><a href="javascript:;">&nbsp;</a></span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
                <tr>
					<td class="formElem labelName"><label><span class="redmark">*</span>信息类别：</label></td>
                    <td class="formElem">
						<select onchange="changeDiv(this.value);" name="infoCategory" id="infoCategory">
							<option value="1" <c:if test="${financingDetail.infoCategory eq '1'}">selected </c:if>>融资</option>
							<option value="2" <c:if test="${financingDetail.infoCategory  eq '2'}">selected </c:if>>授信</option>
						</select>
					</td>
                	<td class="formElem labelName"><label><span class="redmark">*</span>机构：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="mecName" id="mecName" value="<c:out value="${financingDetail.mecName}"/>"/></td>
					<td class="formElem labelName hetong"><label><span class="redmark">*</span>合同编码：</label></td>
                    <td class="formElem hetong">
                    	<input type="text" class="inText" name="contactNumber" id="contactNumber" value="<c:out value="${financingDetail.contactNumber}"/>"/>
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>机构种类：</label></td>
                    <td class="formElem">
                    	<select name="mecCategory" id="mecCategory">
						<option value="">---请选择---</option>
						<option value="1" <c:if test="${financingDetail.mecCategory  eq '1'}">selected </c:if>>银行</option>
						<option value="2" <c:if test="${financingDetail.mecCategory  eq '2'}">selected </c:if>>信托</option>
						<option value="3" <c:if test="${financingDetail.mecCategory  eq '3'}">selected </c:if>>券商</option>
						</select>
                    </td>
                    <td class="formElem labelName"><label>融资种类：</label></td>
                    <td class="formElem">
                   		 <input type="text" class="inText" name="financingCategory" id="financingCategory" value="<c:out value="${financingDetail.financingCategory}"/>">
                    </td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>金额：</label></td>
                    <td class="formElem">
                    	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inTextcc" name="financingMoney" id="financingMoney" value="<c:out value="${financingDetail.financingMoney}"/>"/></td>
                    			<td>万元</td>
                    		</tr>
                    	</table>
                    </td>
                </tr>
				<tr>
                    <td class="formElem labelName"><label><span class="redmark">*</span>起始日：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="startDate" id="startDate" value="<fmt:formatDate value="${financingDetail.startDate}" pattern="yyyy-MM-dd" />"  readonly="readonly" />
                    </td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>截止日：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="endDate" id="endDate" value="<fmt:formatDate value="${financingDetail.endDate}" pattern="yyyy-MM-dd" />"  readonly="readonly" />
                    </td>
                    <td class="formElem labelName"><label>期限：</label></td>
                    <td class="formElem">
                    	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inTextc"  name="timeLimit" id="timeLimit" value="<c:out value="${financingDetail.timeLimit}"/>"/></td>
                    			<td>月</td>
                    		</tr>
                    	</table>
                    </td>
                </tr>
				<tr>
                    <td class="formElem labelName"><label><span class="redmark">*</span>是否变更利率：</label></td>
                    <td class="formElem">
					<select name="isChangeRate" id="isChangeRate">
						<option value="0" <c:if test="${financingDetail.isChangeRate  eq '0'}">selected </c:if>>否</option>
						<option value="1" <c:if test="${financingDetail.isChangeRate  eq '1'}">selected </c:if>>是</option>
					</select>
                    </td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>利率：</label></td>
                    <td class="formElem">
                    	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" class="inTextc" name="interestRate" id="interestRate" value="<c:out value="${financingDetail.interestRate}"/>"/></td>
                    			<td>%</td>
                    		</tr>
                    	</table>
                    </td>
                    <td class="formElem labelName"><label>利率调整方式：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText" name="rateAdjustMode" id="rateAdjustMode" value="<c:out value="${financingDetail.rateAdjustMode}"/>"/>
                    </td>
                </tr>
				<tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>结息方式：</label></td>
                    <td class="formElem">
                    	<select name="endIntMode" id="endIntMode">
                    		<option value="">---请选择---</option>
							<option value="1" <c:if test="${financingDetail.endIntMode  eq '1'}">selected </c:if>>月结</option>
							<option value="2" <c:if test="${financingDetail.endIntMode  eq '2'}">selected </c:if>>季结</option>
							<option value="3" <c:if test="${financingDetail.endIntMode  eq '3'}">selected </c:if>>年结</option>
						</select>
                    </td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>结息日：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'dd'});" name="endIntDate" id="endIntDate" value="<c:out value="${financingDetail.endIntDate}"/>"/>
                    </td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>是否提前还款：</label></td>
                    <td class="formElem">
                    	<select name="isAdvanceReply" id="isAdvanceReply">
							<option value="2" <c:if test="${financingDetail.isAdvanceReply  eq '2'}">selected </c:if>>否</option>
							<option value="1" <c:if test="${financingDetail.isAdvanceReply  eq '1'}">selected </c:if>>是</option>
						</select>
                    </td>
                </tr>
				<tr>
                	<td class="formElem labelName"><label>提前还款日期：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="earlyReplyDate" id="earlyReplyDate" value="<fmt:formatDate value="${financingDetail.earlyReplyDate}" pattern="yyyy-MM-dd"/>"  readonly="readonly" />
                    </td>
                    <td class="formElem labelName"><label>担保/抵押方式：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText" name="mortMode" id="mortMode" value="<c:out value="${financingDetail.mortMode}"/>"/>
                    </td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>还款周期：</label></td>
                    <td class="formElem">
                    	<select name="replyPeriod" id="replyPeriod">
							<option value="360" <c:if test="${financingDetail.replyPeriod  eq '360'}">selected </c:if>>360</option>
							<option value="365" <c:if test="${financingDetail.replyPeriod  eq '365'}">selected </c:if>>365</option>
						</select>
                    </td>
				 </tr>
				<tr>
					<td class="formElem labelName"><label>用途：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText" name="use" id="use" value="<c:out value="${financingDetail.use}"/>"/>
                    </td>
					
                </tr>
                <tr>
                	<td class="formElem labelName"><label>备注：</label></td>
                    <td class="formElem moreTen" colspan="5">
                    	<textarea name="remark" id="remark"><c:out value="${financingDetail.remark}"></c:out></textarea>
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
	var infoCategory = '${financingDetail.infoCategory}';
	if(infoCategory == '2'){
		changeDiv(2);
	}	
	queryData();
});
function queryData(){
	postDataByURL('financing.do?actionMethod=editQuery',$('#financingDetail').serialize(),'resultList');
}
function saveData(){
	trimForm('financingDetail');
	postDataByURL('financing.do?actionMethod=edit',$('#financingDetail').serialize(),'workspace');
}
function deleteData(financingDetailId,oldId){
	if(financingDetailId != oldId){
		if(confirm("确定要删除与之关联的所有数据吗?")){
			postDataByURL('financing.do?actionMethod=delete&id='+financingDetailId,$('#financingDetail').serialize(),'workspace');
			}
		}else{
			if(confirm("确定删除?")){
				postDataByURL('financing.do?actionMethod=delete&id='+financingDetailId,$('#financingDetail').serialize(),'workspace');
				}
			}
}
/*
清空查询条件操作
	*/
function cleanText(){
	document.getElementById('infoCategory').value='1';
	document.getElementById('mecName').value='';
	document.getElementById('mecCategory').value='';
	document.getElementById('financingCategory').value='';
	document.getElementById('financingMoney').value='';
	document.getElementById('use').value='';
	document.getElementById('timeLimit').value='';
	document.getElementById('startDate').value='';
	document.getElementById('endDate').value='';
	document.getElementById('interestRate').value='';
	document.getElementById('rateAdjustMode').value='';
	document.getElementById('endIntMode').value='';
	document.getElementById('isAdvanceReply').value='2';
	document.getElementById('earlyReplyDate').value='';
	document.getElementById('mortMode').value='';
	document.getElementById('replyPeriod').value='360';
	document.getElementById('contactNumber').value='';
	document.getElementById('isChangeRate').value='0';
	document.getElementById('remark').value='';
}

function changeDiv(type){
	if (type == "1"){
 	 	$(".hetong").show();
	}else if(type=="2"){
		$(".hetong").hide();
	}
}

function viewHistory(financeId){
	$.dialog( {
		id: financeId,
		title : '查看历史详细信息',
		content : 'url:financing.do?actionMethod=viewHistory&financeId=' + financeId,
		width : 800,
		height : 520,
		lock : true
	});
}

function payInterestDetail(financeId,endIntMode){
	$.dialog( {
		id: financeId,
		title : '付息明细列表',
		content: 'url:financing.do?actionMethod=payInterestDetail&financeId=' + financeId + '&endIntMode=' + endIntMode,
		width : 800,
		height : 520,
		lock : true
	});
}
</script>