<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="fwGroup" name="fwGroup" onsubmit="return false">
<div class="widget">
	<div class="widgetTitle">
		<span class="widgetTitleIco">
			<huatek:decode result="${fwGroup.id == null}" firstValue="新增部门管理信息" secondValue="修改部门管理信息"/>
		</span>
	</div>
	<div class="widgetContainer">
		<table class="formInfo">
			<tbody>
			  <tr>
			    <td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="groupForm.name.displayName"/>：</label>
			    </td>
			    <td class="formElem lessTen">
			      <form:input path="name" cssClass="inText"/>
			    </td>
			  </tr>
			   <tr>
			    <td class="formElem labelName">
			      <label><span class="redmark">*</span><spring:message code="groupForm.parent.displayName"/>：</label>
			    </td>
			    <td class="formElem lessTen">
					<huatek:select name="parent" dataList="${groupList}" value="${fwGroup.parent.id}" textMethod="getTabName" valueMethod="getId"/>
			    </td>
			  </tr>
			  <tr>
			   <td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="groupForm.groupType.displayName"/>：</label></td>
			   <td class="formElem lessTen">
			       <huatek:radio name="groupType" category="groupType" value="${fwGroup.groupType}"/>
			    </td>
			  </tr>
			 	<tr>
			   <td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="groupForm.status.displayName"/>：</label></td>
			   <td class="formElem lessTen">
			       <huatek:radio name="status" category="status" value="${fwGroup.status}"/>
			    </td>
			  </tr>
			   <tr>
			    <td class="formElem labelName">
			      <label><spring:message code="groupForm.describe.displayName"/>：</label>
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
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('fwGroup');postDataByFormName('fwGroup','workspace');}"/></li>
            <li><input type="button" value="返回" class="buttonCls" onclick="getData('groupController.do?actionMethod=query','','workspace');"/></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>