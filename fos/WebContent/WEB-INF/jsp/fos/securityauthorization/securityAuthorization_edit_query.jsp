<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_security_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="securityAuthorization" name="securityAuthorization" onsubmit="return false">
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">担保管理</span>
    	<span class="toggle"><a href="javascript:;">&nbsp;</a></span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>事项分类：</label></td>
                    <td class="formElem">
	                   		<select name="categoryType" id="categoryType">
								<option value="">---请选择---</option>
								<option value="1" <c:if test="${securityAuthorization.categoryType eq '1'}">selected </c:if>>政府担保</option>
								<option value="2" <c:if test="${securityAuthorization.categoryType eq '2'}">selected </c:if>>商业担保</option>
								<option value="3" <c:if test="${securityAuthorization.categoryType eq '3'}">selected </c:if>>其他</option>
							</select>
					</td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>事项状态:</label></td>
                    <td class="formElem">
                    		<select name="eventStatus" id="eventStatus">
								<option value="">---请选择---</option>
								<option value="1" <c:if test="${securityAuthorization.eventStatus eq '1'}">selected </c:if>>已到期偿还</option>
								<option value="2" <c:if test="${securityAuthorization.eventStatus eq '2'}">selected </c:if>>正常</option>
							</select>
                    </td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>事项名称:</label></td>
                    <td class="formElem">
                    <input type="text" name="eventName" id="eventName" class="inText" value="${securityAuthorization.eventName}"/>
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>合同金额:</label></td>
                    <td class="formElem">
                    	<table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" name="contractMoney" id="contractMoney" class="inText" value="${securityAuthorization.contractMoney}"/></td>
                    			<td>万元</td>
                    		</tr>
                    	</table>
					</td>
                    <td class="formElem labelName"><label>担保金额：</label></td>
                    <td class="formElem">
                    <table class="txtinfo">
                    		<tr>
                    			<td class="firstTd"><input type="text" name="securityMoney" id="securityMoney" class="inText" value="${securityAuthorization.securityMoney}"/></td>
                    			<td>万元</td>
                    		</tr>
                    	</table>
					</td>
					<td class="formElem labelName"><label><span class="redmark">*</span>提取类别:</label></td>
                    <td class="formElem">
                    		<select name="drawType" id="drawType">
								<option value="">---请选择---</option>
								<option value="1" <c:if test="${securityAuthorization.drawType eq '1'}">selected </c:if>>已提</option>
								<option value="2" <c:if test="${securityAuthorization.drawType eq '2'}">selected </c:if>>未提</option>
							</select>
                    </td>
                </tr>
                <tr>
                   <td class="formElem labelName"><label><span class="redmark">*</span>起始日：</label></td>
                   <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="eventInitialDate" id="eventInitialDate" value="<fmt:formatDate value="${securityAuthorization.eventInitialDate}" pattern="yyyy-MM-dd" />"  readonly="readonly" />
                   </td>
                   <td class="formElem labelName"><label><span class="redmark">*</span>截止日：</label></td>
                   <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="eventEndDate" id="eventEndDate" value="<fmt:formatDate value="${securityAuthorization.eventEndDate}" pattern="yyyy-MM-dd" />"  readonly="readonly" />
                   </td>
                   <td class="formElem labelName"><label></label></td>
                   <td class="formElem">
				   </td>
                </tr>
                 <tr>
                	<td class="formElem labelName"><label>审批情况:</label></td>
                    <td class="formElem moreTen" colspan="5">
                    	<textarea name="approveCondition" id="approveCondition"><c:out value="${securityAuthorization.approveCondition}"></c:out></textarea>
                    </td>
                </tr>
                 <tr>
                	<td class="formElem labelName"><label>事项概述:</label></td>
                    <td class="formElem moreTen" colspan="5">
                    	<textarea name="eventSummary" id="eventSummary"><c:out value="${securityAuthorization.eventSummary}"></c:out></textarea>
                    </td>
                </tr>
                 <tr>
                	<td class="formElem labelName"><label>备注：</label></td>
                    <td class="formElem moreTen" colspan="5">
                    	<textarea name="remarks" id="remarks"><c:out value="${securityAuthorization.remarks}"></c:out></textarea>
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
	postDataByURL('securityAuthorization.do?actionMethod=editQuery',$('#securityAuthorization').serialize(),'resultList');
}
function saveData(){
	trimForm('securityAuthorization');
	postDataByURL('securityAuthorization.do?actionMethod=edit',$('#securityAuthorization').serialize(),'workspace');
}
function deleteData(securityAuthoriesId){
	if(confirm("确定要删除吗?")){
		postDataByURL('securityAuthorization.do?actionMethod=delete&id='+securityAuthoriesId,$('#securityAuthorization').serialize(),'workspace');
		}
}
	/*
	清空查询条件操作
		*/
	function cleanText(){
		document.getElementById('categoryType').value='';
		document.getElementById('eventStatus').value='';
		document.getElementById('eventName').value='';
		document.getElementById('contractMoney').value='';
		document.getElementById('securityMoney').value='';
		document.getElementById('drawType').value='';
		document.getElementById('eventInitialDate').value='';
		document.getElementById('eventEndDate').value='';
		document.getElementById('approveCondition').value='';
		document.getElementById('eventSummary').value='';
		document.getElementById('remarks').value='';
	}
</script>