<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<form:form modelAttribute="fwAccount" onsubmit="return false">
<input type="hidden" name="id" value="${LoginAccount.id}">
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">修改密码</span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
            	<tr>
					<td class="formElem labelName"><label><span class="redmark">*</span>原密码：</label></td>
					<td class="formElem lessTen"><form:password path="acctPwd" cssClass="inText"/></td>
				</tr>
				<tr>
					<td class="formElem labelName"><label><span class="redmark">*</span>新密码：</label></td>
					<td class="formElem lessTen"><form:password path="newPwd" cssClass="inText"/></td>
				</tr>
				<tr>
					<td class="formElem labelName"><label><span class="redmark">*</span>新密码确认：</label></td>
					<td class="formElem lessTen"><form:password path="comfirmPwd" cssClass="inText"/></td>
				</tr>
			</tbody>
        </table>
    </div>
    <div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){trimForm('fwAccount');postDataByFormName('fwAccount','workspace');}"/></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>
