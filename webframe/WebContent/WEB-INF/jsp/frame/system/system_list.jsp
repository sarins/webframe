<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_system_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="fwSystem" name="ec">

<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
		<table class="formInfo">
			<tbody>
			<tr>
				<td class="formElem labelName">系统名称：</td>
				<td class="formElem"><input type="text" value="${t_name}" name="ht_t.name" id="ht_t_name"  class="inText"/></td>
			</tr>
			</tbody>
		</table>
	</div>
	<div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td><input type="button" value="查询" class="buttonCls" onclick="trimForm('fwSystem');postDataByFormName('fwSystem','workspace')"/></td>
		        </tr>
   				<tr>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_name']);"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
		<li><input type="button" value="新增" class="buttonCls"  <huatek:displayMethod methodName="add"/> onclick="getData('system.do?actionMethod=add','','workspace');"/></li>
    	<li><input type="button" value="删除" class="buttonCls"  <huatek:displayMethod methodName="delete"/> onclick="deleteData('system.do?actionMethod=delete','fwSystem');"/></li>
	</ul>
	<div class="clear"></div>
</div>

<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">系统信息</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="fwSystem" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
	<div class="grid">
	<table id="tb_sys_system_table_list">
	 <thead>
		<tr>
			<th><input type="checkbox" id="checkbox5" name="checkbox5"  onclick="checkAll(this)">
			</th>
	        <th>系统名称</th>
	        <th>系统状态</th>
	        <th>系统描述</th>
	 		<th>系统IP</th>
	 		<TH>系统编码</TH>
	 		<th>系统端口号</th>
	 		<th>部署目录</th>
	        <th>修改</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="fwSystem" items="${pageBean.dataList}" varStatus="s">
		<tr <c:if test="${!(s.index%2==0) }"> class="tdbgcolor"</c:if>>
			<td align="center">
				<input type="checkbox" value="${fwSystem.id}" name="id" >
			</td>
			<td><c:out value="${fwSystem.name}"/></td>
			<td>
				<c:if test="${fwSystem.status eq 'A'}">生效</c:if>
				<c:if test="${fwSystem.status eq 'D'}">生效</c:if>
			</td>
			<td><c:out value="${fwSystem.describe}"/></td>
			<td><c:out value="${fwSystem.sysIp}"/></td>
			<td><c:out value="${fwSystem.sysCode}"/></td>
			<td><c:out value="${fwSystem.sysPort}"/></td>
			<td><c:out value="${fwSystem.contextPath}"/></td>
			<td><a href="#"  onclick="getData('system.do?actionMethod=edit&queryId=${fwSystem.id}','','workspace');">修改</a>
			</td>
		</tr>
		</c:forEach>
		 </tbody>
	</table>
</div>
<div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="fwSystem" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
        <div class="clear"></div>
	</div>
</div>
</form:form>

