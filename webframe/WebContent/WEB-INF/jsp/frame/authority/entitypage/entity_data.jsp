<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek"  uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_data_authority_list_${efwSourceEntity.id}"></c:set>
<%@ include file="/init_script.jsp" %>
<form id="entityForm_${efwSourceEntity.id}" name="form_${efwSourceEntity.id}" method="post" onsubmit="return false">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
		<table class="formInfo">
			<tbody>
			<tr>
				<td class="formElem labelName"><label><c:out value="${efwSourceEntity.outputTitle}"></c:out>：</label></td>
				<td class="formElem"><input type="text" value="<c:out value="${queryValue}"/>" name="ht_t.${efwSourceEntity.outputKey}" id="ht_t_${efwSourceEntity.outputKey}" class="inText"/></td>
				<td class="formElem labelName"><label>是否选中：</label></td>
				<td class="formElem"><input type="checkbox" value="1" name="queryChecked" id="queryChecked" <c:if test="${queryChecked}"> checked</c:if> /></td>
		    </tr>
		    </tbody>
		</table>
	</div>
	<div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td><input type="button" value="查询" class="buttonCls" onclick="queryEntity('${businessModuleId}','${entityId}','dataRoleId=${dataRoleId}');"/></td>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_${efwSourceEntity.outputKey}']);"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName"><c:out value="${efwSourceEntity.entityName}"></c:out></div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="form_${efwSourceEntity.id}" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryEntity(${businessModuleId}, ${entityId},'dataRoleId=${dataRoleId}')"/>
		</div>
		<div class="clear"></div>
	</div>
	<div class="grid">
		<table  id="tb_data_authority_list_${efwSourceEntity.id}">
		    <thead>
			<tr>
				<th>
					&nbsp;
				</th>
				<th><c:out value="${efwSourceEntity.outputTitle}"></c:out></th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="dictionary" items="${pageBean.dataList}" varStatus="s">
			<tr>
				<td>
					<input type="checkbox" value="${dictionary.id}" <c:if test="${dictionary.checked}">checked="true"</c:if> name="id" onclick="assignAuthority(${businessModuleId},this,'${entityId}','${dictionary.code}','${dataRoleId}')">
				</td>
				<td><c:out value="${dictionary.name}"/></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="form_${efwSourceEntity.id}" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryEntity(${businessModuleId}, ${entityId},'dataRoleId=${dataRoleId}')"/>
		</div>
        <div class="clear"></div>
	</div>
</div>
</form>