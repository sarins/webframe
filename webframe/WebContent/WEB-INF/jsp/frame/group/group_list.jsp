<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_group_table_list"></c:set>
<%@include file="/init_script.jsp" %>
<form:form modelAttribute="fwGroup" name="fwGroup">
<form:errors path="*" cssClass="errors"></form:errors>
<fieldset>
	<legend>查询条件</legend>
	<div class="condition_left">
		<table class="formInfo">
			<tbody>
				<tr>
				 <td class="formElem labelName">
					<label><spring:message code="groupForm.name.displayName"/></label>
				</td>
				<td class="formElem">
				<input type="text" value="${t_name }" name="ht_t.name" id="ht_t_name" class="inText">
				</td>
				<td class="formElem labelName">
					<label><spring:message code="groupForm.parent.displayName"/>:</label>
				</td>
				<td class="formElem">
				<input type="text" value="${t_parent_name }" name="ht_t.parent.name" id="ht_t_parent_name" class="inText">
				</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="btn_right">
		<table class="conditionBtn">
			<tbody>
			    <tr>
			        <td height="25"><input type="button" value="查询" class="buttonCls" onclick="trimForm('fwGroup');postDataByFormName('fwGroup','workspace')"/></td>
			        <td height="25"><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_name','ht_t_parent_name']);"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
		<li>
	 		<input type="button"  value="新增" class="buttonCls" onclick="getData('groupController.do?actionMethod=add','','workspace');"/>
	 	</li>
	 	<li>
		 <input type="button" value="删除" class="buttonCls" onclick="deleteData('groupController.do?actionMethod=delete','fwGroup');"/>
	 	</li>
	</ul>
	<div class="clear"></div>
</div>
<div class="gridInfo">
		<div class="gridToolbar">
			<div class="gridHeaderName">部门信息</div>
			<div class="gridPageBtn">
				<huatek:ajaxCutPage pageBean="${pageBean}" formName="fwGroup" offerPageSize="20,50,100" isExistForm="true"/>
			</div>
			<div class="clear"></div>
		</div>
		<div class="grid">
			<table id="tb_sys_group_table_list">
			<thead>
				<tr>
					<th  width="8%"><input type="checkbox" name="id_selector" value="1" onclick="checkAll(this)"></th>
				    <th width="30%" >
				    <spring:message code="groupForm.name.displayName"/> </th>
				    <th>
				    <spring:message code="groupForm.parent.displayName"/>
				    </th>
				    <th>
				    <spring:message code="groupForm.status.displayName"/>
				    </th>
				     <th>
				    <spring:message code="groupForm.describe.displayName"/>
				    </th>
				    <th> <spring:message code="link.modify"/> </th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="group" items="${pageBean.dataList}">
			  	<tr class="gradeX">
			  		<td>
			  		<input type="checkbox" value="${group.id}" name="id" >
			  		</td>
				    <td>
				    	<c:out value="${group.name}"/>
				    </td>
				    <td>
				    	<c:out value="${group.parent.name}"/>
				   </td>
				   <td>
				    	<huatek:dicOut category="status" value="${group.status}"/>
				   </td>
				   <td>
				    	<div title="${group.describe}">
							<huatek:out value="${group.describe}" size="20" encode="true"/>
						</div>
				   </td>
				    <td><a href="#" onclick="getData('groupController.do?actionMethod=edit&queryId=${group.id}','','workspace');">修改</a>
			  	</tr>
			  </c:forEach>
			  </tbody>
			</table>
	</div>
	<div class="gridToolbar">
	    <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="fwGroup" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
	    <div class="clear"></div>
	</div>
</div>
</form:form>