<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek"  uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_efwTargetFieldMap_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="efwApplyScope" name="efwApplyScope">
<div class="widgetTitle">
    	<span class="widgetTitleIco">应用设置</span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label>当前业务模块配置:</label></td>
                	<td  class="formElem lessTen"><c:out value="${efwBusinessModuleMap.name}"/> </td>
                 </tr>
             </tbody>
        </table>
    </div>
<fieldset>
	<legend>查询条件</legend>
	<div class="condition_left">
	<table class="formInfo">
		<tbody>
			<tr>
				<td class="formElem labelName">目标类：</td>
				<td class="formElem"><input type="text" value="${t_targetClass}" name="ht_t.targetClass" id="ht_t_targetClass" class="inText"/></td>
		  		<td class="formElem labelName">目标字段：</td>
				<td class="formElem"><input type="text" value="${t_targetField}" name="ht_t.targetField" id="ht_t_targetField" class="inText"/></td>
		    </tr>
	    </tbody>
	</table>
	</div>
	<div class="btn_right">
		<table class="conditionBtn">
			<tbody>
			    <tr>
			        <td height="25"><input type="button" value="查询" class="buttonCls" onclick="trimForm('efwApplyScope');postDataByFormName('efwApplyScope','workspace')"/></td>
			        <td height="25"><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_targetClass','ht_t_targetField']);"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="operationTool">
<ul>
	<li>
		<input type="button" value="新增" class="buttonCls" <huatek:displayMethod methodName="add"/> onclick="getData('applyScope.do?actionMethod=add&moduleMapId=${efwBusinessModuleMap.id}','','workspace');"/>
	</li>
	<li>
		<input type="button" value="删除" class="buttonCls" <huatek:displayMethod methodName="delete"/> onclick="deleteData('applyScope.do?actionMethod=delete&moduleMapId=${efwBusinessModuleMap.id}','efwApplyScope');"/>
	</li>
	<li>
		<input type="button" value="返回" class="buttonCls"  onclick="getData('efwBusinessModuleMap.do?actionMethod=query&menuId=20682','','workspace');" "/>
	</li>
</ul>
</div>
<div class="clear"></div>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">目标字段信息</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="efwApplyScope" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
<div class="grid">
<table id="tb_sys_efwTargetFieldMap_table_list">
    <thead>
		<tr>
			<th width="40" align="center"><input type="checkbox" name="checkbox5" id="checkbox5" onclick="checkAll(this)"/>全选</th>
			<th><spring:message code="efwApplySCopeForm.targetClass.displayName"/></th>
	        <th><spring:message code="efwApplySCopeForm.targetField.displayName"/></th>
	        <th><spring:message code="efwApplySCopeForm.isEnabled.displayName"/></th>
	        <th><spring:message code="efwApplySCopeForm.efwBusinessModuleMap.displayName"/></th>
	        <th><spring:message code="link.modify"/></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="target" items="${pageBean.dataList}" varStatus="s">
		<tr class="gradeX">
			<td><input type="checkbox" value="${target.id}" name="id" ></td>
			<td><div title="${target.targetClass}"><huatek:out value="${target.targetClass}" encode="true"/></div></td>
			<td><div title="${target.targetField}"><huatek:out value="${target.targetField}" encode="true"/></div></td>
			<td>
				<huatek:dicOut category="notNull" value="${target.isEnabled}"/>
			</td>
			<td><c:out value="${target.efwBusinessModuleMap.name}"/></td>
			<td><a href="#" <huatek:displayMethod methodName="edit"/> onclick="getData('applyScope.do?actionMethod=edit&queryId=${target.id}','','workspace');"><spring:message code="link.modify"/></a>
		</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
<div class="gridToolbar">
	<div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true"  formName="efwApplyScope" offerPageSize="20,50,100" isExistForm="true"/>
	</div>
</div>
</div>
</form:form>
