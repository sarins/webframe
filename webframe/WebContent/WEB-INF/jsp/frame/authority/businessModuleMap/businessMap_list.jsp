<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_efwBusinessMap_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="efwBusinessMap" name="efwBusinessMap">
<fieldset>
	<legend>查询条件</legend>
	<div class="condition_left">
		<table  class="formInfo">
			<tbody>
				<tr>
					<td class="formElem labelName"><spring:message code="efwBusinessModuleMapForm.efwBusinessModule.displayName"/>：</td>
					<td class="formElem">
							<input type="text" value="${t_efwBusinessModule }" name="ht_t.efwBusinessModule" id="ht_t_efwBusinessModule" class="inText">
					</td>
					<td class="formElem labelName"><spring:message code="efwBusinessModuleMapForm.efwSourceEntity.displayName"/>：</td>
					<td class="formElem">
							<input type="text" value="${t_efwSourceEntity }" name="ht_t.efwSourceEntity" id="ht_t_efwSourceEntity" class="inText">
					</td>
					<td class="formElem labelName"><spring:message code="efwBusinessModuleMapForm.name.displayName"/>：</td>
					<td class="formElem"><input type="text" value="${t_name}" name="ht_t.name" id="ht_t_name" class="inText"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="btn_right">
		<table class="conditionBtn">
			<tbody>
			    <tr>
			        <td height="25"><input type="button" value="查询" class="buttonCls" onclick="trimForm('efwBusinessMap');postDataByFormName('efwBusinessMap','workspace')"/></td>
			        <td height="25"><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_efwBusinessModule','ht_t_efwSourceEntity','ht_t_name']);"/></td>
			    </tr>
		   </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
	<div class="operationTool">
		<UL>
			<li>
				<input type="button" value="新增" class="buttonCls" <huatek:displayMethod methodName="add"/> onclick="getData('efwBusinessModuleMap.do?actionMethod=add','','workspace');"/>
			</li>
			<li>
				<input type="button" value="删除" class="buttonCls" <huatek:displayMethod methodName="delete"/> onclick="deleteData('efwBusinessModuleMap.do?actionMethod=delete','efwBusinessMap');"/>
			</li>
			<li>
				<input type="button" value="应用设置" class="buttonCls" <huatek:displayMethod methodName="assign"/> onclick="assignData('applyScope.do?actionMethod=query&menuId=20238','efwBusinessMap');"/>
			</li>
		</UL>
	</div>
	<div class="clear"></div>
<div class="widget">
	<div class="gridToolbar">
		<div class="gridHeaderName">业务模块权限信息</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}"  isOuterForm="true"  formName="efwBusinessMap" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
<div class="grid">
<table id="tb_sys_efwBusinessMap_table_list">
 <thead>
	<tr>
		<th><input type="checkbox" id="checkbox5" name="checkbox5" value="1" onclick="checkAll(this)">全选
		</th>
        <th><spring:message code="efwBusinessModuleMapForm.name.displayName"/></th>
        <th><spring:message code="efwBusinessModuleMapForm.efwSourceEntity.displayName"/></th>
        <th><spring:message code="efwBusinessModuleMapForm.efwBusinessModule.displayName"/></th>
        <th><spring:message code="link.modify"/></th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="businessMap" items="${pageBean.dataList}" varStatus="s">
	<tr class="gradeX">
		<td>
			<input type="checkbox" value="${businessMap.id}" name="id" >
		</td>
		<td><c:out value="${businessMap.name}"/></td>
		<td><c:out value="${businessMap.efwSourceEntity.entityName}"/></td>
		<td><c:out value="${businessMap.efwBusinessModule.name}"/></td>
		<td><a href="#" <huatek:displayMethod methodName="edit"/> onclick="getData('efwBusinessModuleMap.do?actionMethod=edit&queryId=${businessMap.id}','','workspace');">修改</a>
	</tr>
	</c:forEach>
	 </tbody>
</table>
</div>
<div class="gridToolbar">
	<div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" formName="efwBusinessMap" offerPageSize="20,50,100" isExistForm="true"/>
	</div>
</div>
</div>
</form:form>

