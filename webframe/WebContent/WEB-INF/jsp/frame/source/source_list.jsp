<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek"  uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_source_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="fwSource" name="fwSource">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
		<table class="formInfo">
			<tbody>
			<tr>
				<td class="formElem labelName">菜单名称：</td>
				<td class="formElem"><input type="text" value="${t_name}" name="ht_t.name" id="ht_t_name"  class="inText"/></td>
				<td class="formElem labelName">上级菜单：</td>
				<td class="formElem"><input type="text" value="${t_parent_name}" name="ht_t.parent.name" id="ht_t_parent_name"  class="inText"/></td>
				<td class="formElem labelName">状态：</td>
		        <td class="formElem">
					<huatek:dicSelect name="ht_t.status" category="status" value="${t_status}" id="ht_t_status"/>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	<div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td><input type="button" value="查询" class="buttonCls" onclick="trimForm('fwSource');postDataByFormName('fwSource','workspace')"/></td>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_name','ht_t_parent_name','ht_t_status']);"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
		<li><input type="button" value="新增" class="buttonCls"  <huatek:displayMethod methodName="add"/> onclick="getData('source.do?actionMethod=add','','workspace');"/></li>
    	<li><input type="button" value="删除" class="buttonCls"  <huatek:displayMethod methodName="delete"/> onclick="deleteData('source.do?actionMethod=delete','fwSource');"/></li>
    	<li><input type="button" value="菜单操作" class="buttonCls" <huatek:displayMethod methodName="assign"/>  onclick="assignData('source.do?actionMethod=assign');"/></li>
	</ul>
	<div class="clear"></div>
</div>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">菜单信息</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="fwSource" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
	<div class="grid">
	<table id="tb_sys_source_table_list">
    	<thead>
			<tr>
				<th><input name="checkbox5" type="checkbox" id="checkbox5" onclick="checkAll(this)"/></th>
				<th>菜单名称</th>
		        <th>上级菜单</th>
		        <th>状态</th>
		        <th>描述</th>
		       	<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="source" items="${pageBean.dataList}" varStatus="s">
			<tr class="gradeX">
				<td>
					<input type="checkbox" value="${source.id}" name="id" >
				</td>
				<td><c:out value="${source.name}"/></td>
				<td><c:out value="${source.parent.name}"/></td>
				<td>
					<huatek:dicOut category="status" value="${source.status}"/>
				</td>
				<td><div title="${source.description}"><huatek:out value="${source.description}" size="20" encode="true"/></div></td>
				<td><a href="#" <huatek:displayMethod methodName="edit"/> onclick="getData('source.do?actionMethod=edit&queryId=${source.id}','','workspace');">修改</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="fwSource" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
        <div class="clear"></div>
	</div>
</div>
</form:form>
<script language="javascript">
	function updateStatus(status){
		if(jqchk()){
			if(confirm('确定要修改吗？'))
			postDataByURL('source.do?actionMethod=condition&id=${chk_value}',$('#fwSource').serialize()+'&statuss='+status,'workspace');
			}
	}
</script>

