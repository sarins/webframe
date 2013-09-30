<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_efwBusiness_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="efwBusiness" name="efwBusiness">
<fieldset>
	<legend>查询条件</legend>
	<div class="condition_left">
		<table  class="formInfo">
			<tbody>
				<tr>
					<td class="formElem labelName">业务名称：</td>
					<td class="formElem"><input type="text" value="${t_name}" name="ht_t.name" id="ht_t_name" class="inText"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="btn_right">
		<table class="conditionBtn">
			<tbody>
			    <tr>
			        <td height="25"><input type="button" value="查询" class="buttonCls" onclick="trimForm('efwBusiness');postDataByFormName('efwBusiness','workspace')"/></td>
			        <td height="25"><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_name']);"/></td>
			    </tr>
			  </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
	<div class="operationTool">
		<ul>
			<li>
				<input type="button" value="新增" class="buttonCls" <huatek:displayMethod methodName="add"/> onclick="getData('efwBusinessModule.do?actionMethod=add','','workspace');"/>
			</li>
			<li>
				<input type="button" value="删除" class="buttonCls" <huatek:displayMethod methodName="delete"/> onclick="deleteData('efwBusinessModule.do?actionMethod=delete','efwBusiness');"/>
			</li>
		</ul>
	</div>
	<div class="clear"></div>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">业务模块信息</div>
	<div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true"  formName="efwBusiness" offerPageSize="20,50,100" isExistForm="true"/>
	</div>
	<div class="clear"></div>
	</div>
<div class="grid">
<table id="tb_sys_efwBusiness_table_list">
	 <thead>
		<tr>
			<th width="60" align="center"><input type="checkbox" id="checkbox5" name="checkbox5" value="1"  class="formheader" onclick="checkAll(this)">全选
			</th>
			<th><spring:message code="efwBusinessModuleForm.title.displayName"/></th>
	        <th><spring:message code="efwBusinessModuleForm.name.displayName"/></th>
	        <th><spring:message code="efwBusinessModuleForm.menuIds.displayName"/></th>
	        <th><spring:message code="efwBusinessModuleForm.status.displayName"/></th>
	        <th><spring:message code="link.modify"/></th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="business" items="${pageBean.dataList}" varStatus="s">
		<tr>
			<td>
				<input type="checkbox" value="${business.id}" name="id" >
			</td>
			<td><c:out value="${business.title}"/></td>
			<td><c:out value="${business.name}"/></td>
			<td><c:out value="${business.menuIds}"/></td>
			<td>
			<huatek:dicOut category="status" value="${business.status}"/>
			</td>
			<td><a href="#"  onclick="getData('efwBusinessModule.do?actionMethod=edit&queryId=${business.id}','','workspace');">修改</a>
			</td>
		</tr>
		</c:forEach>
		 </tbody>
</table>
</div>
<div class="gridToolbar">
	<div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="efwBusiness" offerPageSize="20,50,100" isExistForm="true"/>
	</div>
</div>
</div>
</form:form>

