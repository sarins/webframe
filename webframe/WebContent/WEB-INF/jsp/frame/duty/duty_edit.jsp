<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="fwDuty" onsubmit="return false">
<input type="hidden" name="dutyType" value="1"/>
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">
    		<huatek:decode result="${fwAccount.id == null}" firstValue="新增角色" secondValue="修改角色"/>
    	</span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>角色名：</label></td>
                    <td class="formElem lessTen"><input type="text" class="inText" name="name" value="<c:out value="${fwDuty.name}"/>"/></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>是否生效：</label></td>
                    <td class="formElem lessTen">
                    	<huatek:radio name="status" category="status" value="${fwDuty.status}"/>
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label>备注：</label></td>
                    <td class="formElem lessTen"><textarea name="describe"><c:out value="${fwDuty.describe}"/></textarea></td>
                </tr>
            	</tbody>
        </table>
    </div>
 	<div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('fwDuty');postDataByFormName('fwDuty','workspace');}"/></li>
            <li><input type="button" value="取消" class="buttonCls" onclick="getData('role.do?actionMethod=query','','workspace');"/></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>