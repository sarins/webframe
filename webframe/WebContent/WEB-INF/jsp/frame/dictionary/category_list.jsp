<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_category_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="fwCategory" name="fwCategory">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
		<table class="formInfo">
			<tbody>
			<tr>
				<td class="formElem labelName">字典目录名称：</td>
				<td class="formElem"><input type="text" value="${t_name}" name="ht_t.name" id="ht_t_name" class="inText"/></td>
     		</tr>
		    </tbody>
		</table>
	</div>
<div class="btn_right">
   	<table class="conditionBtn">
       	<tbody>
		    <tr>
		        <td><input type="button" value="查询" class="buttonCls" onclick="trimForm('fwCategory');postDataByFormName('fwCategory','workspace')"/></td>
        		<td height="25"><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_name']);"/></td>
    		</tr>
	</table>
</div>
<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
		<li><input type="button" value="新增" class="buttonCls" <huatek:displayMethod methodName="add"/> onclick="getData('dicCategory.do?actionMethod=add','','workspace');"/></li>
		<li><input type="button" value="生效" class="buttonCls" <huatek:displayMethod methodName="condition"/> onclick="updateStatus('A');"/></li>
		<li><input type="button" value="失效" class="buttonCls" <huatek:displayMethod methodName="condition"/> onclick="updateStatus('D');"/></li>
		<li><input type="button" value="删除" class="buttonCls" <huatek:displayMethod methodName="delete"/> onclick="deleteData('dicCategory.do?actionMethod=delete','fwCategory');"/></li>
		<li><input type="button" value="字典明细" class="buttonCls" <huatek:displayMethod methodName="query"/> onclick="assignData('dicCategory.do?actionMethod=assign')"/></li>
	</ul>
	<div class="clear"></div>
</div>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">字典目录信息</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="fwCategory" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
	<div class="grid">
	<table id="tb_sys_category_table_list">
	 <thead>
		<tr>
			<th><input type="checkbox" name="checkbox5" id="checkbox5" onclick="checkAll(this)">
			</th>
	        <th>字典目录名称</th>
	        <th>字典目录编码</th>
	        <th>状态</th>
	        <th>所属系统</th>
	        <th>修改</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="category" items="${pageBean.dataList}" varStatus="s">
			<tr  class="gradeX">
				<td>
					<input type="checkbox" value="${category.id}" name="id" >
				</td>
				<td><c:out value="${category.name}"/></td>
				<td><c:out value="${category.code}"/></td>
				<td>
				<huatek:dicOut category="status" value="${category.display}"/>
				</td>
				<td><c:out value="${category.fwSystem.name}"/></td>
				<td><a href="#" onclick="getData('dicCategory.do?actionMethod=edit&queryId=${category.id}','','workspace');">修改</a>
				</td>
			</tr>
		</c:forEach>
		 </tbody>
	</table>
</div>
	<div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="fwCategory" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
        <div class="clear"></div>
	</div>
</div>
</form:form>
<script language="javascript">
	function updateStatus(status){
		if(jqchk()){
			if(confirm('确定要修改吗？')){
				postDataByURL('dictionary.do?actionMethod=condition'+'&statuss='+status+'&categoryId=${categoryId}',$('#fwDictionary').serialize(),'workspace','修改成功');
			}
		}
	}
</script>

