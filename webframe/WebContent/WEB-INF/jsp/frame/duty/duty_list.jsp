<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_role_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="fwDuty" name="ec">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
		<table class="formInfo">
			<tbody>
			<tr>
				<td class="formElem labelName"><label><spring:message code="dutyForm.name.displayName"/>：</label></td>
				<td class="formElem"><input type="text" value="${t_name }" id="ht_t_name" name="ht_t.name" class="inText"/></td>
				<td class="formElem labelName"><label><spring:message code="dutyForm.status.displayName"/>：</label></td>
				<td class="formElem">
				<huatek:dicSelect name="ht_t.status" id="ht_t_status" category="status" value="${t_status}"/>
				</td>
		    </tr>
		    </tbody>
		</table>
	</div>
	<div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td><input type="button" value="查询" class="buttonCls" onclick="trimForm('fwDuty');postDataByFormName('fwDuty','workspace')"/></td>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_name','ht_t_status']);"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
		<li><input type="button"  value="新增" class="buttonCls addBtn"   <huatek:displayMethod methodName="add"/> onclick="getData('role.do?actionMethod=add','','workspace');" <huatek:displayMethod methodName="add"/>/></li>
		<li><input type="button" value="删除" class="buttonCls addBtn" onclick="deleteData('role.do?actionMethod=delete','fwDuty');" <huatek:displayMethod methodName="delete"/>/></li>
		<li><input type="button" value="分配功能权限" class="buttonCls addBtn" onclick="assignData('role.do?actionMethod=assignFunction');" <huatek:displayMethod methodName="assignFunction"/>/></li>
	</ul>
	<div class="clear"></div>
</div>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">功能角色信息</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="fwDuty" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
	<div class="grid">
		<table id="tb_sys_role_table_list">
			<thead>
			<tr>
				<th><input type="checkbox" name="checkbox5" id="checkbox5"  onclick="checkAll(this)"></th>
    			<th ><spring:message code="dutyForm.name.displayName"/></th>
    			<th><spring:message code="dutyForm.status.displayName"/></th>
     			<th><spring:message code="dutyForm.describe.displayName"/></th>
    			<th><spring:message code="link.modify"/></th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="duty" items="${pageBean.dataList}">
			  <tr class="gradeX">
		  		<td><input type="checkbox" value="${duty.id}" name="id"></td>
			    <td><c:out value="${duty.name}"/></td>
			   <td><huatek:dicOut category="status" value="${duty.status}"/></td>
			   <td>
			    	<div title="${duty.describe}">
						<huatek:out value="${duty.describe}" size="20" encode="true"/>
					</div>
			   </td>
			   <td><a href="#" onclick="getData('role.do?actionMethod=edit&queryId=${duty.id}','','workspace');">修改</a>
			  </tr>
			</c:forEach>
  			</tbody>
		</table>
</div>
<div class="gridToolbar">
    <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="fwDuty" offerPageSize="20,50,100" isExistForm="true"/>
	</div>
    <div class="clear"></div>
</div>
</div>
</form:form>