<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek"  uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="efwBusinessModuleMap" onsubmit="return false">
<div class="widget">
	<div class="widgetTitle">
    	<span class="widgetTitleIco">
    		<huatek:decode result="${efwBusinessModuleMap.id == null}" firstValue="新增业务配置" secondValue="修改业务配置"/>
    	</span>
    </div>
    <div class="widgetContainer">
	<table class="formInfo">
		<tr>
			<td class="formElem labelName"><spring:message code="efwBusinessModuleMapForm.name.displayName"/>：</td>
			<td class="formElem lessTen"><form:input path="name" cssClass="inText" /></td>
		</tr>
		<tr>
			<td class="formElem labelName"><spring:message code="efwBusinessModuleMapForm.efwBusinessModule.displayName"/>：</td>
			<td class="formElem lessTen">
					<huatek:select name="efwBusinessModule" id="efwBusinessModule" dataList="${baseBusinessModuleList}" value="${efwBusinessModuleMap.efwBusinessModule.id}" textMethod="getName" valueMethod="getId"/>
			</td>
		</tr>
		<tr>
			<td class="formElem labelName"><spring:message code="efwBusinessModuleMapForm.efwSourceEntity.displayName"/>：</td>
			<td class="formElem lessTen">
					<huatek:select name="efwSourceEntity" id="efwSourceEntity" dataList="${sourceEntityList}" value="${efwBusinessModuleMap.efwSourceEntity.id}" textMethod="getEntityName" valueMethod="getId"/>
			</td>
		</tr>
	</table>
	</div>
	<div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('efwBusinessModuleMap');postDataByFormName('efwBusinessModuleMap','workspace');}"/></li>
            <li><input type="button" value="返回" class="buttonCls" onclick="getData('efwBusinessModuleMap.do?actionMethod=query','','workspace');"/></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>
