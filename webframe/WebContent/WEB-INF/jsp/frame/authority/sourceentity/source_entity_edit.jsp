<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="efwSourceEntity" name="efwSourceEntity" onsubmit="return false">
<form:hidden path="id"/>
<div class="widget">
	<div class="widgetTitle">
    	<span class="widgetTitleIco"><c:if test="${efwSourceEntity.id == null}">新增数据类</c:if><c:if test="${efwSourceEntity.id != null}">修改数据类</c:if></span>
    </div>
	<div class="widgetContainer">
		<table class="formInfo">
			<tr>
				<td class="formElem labelName"><span class="redmark">*</span>类名称：</td>
				<td class="formElem lessTen"><form:input path="entityName" cssClass="inText"/></td>
			</tr>
			<tr>
				<td class="formElem labelName"><span class="redmark">*</span>类代码：</td>
				<td class="formElem lessTen"><form:input path="entityClass" cssClass="inText"/></td>
			</tr>
			<tr>
				<td class="formElem labelName"><span class="redmark">*</span>类字段：</td>
				<td class="formElem lessTen"><form:input path="entityField"  cssClass="inText"/></td>
			</tr>
			<tr>
				<td class="formElem labelName"><span class="redmark"></span>查询地址：</td>
				<td class="formElem lessTen"><form:input path="queryUrl"  cssClass="inText"/></td>
			</tr>

			<tr>
				<td class="formElem labelName"><span class="redmark"></span>查询条件：</td>
				<td class="formElem lessTen"><form:input path="queryParam"  cssClass="inText"/>(以_prefix.开头)</td>
			</tr>

			<tr>
				<td class="formElem labelName"><span class="redmark"></span>可应用类：</td>
				<td class="formElem lessTen"><form:input path="entityAlias"  cssClass="inText"/></td>
			</tr>

			<tr>
				<td class="formElem labelName"><span class="redmark">*</span>数据输出类：</td>
				<td class="formElem lessTen"><form:input path="outputClass"  cssClass="inText"/></td>
			</tr>


			<tr>
				<td class="formElem labelName"><span class="redmark">*</span>数据标题：</td>
				<td class="formElem lessTen"><form:input path="outputTitle"  cssClass="inText"/></td>
			</tr>
			<tr>
				<td class="formElem labelName"><span class="redmark">*</span>数据名称：</td>
				<td class="formElem lessTen"><form:input path="outputKey"  cssClass="inText"/></td>
			</tr>
			<tr>
				<td class="formElem labelName"><span class="redmark">*</span>数据值：</td>
				<td class="formElem lessTen"><form:input path="outputValue"  cssClass="inText"/></td>
			</tr>
			<tr>
				<td class="formElem labelName">字段是否必填：</td>
				<td class="formElem lessTen">
				<huatek:radio name="notNull" category="notNull" value="${efwSourceEntity.notNull}"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('efwSourceEntity');postDataByFormName('efwSourceEntity','workspace');}"/></li>
            <li><input type="button" value="返回" class="buttonCls" onclick="getData('sourseEntity.do?actionMethod=query','','workspace');"/></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>
