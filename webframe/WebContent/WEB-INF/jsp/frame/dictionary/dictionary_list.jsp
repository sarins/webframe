<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_fwDictionary_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="fwDictionary" name="fwDictionary">
<fieldset>
	<legend>查询条件</legend>
	<div class="condition_left">
		<table  class="formInfo">
		<tbody>
			<tr>
				<td class="formElem labelName"><label>字典值：</label></td>
				<td class="formElem"><input type="text" value="${t_name}" name="ht_t.name" id="ht_t_name" /></td>
		    </tr>
		    </tbody>
		</table>
	</div>
	<div class="btn_right">
   	<table class="conditionBtn">
       	<tbody>
		    <tr>
		        <td><input type="button" value="查询" class="buttonCls" onclick="trimForm('fwDictionary');postDataByFormName('fwDictionary','workspace')"/></td>
        		<td height="25"><input type="button" value="清空" class="buttonCls" onclick="cleanText(['ht_t_name']);"/></td>
    		</tr>
	</table>
</div>
<div class="clear"></div>
</fieldset>
	<div class="operationTool">
		<ul>
			<li><input type="button" value="新增" class="buttonCls" <huatek:displayMethod methodName="add"/> onclick="getData('dictionary.do?actionMethod=add&categoryId=${categoryId}','','workspace');"/></li>
			<li><input type="button" value="生效" class="buttonCls" <huatek:displayMethod methodName="condition"/> onclick="updateStatus('A');"/></li>
			<li><input type="button" value="失效" class="buttonCls" <huatek:displayMethod methodName="condition"/> onclick="updateStatus('D');"/></li>
			<li><input type="button" value="删除" class="buttonCls" <huatek:displayMethod methodName="delete"/> onclick="deleteData('dictionary.do?actionMethod=delete&categoryId=${categoryId}','fwDictionary');"/></li>
			<li><input type="button" value="返回" class="buttonCls" <huatek:displayMethod methodName="query"/> onclick="getData('dicCategory.do?actionMethod=query&menuId=20041','','workspace');"/></li>
		</ul>
		<div class="clear"></div>
	</div>
<div class="gridInfo">
	<div class="gridToolbar">
		<div class="gridHeaderName">【${fwCategory.name}】字典明细列表</div>
		<div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="fwDictionary" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
		<div class="clear"></div>
	</div>
<div class="grid">
<table id="tb_sys_fwDictionary_table_list">
	<thead>
	<tr>
		<th width="40" align="center">
			<input name="checkbox5" type="checkbox" id="checkbox5" onclick="checkAll(this)"/>
		</th>
        <th>字典值</th>
        <th>字典值编码</th>
        <th>目录</th>
        <th>字典排序</th>
        <th>状态</th>
        <th>操作</th>
	</tr>
	</thead>
	<tbody>
	<c:forEach var="dic" items="${pageBean.dataList}" varStatus="s">
	<tr class="gradeX">
		<td align="center">
			<input type="checkbox" value="${dic.id}" name="id" >
		</td>
		<td><c:out value="${dic.name}"/></td>
		<td><c:out value="${dic.code}"/></td>
		<td><c:out value="${dic.fwCategory.name}"/></td>
		<td><c:out value="${dic.orderNum}"/></td>
		<td>
		<huatek:dicOut category="status" value="${dic.status}"/>
		</td>
		<td><a href="#" onclick="getData('dictionary.do?actionMethod=edit&id=${dic.id}&categoryId=${categoryId}','','workspace');">修改</a></td>
	</tr>
	</c:forEach>
	 </tbody>
</table>
</div>
<div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="fwDictionary" offerPageSize="20,50,100" isExistForm="true"/>
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
