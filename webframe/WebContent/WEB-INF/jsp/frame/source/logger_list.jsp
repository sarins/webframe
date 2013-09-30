<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_log_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="fwActionLog" name="fwActionLog">
<fieldset>
	<legend>查询条件</legend>
	<div class="condition_left">
		<table class="formInfo">
			<tbody>
			<tr>
				<td class="formElem labelName"><label><spring:message code="userForm.acctName.displayName"/>：</label></td>
				<td class="formElem"><input type="text" value="${t_fwAccount_acctName }" id="ht_t_fwAccount_acctName" name="ht_t.fwAccount.acctName"></td>
				<td class="formElem labelName"><label><spring:message code="sourceForm.sourceName.displayName"/>：</label></td>
				<td class="formElem"><input type="text" value="${t_fwSrcAction_fwSource_name }" name="ht_t.fwSrcAction.fwSource.name" id="ht_t_fwSrcAction_fwSource_name"></td>
			 </tr>
			 </tbody>
		</table>
	</div>
	<div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td><input type="button" value="查询" class="buttonCls" onclick="trimForm('fwActionLog');postDataByFormName('fwActionLog','workspace')"/></td>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_fwAccount_acctName','ht_t_fwSrcAction_fwSource_name']);"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">实际操作日志信息</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="fwActionLog" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
<div class="grid">
	<table id="tb_sys_log_table_list">
		<thead>
		<tr>
			<th><spring:message code="userForm.acctName.displayName"/></th>
			<th><spring:message code="sourceForm.sourceName.displayName"/> </th>
		    <th><spring:message code="actionForm.actionName.displayName"/> </th>
		    <th><spring:message code="logger.remote.host"/></th>
		    <th><spring:message code="logger.operation.time"/></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="operationLog" items="${pageBean.dataList}">
	  	<tr class="gradeX">
		   <td><c:out value="${operationLog.fwAccount.acctName}"/></td>
		   <td><c:out value="${operationLog.fwSrcAction.fwSource.name}"/></td>
		   <td><c:out value="${operationLog.fwSrcAction.methodName}"/>&nbsp;</td>
		   <td><c:out value="${operationLog.clientIp}"/>&nbsp;</td>
		   <td><c:out value="${operationLog.actionTime}"/>&nbsp;</td>
	  	</tr>
	  	</c:forEach>
	  	</tbody>
	</table>
</div>
	<div class="gridToolbar">
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true"  formName="fwActionLog" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
</div>
</form:form>
