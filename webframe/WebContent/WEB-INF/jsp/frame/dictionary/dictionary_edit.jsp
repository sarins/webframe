<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="fwDictionary" name="fwDictionary" onsubmit="return false">
<input type="hidden" value="${categoryId}" name="fwCategory"/>
<div class="widget">
	<div class="widgetTitle">
    	<span class="widgetTitleIco"><c:if test="${fwDictionary.id == null}">新增字典信息</c:if><c:if test="${fwDictionary.id != null}">修改字典信息</c:if></span>
    </div>
	<div class="widgetContainer">
		<table class="formInfo">

			<tr>
				<td class="formElem labelName"><span class="redmark">*</span>字典名称：</td>
				<td class="formElem lessTen"><form:input path="name" cssClass="inText"/></td>
			</tr>
			<tr>
				<td class="formElem labelName"><span class="redmark">*</span>字典编码：</td>
				<td class="formElem lessTen">
					<c:if test="${fwDictionary.id!=null}">
						 <input type="text" disabled="disabled" class="inText" name="code" value="<c:out value="${fwDictionary.code}"/>"/>
					</c:if>
					<c:if test="${fwDictionary.id == null}">
						 <input type="text" class="inText" name="code" value="<c:out value="${fwDictionary.code}"/>"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="formElem labelName"><span class="redmark">*</span>字典排序：</td>
				<td class="formElem lessTen"><form:input path="orderNum"  cssClass="inText"/></td>
			</tr>
			<tr>
				<td class="formElem labelName">字典状态：</td>
				<td class="formElem lessTen">
					<huatek:radio name="status" category="status" value="${fwDictionary.status }"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('fwDictionary');postDataByFormName('fwDictionary','workspace');}"/></li>
            <li><input type="button" value="取消" class="buttonCls" onclick="getData('dictionary.do?actionMethod=query&categoryId=${categoryId}','','workspace');"/></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>