<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_source_action_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="fwSrcAction" name="ec">
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">添加菜单操作</span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label>当前菜单:</label></td>
                	<td  class="formElem lessTen"><c:out value="${fwSource.name}"/> </td>
                 </tr>
             </tbody>
        </table>
    </div>
    <div class="operationTool">
		<ul>
			<li><input type="button"  value="新增" class="buttonCls"  onclick="getData('operation.do?actionMethod=add','sourceId='+${fwSource.id},'workspace');" <huatek:displayMethod methodName="add"/> /></li>
			<li><input type="button" value="删除" class="buttonCls" onclick="deleteData('operation.do?actionMethod=delete&sourceId=${fwSource.id}','fwSrcAction');" <huatek:displayMethod methodName="delete"/>/></li>
			<li><input type="button" value="返回" class="buttonCls" onclick="getData('source.do?actionMethod=query','menuId=503','workspace');"></li>
		</ul>
	<div class="clear"></div>
	</div>
    <div class="gridInfo">
		<div class="gridToolbar">
			<div class="gridHeaderName">操作信息</div>
		</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="fwSrcAction" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
		</div>
		<div class="grid">
		<table id="tb_sys_source_action_list">
			<thead>
				<tr>
					<th><input type="checkbox" name="id" onclick="checkAll(this)"></th>
			    	<th>操作名称</th>
					<th>方法名称</th>
				    <th><spring:message code="actionForm.actionPath.displayName"/></th>
				     <th><spring:message code="actionForm.logLevel.displayName"/></th>
				     <th><spring:message code="actionForm.actionOrder.displayName"/></th>
				    <th>修改</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="operation" items="${pageBean.dataList}">
	  		<tr>
		  		<td><input type="checkbox" value="${operation.id}" name="id" ></td>
			    <td><c:out value="${operation.name}"/></td>
			    <td><c:out value="${operation.methodName}"/></td>
			   <td><c:out value="${operation.actionMethods}"/></td>
			   <td><c:out value="${operation.logLevel}"/></td>
			    <td><c:out value="${operation.actionOrder}"/></td>
			   <td><a href="#" onclick="getData('operation.do?actionMethod=edit&sourceId=${fwSource.id}&queryId=${operation.id}','','workspace');">修改</a></td>
  			</tr>
  		</c:forEach>
  		</tbody>
	</table>
	<div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="fwSrcAction" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
        <div class="clear"></div>
	</div>
	</div>
</div>
</form:form>