<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ include file="/init_script.jsp" %>
<c:set var="currentGridId" value="tb_sys_category_table_list"></c:set>
<form:form modelAttribute="baseProjectCategoriesForm" name="baseProjectCategoriesForm" onsubmit="return false">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
		<table class="formInfo">
			<tbody>
			<tr>
				<td class="formElem labelName">类目名称：</td>
				<td class="formElem">
					<input type="text" value="" name="ht_t.proCateName" id="ht_t_proCateName" class="inText"/>
				</td>
				<td class="formElem labelName">类目编码：</td>
				<td class="formElem">
					<input type="text" value="${t_proCateCode}" name="ht_t.proCateCode" id="ht_t_proCateCode" class="inText"/>
				</td>
				<!-- <td class="formElem labelName">类目级别：</td> -->
				<!-- 暂时去掉通过下拉列表级联查询项目类目功能 -->
				<!--<td>
					<select id="ht_t.level" name="ht_t.level" ">
						<option value="">---请选择---</option>
						<option value="1" <c:if test="${t_level == 1}">selected</c:if>>一级</option>
						<option value="2" <c:if test="${t_level == 2}">selected</c:if>>二级</option>
					</select>
				</td>  -->
     		</tr>
     		<!-- 暂时去掉通过下拉列表级联查询项目类目功能 -->
     		<!--<tr>
     			<td class="formElem labelName">类目：</td>
     			<td colspan="3">
     				<select name="categoryFirst" id="categoryFirst1" onchange="getSecondCategory(1,2)">
     					<option value="0">--请选择--</option>
						<c:forEach var="category" items="${categoriesList}">
							<option value="${category.id}" >${category.proCateName}</option>
						</c:forEach>
     				</select>
     				<select name="categorySecond" id="categorySecond1" onchange="">
     					<option value="0">---请选择---</option>
     				</select>
     			</td>
     		</tr>  -->
		    </tbody>
		</table>
	</div>
<div class="btn_right">
		<ul>
        	<li>
        	<input type="button" value="查询" class="buttonCls" onclick="trimForm('baseProjectCategoriesForm');queryData();"/>
            <input type="button" value="清空" class="buttonCls" onclick="cleanData();"/></li>
        </ul>
</div>
<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
		<li><input type="button" value="新增" class="buttonCls" <huatek:displayMethod methodName="add"/> onclick="getData('baseProjectCategories.do?actionMethod=add','','workspace');"/></li>
		<li><input type="button" value="删除" class="buttonCls" <huatek:displayMethod methodName="delete"/> onclick="deleteSource();"/></li>
	</ul>
	<div class="clear"></div>
</div>
<!-- 查询结果区域 Start-->
<div id="resultList">
</div>
<!-- 查询结果区域 End-->
</form:form>
<script language="javascript">

	//加载查询列表页面
	$("document").ready(function(){
		queryData();
	});
	function queryData(){
		postDataByURL('baseProjectCategories.do?actionMethod=query',$('#baseProjectCategoriesForm').serialize(),'resultList');
	}

	//暂时去掉通过下拉列表级联查询项目类目功能
	/**	function getSecondCategory(i,j) {
			var categoryFirst = "#categoryFirst" +i;
			var categorySecond = "#categorySecond"+i;
			var level=j;
			switchData("common.do?actionMethod=getSecondCategoryById&level="+level,"categoryFirst=" + $(categoryFirst).val(),function(data,flag){
				if(flag==1){
					if(data=="<option value='0'>---请选择---</option>"){
					 	$("#categorySecond1").hide();
				 	}else{
						$("#categorySecond1").show();
		 			 	$("#categorySecond1").empty().append(data);
					}
				}
			});
		}**/

	//删除按钮事件处理
	function deleteSource(){
		if(jqchk()){
			if(confirm('确定要删除吗？')){
				postDataByURL('baseProjectCategories.do?actionMethod=delete',$('#baseProjectCategoriesForm').serialize(),'workspace');
			}
		}
	}
	//获取删除复选框值
	function jqchk(){  
		var chk_value =[];
		$('input[name="id"]:checked').each(function(){
		chk_value.push($(this).val());
		});
		if(chk_value.length==0){
			alert('没有选择任何数据!');
			return false;
		}
		return true;
	}

	//清空表单信息
	function cleanData(){
		document.getElementById('ht_t_proCateCode').value='';
		document.getElementById('ht_t_proCateName').value='';
		//暂时去掉通过下拉列表级联查询项目类目功能
		//$("#ht_t.level").val('');
		//$("#categoryFirst1").val('0');
		//$("#categorySecond1").val('0');
	}
</script>

