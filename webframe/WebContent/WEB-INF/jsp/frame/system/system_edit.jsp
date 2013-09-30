<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek"  uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="fwSystem" onsubmit="return false">
<div class="widget">
	<div class="widgetTitle">
		<span class="widgetTitleIco"><c:if test="${fwSystem.id == null}">新增系统信息</c:if><c:if test="${fwSystem.id != null}">修改系统信息</c:if></span>
	</div>
	<div class="widgetContainer">
		<table class="formInfo">
			<tbody>
			  <tr>
			    <td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="systemForm.name.displayName"/>:</label>
			    </td>
			    <td class="formElem lessTen">
			      <form:input path="name" cssClass="inText"/>
			    </td>
			  </tr>
			  <tr>
			    <td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="systemForm.sysCode.displayName"/>:</label>
			    </td>
			    <td class="formElem lessTen">
			      <form:input path="sysCode" cssClass="inText"/>
			    </td>
			  </tr>
			  <tr>
			    <td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="systemForm.contextPath.displayName"/>:</label>
			    </td>
			    <td class="formElem lessTen">
			      <form:input path="contextPath" cssClass="inText"/>
			    </td>
			  </tr>
			  <tr>
			    <td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="systemForm.status.displayName"/>:</label>
			    </td>
			    <td class="formElem lessTen">
			    <huatek:radio name="status" category="status" value="${fwSystem.status}"/>
			    </td>
			  </tr>

			  <tr>
			    <td class="formElem labelName"><label><spring:message code="systemForm.sysIp.displayName"/>:</label>
			    </td>
			    <td class="formElem lessTen">
			      <form:input path="sysIp" cssClass="inText"/>
			    </td>
			  </tr>
			  <tr>
			    <td class="formElem labelName"><label><spring:message code="systemForm.sysPort.displayName"/>:</label>
			    </td>
			    <td class="formElem lessTen">
			      <form:input path="sysPort" cssClass="inText"/>
			    </td>
			  </tr>

			  <tr>
			    <td class="formElem labelName"><label><spring:message code="systemForm.describe.displayName"/>:</label>
			    </td>
			    <td class="formElem lessTen">
			    <form:textarea path="describe" cssClass="inText"/>
			    </td>
			  </tr>
		  </tbody>
		</table>
	</div>
	<div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('fwSystem');postDataByFormName('fwSystem','workspace');}"/></li>
            <li><input type="button" value="返回" class="buttonCls" onclick="getData('system.do?actionMethod=query','','workspace');"/></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>
