<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form:form modelAttribute="financingDetail" name="financingDetail" target="_blank" action="financing.do?actionMethod=export" onsubmit="return false">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
        <table class="formInfo">
        	<tbody>
                <tr>
                	<td class="formElem labelName"><label>机构种类：</label></td>
                    <td class="formElem">
                    	<select name="ht_t.mecCategory" id="ht_t.mecCategory">
						<option value="">---请选择---</option>
						<option value="1" <c:if test="${t_mecCategory eq '1'}">selected </c:if>>银行</option>
						<option value="2" <c:if test="${t_mecCategory eq '2'}">selected </c:if>>信托</option>
						<option value="3" <c:if test="${t_mecCategory eq '3'}">selected </c:if>>券商</option>
						</select>
                    </td>
                    <td class="formElem labelName"><label>起始日：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker();" name="startDate" id="ht_t.startDate" value="${t_startDate}"  readonly="readonly" />
                    </td>
                    <td class="formElem labelName"><label>截止日：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker();" name="endDate" id="ht_t.endDate" value="${t_endDate}"  readonly="readonly" />
                    </td>
                </tr>
				<tr>
					 <td class="formElem labelName"><label>是否提前还款：</label></td>
                     <td class="formElem">
                    	<select name="ht_t.isAdvanceReply" id="ht_t.isAdvanceReply">
                    		<option value="">---请选择---</option>
							<option value="1" <c:if test="${t_isAdvanceReply eq '1'}">selected </c:if>>是</option>
							<option value="2" <c:if test="${t_isAdvanceReply eq '2'}">selected </c:if>>否</option>
						</select>
                    </td>
                	 <td class="formElem labelName"><label>机构：</label></td>
                    <td class="formElem">
                    	<input type="text" class="inText" name="ht_t.mecName" id="ht_t.mecName" value="${t_mecName}"/>
                    </td>
                    <td class="formElem labelName"><label>信息类别：</label></td>
                    <td class="formElem">
						<select onchange="changeDiv(this.value);" name="ht_t.infoCategory" id="ht_t.infoCategory">
							<option value="">---请选择---</option>
							<option value="1" <c:if test="${t_infoCategory eq '1'}">selected </c:if>>融资</option>
							<option value="2" <c:if test="${t_infoCategory  eq '2'}">selected </c:if>>授信</option>
						</select>
					</td>
                </tr>
                <tr style="display:none" class="hetong">
					 <td class="formElem labelName hetong"><label>合同编码：</label></td>
                     <td class="formElem hetong">
                    	<input type="text" class="inText" name="ht_t.contactNumber" id="ht_t.contactNumber" value="${t_contactNumber}"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td>
			        <input type="hidden" name="superQuery" value="true"/>
			        <input type="button" value="查询" class="buttonCls" onclick="trimForm('financingDetail');queryData();"/></td>
			    </tr>
			    <tr>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanText();"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
    	<li><a href="javascript:;" title="查询结果导出Excel">
				<img src="${ht_globalUrl}/images/excel.jpg" width="55px" height="23px" onclick="exportExcel();"/>
			</a>
		</li>
    </ul>
    <div class="clear"></div>
</div>
<div id="resultList">
</div>
<script language="javascript">
$("document").ready(function(){
	queryData();
});
function queryData(){
	postDataByURL('financing.do?actionMethod=query',$('#financingDetail').serialize(),'resultList');
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
/*
清空查询条件操作
	*/
function cleanText(){
	document.getElementById('ht_t.mecCategory').value='';
	document.getElementById('ht_t.startDate').value='';
	document.getElementById('ht_t.endDate').value='';
	document.getElementById('ht_t.isAdvanceReply').value='';
	document.getElementById('ht_t.mecName').value='';
	document.getElementById('ht_t.infoCategory').value='';
	document.getElementById('ht_t.contactNumber').value='';
}

function payInterestDetail(financeId,endIntMode){
	$.dialog( {
		id: financeId + endIntMode,
		title : '付息明细列表',
		content: 'url:financing.do?actionMethod=payInterestDetail&financeId=' + financeId + '&endIntMode=' + endIntMode,
		width : 800,
		height : 520,
		lock : true
	});
}
function exportExcel(){
	document.financingDetail.submit();
}

function changeDiv(type){
	if (type == "1"){
 	 	$(".hetong").show();
	}else if(type=="2"){
		$(".hetong").hide();
	}else if(type==""){
		$(".hetong").hide();
	}
}
</script>
</form:form>