<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek"  uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="efwApplyScope" name="efwApplyScope" onsubmit="return false">
<div class="widget">
	<div class="widgetTitle">
    	<span class="widgetTitleIco">
    	<huatek:decode result="${efwApplyScope.id == null}" firstValue="新增映射信息" secondValue="修改映射信息"/>
    	</span>
    </div>
    <div class="widgetContainer">
		<table class="formInfo">
			<tr>
				<td class="formElem labelName"><spring:message code="efwApplySCopeForm.targetClass.displayName"/>：</td>
				<td class="formElem lessTen"><form:input path="targetClass" cssClass="inText"/></td>
			</tr>
			<tr>
				<td class="formElem labelName"><spring:message code="efwApplySCopeForm.targetField.displayName"/>：</td>
				<td class="formElem lessTen"><form:input path="targetField"  cssClass="inText"/></td>
			</tr>
			<tr>
				<td class="formElem labelName"><spring:message code="efwApplySCopeForm.isEnabled.displayName"/>：</td>
				<td class="formElem lessTen">
					<huatek:radio name="isEnabled" category="notNull" value="${efwApplyScope.isEnabled}"/>
				</td>
			</tr>
			<tr>
				<td class="formElem labelName"><spring:message code="efwApplySCopeForm.efwBusinessModuleMap.displayName"/>：</td>
				<td class="formElem lessTen">
					<c:out value="${efwApplyScope.efwBusinessModuleMap.name}"></c:out>
				</td>
			</tr>
		</table>
	</div>
	<div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('efwApplyScope');postDataByFormName('efwApplyScope','workspace');}"/></li>
            <li><input type="button" value="返回" class="buttonCls" onclick="getData('applyScope.do?actionMethod=query&id=${efwApplyScope.efwBusinessModuleMap.id}','','workspace');"/></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>