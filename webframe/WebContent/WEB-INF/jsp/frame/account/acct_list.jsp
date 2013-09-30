<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_user_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="fwAccount" name="fwAccount">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
		<table class="formInfo">
			<tbody>
			<tr>
				<td class="formElem labelName"><label><spring:message code="userForm.acctName.displayName"/>：</label></td>
				<td class="formElem"><input type="text" value="${t_acctName}" name="ht_t.acctName" id="ht_t_acctName" class="inText"/></td>
				<td class="formElem labelName"><label><spring:message code="userForm.status.displayName"/>：</label></td>
				<td class="formElem">
					<huatek:dicSelect name="ht_t.status" id="ht_t_status" category="status" value="${t_status}"/>
				</td>
				<td class="formElem labelName"><label><spring:message code="userForm.fwGroup.displayName"/>：</label></td>
				<td class="formElem">
					<input type="text" value="${t_fwGroup_name}" name="ht_t.fwGroup.name" id="ht_t_fwGroup_name" class="inText"/>
				</td>
		    </tr>
		    </tbody>
		</table>
	</div>
	<div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td><input type="button" value="查询" class="buttonCls" onclick="trimForm('fwAccount');postDataByFormName('fwAccount','workspace')"/></td>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_acctName','ht_t_fwGroup_name','ht_t_status']);"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
		<li><input type="button"  value="新增" class="buttonCls"  onclick="getData('user.do?actionMethod=add','','workspace');" <huatek:displayMethod methodName="add"/>/></li>
		<li><input type="button" value="删除" class="buttonCls" onclick="deleteData('user.do?actionMethod=delete','fwAccount');" <huatek:displayMethod methodName="delete"/>/></li>
		<li><input type="button" value="分配功能权限" class="buttonCls" onclick="assignData('user.do?actionMethod=assign');" <huatek:displayMethod methodName="assign"/>/></li>
		<li><input type="button" value="分配数据权限" class="buttonCls" onclick="assignData('userDataRole.do?actionMethod=assign');" <huatek:displayMethod methodName="assign" moduleUrl="userDataRole.do?actionMethod=assign"/>/></li>
	</ul>
	<div class="clear"></div>
</div>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">用户信息</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="fwAccount" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
	<div class="grid">
		<table  id="tb_sys_user_table_list">
		    <thead>
			<tr>
				<th>
					<input name="checkbox5" type="checkbox" id="checkbox5" onclick="checkAll(this)"/>
				</th>
				<th><spring:message code="userForm.acctName.displayName"/></th>
		        <th><spring:message code="userForm.userName.displayName"/></th>
		        <th><spring:message code="userForm.fwGroup.displayName"/></th>
		        <th><spring:message code="userForm.status.displayName"/></th>
		        <th><spring:message code="userForm.position.displayName"/></th>
		        <th><spring:message code="link.modify"/></th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="user" items="${pageBean.dataList}" varStatus="s">
			<tr class="gradeX">
				<td><input type="checkbox" value="${user.id}" name="id" ></td>
				<td><c:out value="${user.acctName}"></c:out></td>
				<td><c:out value="${user.userName}"/></td>
				<td><c:out value="${user.fwGroup.name}"/></td>
				<td><huatek:dicOut category="status" value="${user.status}"/></td>
				<td><huatek:dicOut category="position" value="${user.position}"/></td>
				<td><a href="#" onclick="getData('user.do?actionMethod=edit&queryId=${user.id}','','workspace');">修改</a>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="fwAccount" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
        <div class="clear"></div>
	</div>
</div>
</form:form>