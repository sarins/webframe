<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="efwBusinessModule" name="efwBusinessModule" onsubmit="return false">
<div class="widget">
	 <div class="widgetTitle">
    	<span class="widgetTitleIco"><c:if test="${efwBusinessModule.id == null}">新增业务权限</c:if><c:if test="${efwBusinessModule.id != null}">修改业务权限</c:if></span>
    </div>
<div class="widgetContainer">
	<table class="formInfo">
		<tr>
			<td class="formElem labelName"><spring:message code="efwBusinessModuleForm.title.displayName"/>：</td>
			<td class="formElem lessTen"><form:input path="title" cssClass="inText"/></td>
		</tr>
		<tr>
			<td class="formElem labelName"><spring:message code="efwBusinessModuleForm.name.displayName"/>：</td>
			<td class="formElem lessTen"><form:input path="name" cssClass="inText"/></td>
		</tr>
		<tr>
			<td class="formElem labelName"><spring:message code="efwBusinessModuleForm.menuIds.displayName"/>：</td>
			<td class="formElem lessTen"><form:input path="menuIds" cssClass="inText"/>(以英文逗号分隔)</td>
		</tr>
		<tr>
			<td class="formElem labelName"><spring:message code="efwBusinessModuleForm.status.displayName"/>：</td>
			<td class="formElem lessTen">
				<huatek:radio name="status" category="status" value="${efwBusinessModule.status}"/>
			</td>
		</tr>
	</table>
</div>
<div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('efwBusinessModule');postDataByFormName('efwBusinessModule','workspace');}"/></li>
            <li><input type="button" value="返回" class="buttonCls" onclick="getData('efwBusinessModule.do?actionMethod=query','','workspace');"/></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>
