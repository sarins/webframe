<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="efwDataRole" onsubmit="return false">
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco"><c:if test="${efwDataRole.id == null}">新增数据角色</c:if><c:if test="${efwDataRole.id != null}">修改数据角色</c:if></span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
                <tr>
                	<td class="formElem labelName"><label><spring:message code="efwUserDataRoleForm.daName.displayName"/>：</label></td>
                    <td class="formElem lessTen"><input type="text" class="inText" name="daName" value="<c:out value="${efwDataRole.daName}"/>"/></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><spring:message code="efwUserDataRoleForm.status.displayName"/>：</label></td>
                    <td class="formElem lessTen">
                    	<huatek:radio name="status" category="status" value="${efwDataRole.status}"/>
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><spring:message code="efwUserDataRoleForm.description.displayName"/>：</label></td>
                    <td class="formElem lessTen"><textarea name="description"><c:out value="${efwDataRole.description}"/></textarea></td>
                </tr>
        </tbody>
        </table>
    </div>
    <div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('efwDataRole');postDataByFormName('efwDataRole','workspace');}"/></li>
            <li><input type="button" value="取消" class="buttonCls" onclick="getData('efwDataRole.do?actionMethod=query','','workspace');"/></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>
