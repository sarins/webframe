<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="fwSrcAction" onsubmit="return false">
<form:hidden path="id"/>
<div class="widget">
	<div class="widgetTitle">
    	<span class="widgetTitleIco">新增资源信息</span>
    </div>
<div class="widgetContainer">

<table class="formInfo">
	<tbody>
		<tr>
			<td class="formElem labelName"><lable>操作名称：</lable></td>
			<td class="formElem lessTen"><form:input path="name" size="30" maxlength="30" /><form:errors path="name" cssClass="errors"/></td>
		</tr>
		<tr>
			<td class="formElem labelName"><lable>方法名称：</lable></td>
			<td class="formElem lessTen"><form:input path="methodName" size="30" maxlength="30" /><form:errors path="methodName" cssClass="errors"/></td>
		</tr>
		<tr>
			<td class="formElem labelName" ><lable>访问URL：</lable></td>
			<td class="formElem lessTen"><form:input path="actionPath" /></td>
		</tr>
		<tr>
			<td class="formElem labelName"><lable>可操作方法：</lable></td>
			<td class="formElem lessTen"><form:input path="actionMethods" /><form:errors path="actionMethods" cssClass="errors"/></td>
		</tr>
		<tr>
			<td class="formElem labelName"><lable>日志级别：</lable>
			</td>
			<td class="formElem lessTen"> <form:select path="logLevel">
				<form:option value="0">不记录日志</form:option>
				<form:option value="1">记录日志</form:option>
				<form:option value="2">记录业务内容</form:option>
			</form:select><form:errors path="logLevel" cssClass="errors"/></td>
		</tr>
		<tr>
			<td class="formElem labelName"><lable>排序位置：</lable></td>
			<td class="formElem lessTen"><form:input path="actionOrder" size="30" maxlength="100" /><form:errors path="actionOrder" cssClass="errors"/></td>
		</tr>
		</tbody>
	</table>
</div>
<div class="editePageBtn">
    	<ul>
            <li><input class="buttonCls addBtn" type="button" value="保存" onclick="if(confirm('确认要保存吗？')){postDataByURL('operation.do?actionMethod=add&sourceId=${sourceId}',$('#fwSrcAction').serialize(),'workspace');}"></li>
            <li><input class="buttonCls addBtn" type="button" value="返回" onclick="getData('operation.do?actionMethod=query','sourceId='+${sourceId},'workspace');"></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>