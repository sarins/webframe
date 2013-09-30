<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="fwSource" name="fwSource" onsubmit="return false">
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">
    		<huatek:decode result="${fwSource.id == null}" firstValue="新增菜单" secondValue="修改菜单"/>
    	</span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>菜单名称：</label></td>
                    <td class="formElem lessTen"><input type="text" class="inText" name="name" value="<c:out value="${fwSource.name}"/>"/></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>访问路径：</label></td>
                    <td class="formElem lessTen"><input type="text" class="inText" name="sourceCode" value="<c:out value="${fwSource.sourceCode}"/>"/></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>菜单显示：</label></td>
                    <td class="formElem lessTen">
                      <form:select path="isMenu" cssClass="inText">
							<form:option value="1">普通显示</form:option>
							<form:option value="2">Tab显示</form:option>
							<form:option value="0">不显示</form:option>
					  </form:select>
                    </td>
                </tr>
                <c:if test="${fwSource.id == null}">
                <tr>
                	<td class="formElem labelName"><label>上级菜单：</label></td>
                    <td class="formElem lessTen">
                    	<select id="parent" name="parent" class="inText" >
					        <option  value="">---请选择----</option>
					        <c:forEach var="source" items="${parentList}">
					       	<c:if test="${source.isMenu==1}">
					       		<option value="${source.id}" <c:if test="${source.id==fwSource.parent.id}"> selected</c:if>>${source.tabString}<c:out value="${source.name}"/></option>
					      	</c:if>
					        </c:forEach>
		    			</select>
                    </td>
                </tr>
                </c:if>
				<tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>状态：</label></td>
                    <td class="formElem lessTen">
                    	<huatek:radio name="status" category="status" value="${fwSource.status}"/>
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label>描述：</label></td>
                    <td class="formElem lessTen">
                    	<textarea name="description"><c:out value="${fwSource.description}"/></textarea>
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>所属系统：</label></td>
                    <td class="formElem lessTen">
						<huatek:select name="fwSystem" dataList="${systemList}" value="${fwSource.fwSystem.id}" textMethod="getName" valueMethod="getId"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

	<div class="editePageBtn">
	    	<ul>
	            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('fwSource');postDataByFormName('fwSource','workspace');}"/></li>
	            <li><input type="button" value="取消" class="buttonCls" onclick="getData('source.do?actionMethod=query','','workspace');"/></li>
	            <div class="clear"></div>
	        </ul>
	        <div class="clear"></div>
	  </div>
</div>
</form:form>