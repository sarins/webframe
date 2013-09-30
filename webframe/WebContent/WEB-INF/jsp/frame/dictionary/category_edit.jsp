<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="fwCategory" name="fwCategory" onsubmit="return false">
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">
    		<huatek:decode result="${fwCategory.id == null}" firstValue="新增目录信息" secondValue="修改目录信息"/>
    	</span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>

                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>字典目录名称：</label></td>
                    <td class="formElem lessTen"><input type="text" class="inText" name="name" value="<c:out value="${fwCategory.name}"/>"/></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>字典目录编码：</label></td>
                    <td class="formElem lessTen">
	                    <c:if test="${fwCategory.id != null}">
	                    <input type="text" disabled="disabled" class="inText" name="code" value="<c:out value="${fwCategory.code}"/>"/>
	                    </c:if>
	                     <c:if test="${fwCategory.id == null}">
	                    <input type="text" class="inText" name="code" value="<c:out value="${fwCategory.code}"/>"/>
	                    </c:if>
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>所属系统：</label></td>
                    <td class="formElem lessTen">
						<huatek:select name="fwSystem" dataList="${systemList}" value="${fwCategory.fwSystem.id}" textMethod="getName" valueMethod="getId"/>
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>状态：</label></td>
                    <td class="formElem lessTen">
                    	<huatek:radio name="display" category="status" value="${fwCategory.display}"/>
                    </td>
                </tr>
                </tbody>
           </table>
     </div>
	<div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('fwCategory');postDataByFormName('fwCategory','workspace');}"/></li>
            <li><input type="button" value="返回" class="buttonCls" onclick="getData('dicCategory.do?actionMethod=query','','workspace');"/></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>