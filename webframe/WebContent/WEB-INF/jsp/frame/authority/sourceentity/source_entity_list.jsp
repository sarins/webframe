<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_sourceEntity_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="EfwSourceEntity" name="EfwSourceEntity">
<fieldset>
	<legend>查询条件</legend>
	<div class="condition_left">
	<table  class="formInfo">
		<tbody>
		<tr>
			<td class="formElem labelName"><label>实体名称：</label></td>
			<td class="formElem"><input type="text" value="${t_entityName}" name="ht_t.entityName" id="ht_t_entityName" class="inText"/></td>
	    </tr>
	    </tbody>
	</table>
	</div>
	<div class="btn_right">
		<table class="conditionBtn">
		<tbody>
		    <tr>
		        <td height="25"><input type="button" value="查询" class="buttonCls" onclick="trimForm('EfwSourceEntity');postDataByFormName('EfwSourceEntity','workspace')"/></td>
		        <td height="25"><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_entityName']);"/></td>
		    </tr>
		  </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
	<div class="operationTool">
	<ul>
	<li>
		<input type="button" value="新增" class="buttonCls" <huatek:displayMethod methodName="add"/> onclick="getData('sourseEntity.do?actionMethod=add','','workspace');"/>
	</li>
	<li>
		<input type="button" value="删除" class="buttonCls" <huatek:displayMethod methodName="delete"/> onclick="deleteData('sourseEntity.do?actionMethod=delete','EfwSourceEntity');"/>
	</li>
	</ul>
	</div>
	<div class="clear"></div>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">实体信息</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="EfwSourceEntity" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
<div class="grid">
<table id="tb_sys_sourceEntity_table_list">
 	<thead>
		<tr>
			<th><input type="checkbox"  id="checkbox5" name="checkbox5" onclick="checkAll(this)">
			</th>
	        <th>实体名称</th>
	        <th>实体类</th>
	        <th>实体字段</th>
	        <th>查询地址</th>
	        <th>查询条件</th>
	        <th>同类实体</th>
	        <th>数据表对象</th>
	        <th>数据标题</th>
	        <th>数据名称</th>
	        <th>数据值</th>
	        <th>是否必填</th>
	        <th>修改</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="sourceEntity" items="${pageBean.dataList}" varStatus="s">
	<tr class="gradeX">
		<td align="center">
			<input type="checkbox" value="${sourceEntity.id}" name="id" >
		</td>
		<td><c:out value="${sourceEntity.entityName}"/></td>
		<td><c:out value="${sourceEntity.entityClass}"/></td>
		<td><c:out value="${sourceEntity.entityField}"/></td>
		<td><c:out value="${sourceEntity.queryUrl}"/></td>
		<td><c:out value="${sourceEntity.queryParam}"/></td>
		<td><c:out value="${sourceEntity.entityAlias}"/></td>
		<td><c:out value="${sourceEntity.outputClass}"/></td>
		<td><c:out value="${sourceEntity.outputTitle}"/></td>
		<td><c:out value="${sourceEntity.outputKey}"/></td>
		<td><c:out value="${sourceEntity.outputValue}"/></td>
		<td>
		<huatek:dicOut category="notNull" value="${sourceEntity.notNull}"/>
		</td>
		<td><a href="#" <huatek:displayMethod methodName="edit"/> onclick="getData('sourseEntity.do?actionMethod=edit&queryId=${sourceEntity.id}','','workspace');">修改</a>
		</td>
	</tr>
	</c:forEach>
	 </tbody>
</table>
</div>
<div class="gridToolbar">
	<div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true"  formName="EfwSourceEntity" offerPageSize="20,50,100" isExistForm="true"/>
	</div>
</div>
</div>
</form:form>

