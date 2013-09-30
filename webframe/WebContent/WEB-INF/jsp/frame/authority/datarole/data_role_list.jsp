<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek"  uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_data_authority_list"></c:set>
<%@ include file="/init_script.jsp" %>
<script language="javascript">
	function updateStatus(status){
		if(jqchk()){
			if(confirm('确定要修改吗？'))
			postDataByURL('efwDataRole.do?actionMethod=condition',$('#efwDataRole').serialize()+'&statuss='+status,'workspace','修改成功');
			}
	}
	function viewDataAuthority(){
		if(jqchk()){
			postDataByURL('efwDataRole.do?actionMethod=viewDataRole',$('#efwDataRole').serialize(),'workspace');
		}

	}
</script>
<form:form modelAttribute="efwDataRole" name="ec">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
		<table class="formInfo">
			<tbody>
			<tr>
				<td class="formElem labelName">数据角色名称：</td>
				<td class="formElem"><input type="text" value="${t_daName}" name="ht_t.daName" id="ht_t_daName" class="inText"/></td>
	        	<td class="formElem labelName">状态：</td>
	        	<td class="formElem">
					<huatek:dicSelect name="ht_t.status" category="status" value="${t_status}" id="ht_t_status"/>
				</td>
				<td class="formElem labelName"></td>
				<td class="formElem"></td>
    		</tr>
    		</tbody>
		</table>
	</div>
	<div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td><input type="button" value="查询" class="buttonCls" onclick="trimForm('efwDataRole');postDataByFormName('efwDataRole','workspace')"/></td>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_daName','ht_t_status','dataName']);"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
		<li><input type="button"  value="新增" class="buttonCls" <huatek:displayMethod methodName="add"/>  onclick="getData('efwDataRole.do?actionMethod=add','','workspace');"/></li>
		<li><input type="button" value="生效" class="buttonCls" <huatek:displayMethod methodName="condition"/> onclick="updateStatus('A')"/></li>
    	<li><input type="button" value="失效" class="buttonCls" <huatek:displayMethod methodName="condition"/> onclick="updateStatus('D')"/></li>
    	<li><input type="button" value="删除" class="buttonCls" <huatek:displayMethod methodName="delete"/> onclick="deleteData('efwDataRole.do?actionMethod=delete','efwDataRole');"/></li>
    	<li><input type="button" value="分配权限" class="buttonCls" <huatek:displayMethod methodName="assign"/> onclick="assignData('efwDataRole.do?actionMethod=assign');"/></li>
    	<!--
    	<li><input type="button" value="查看已分配的数据权限" class="buttonCls"  onclick="viewDataAuthority();"/>
    	//-->
	</ul>
	<div class="clear"></div>
</div>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">数据角色信息</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="efwDataRole" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
	<div class="grid">
	<table id="tb_sys_data_authority_list">
	    <thead>
			<tr>
			<th><input type="checkbox" class="formheader"  name="checkbox5" id="checkbox5" onclick="checkAll(this)"/></th>
			<th><spring:message code="efwUserDataRoleForm.daName.displayName"/></th>
			<th><spring:message code="efwUserDataRoleForm.status.displayName"/></th>
	        <th><spring:message code="efwUserDataRoleForm.description.displayName"/></th>
	        <th><spring:message code="link.modify"/></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="authority" items="${pageBean.dataList}" varStatus="s">
			<tr>
			<td><input type="checkbox" value="${authority.id}" name="id" ></td>
			<td><c:out value="${authority.daName}"/></td>
			<td><huatek:dicOut category="status" value="${authority.status}"/>
			</td>
			<td>
				<div title="${authority.description}">
					<huatek:out value="${authority.description}" size="22" encode="true"/>
				</div>
			</td>
			<td><a href="#" onclick="getData('efwDataRole.do?actionMethod=edit&queryId=${authority.id}','','workspace');">修改</a>
			</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="efwDataRole" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
        <div class="clear"></div>
	</div>
</div>
</form:form>
