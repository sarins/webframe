<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="fwAccount" name="fwAccount" onsubmit="return false">
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">
    	<huatek:decode result="${fwAccount.id == null}" firstValue="新增用户" secondValue="修改用户"/>
    	</span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="userForm.acctName.displayName"/>：</label></td>
                    <td class="formElem lessTen"><input type="text" class="inText" name="acctName" value="<c:out value="${fwAccount.acctName}"/>"/></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="userForm.userName.displayName"/>：</label></td>
                    <td class="formElem lessTen"><input type="text" class="inText" name="userName" value="<c:out value="${fwAccount.userName}"/>"/></td>
                </tr>
                <tr>

					<td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="userForm.fwGroup.displayName"/>：</label></td>
					<td class="formElem lessTen">
						<huatek:select name="fwGroup" dataList="${groupList}" value="${fwAccount.fwGroup.id}" textMethod="getTabName" valueMethod="getId"/>
					</td>
				</tr>
				<!--
				<tr>
					<td class="formElem labelName"><label><span class="redmark">*</span>全称：</label></td>
					<td class="formElem lessTen">
						<input type="text" class="inText" name="fullName" value="<c:out value="${fwAccount.fullName}"/>"/>
					</td>
				</tr>
				-->
				<tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="userForm.position.displayName"/>：</label></td>
                    <td class="formElem lessTen">
                    	<huatek:radio name="position" category="position" value="${fwAccount.position}" />
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span><spring:message code="userForm.status.displayName"/>：</label></td>
                    <td class="formElem lessTen">
                    	<huatek:radio name="status" category="status" value="${fwAccount.status}" />
                    </td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><spring:message code="userForm.describe.displayName"/>：</label></td>
                    <td class="formElem lessTen"><textarea name="describe"><c:out value="${fwAccount.describe}"/></textarea></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('fwAccount');postDataByFormName('fwAccount','workspace');}"/></li>
            <li><input type="button" value="取消" class="buttonCls" onclick="getData('user.do?actionMethod=query','','workspace');"/></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>
