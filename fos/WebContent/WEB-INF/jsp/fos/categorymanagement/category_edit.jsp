<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form:form modelAttribute="baseProjectCategoriesForm" cssClass="niceform" name="baseProjectCategoriesForm" onsubmit="return false">
<div class="widget">
<div class="widgetTitle">
<span class="widgetTitleIco">
<c:if test="${baseProjectCategories.id == null}">新增项目类目</c:if><c:if test="${baseProjectCategories.id != null}">修改项目类目</c:if>
</span>
</div>

<div class="widgetContainer">
<table class="formInfo">
	<tr>
		<td class="formElem labelName"><label><span class="redmark">*</span>类目编码：</label></td>
		<td class="formElem lessTen"><input type="text" value="${baseProjectCategories.proCateCode}" name="proCateCode" id="proCateCode" class="inText" <c:if test="${baseProjectCategories.id != null}">disabled="disabled"</c:if>/>
		</td>
	</tr>
	<tr>
		<td class="formElem labelName"><label><span class="redmark">*</span>类目名称：</label></td>
		<td class="formElem lessTen"><input type="text" value="${baseProjectCategories.proCateName}" name="proCateName" id="proCateName" class="inText"/></td>
	</tr>
	<tr>
		<td class="formElem labelName"><label><span class="redmark">*</span>所属模块：</label></td>
		<td class="formElem lessTen">
		    <select id="moduleName" name="moduleName" onchange="getCategoryByModule('${baseProjectCategories.id}')">
				<option value="">--请选择--</option>
				<c:forEach var="module" items="${moduleNameList}">
					<option value="${module.code}"
					<c:if test="${module.code==baseProjectCategories.moduleName}"> selected</c:if>>
						<c:out value="${module.name}"/>
					</option>
				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td class="formElem labelName">上级类目：</td>
		<td class="formElem lessTen">
		    <select name="parent" id="parent">
				<option value="">--请选择--</option>
				<c:forEach var="category" items="${categoriesList}">
					<option value="${category.id}"
					<c:if test="${category.id==baseProjectCategories.parent.id}"> selected</c:if>>${category.tabString}<c:out value="${category.proCateName}"/>
					</option>
				</c:forEach>
			</select>
			</td>
	</tr>
</table>
</div>
<div class="editePageBtn">
    	<ul>
            <li><input class="buttonCls" type="button" value="保存" onclick="if(confirm('确认要保存吗？')){trimForm('baseProjectCategoriesForm');postDataByFormName('baseProjectCategoriesForm','workspace');}"></li>
            <li><input class="buttonCls" type="button" value="返回" onclick="getData('baseProjectCategories.do?actionMethod=query','','workspace');"></li>
        </ul>
        <div class="clear"></div>
</div>
</div>
</form:form>
<script language="javascript">
	function getCategoryByModule(categoryId){
		 var moduleNameId=$("#moduleName").val();
		 switchData("common.do?actionMethod=getCategoryByModule&moduleName="+moduleNameId+"&categoryId="+categoryId,'',function(data,flag){
			if(flag==1){
	 			 	$("#parent").empty().append(data);
			}
		});
	}
</script>