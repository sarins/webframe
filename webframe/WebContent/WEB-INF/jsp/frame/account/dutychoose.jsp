<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_user_duty_choose"></c:set>
<%@ include file="/init_script.jsp" %>
<form name="myform" id="myform" onsubmit="return false">
<input type="hidden" name="accountId" value="${account.id}">
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">分配操作权限</span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label>待分配账户名：</label></td>
                    <td class="formElem lessTen"><c:out value="${account.acctName}"/></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label>待分配用户名：</label></td>
                    <td class="formElem lessTen"><c:out value="${account.userName}"/></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="gridInfo">
		<div class="gridToolbar">
			<div class="gridHeaderName">角色信息</div>
		</div>
		<div class="clear"></div>
		<div class="grid">
		<table  id="tb_sys_user_duty_choose">
		    <thead>
			<tr>
				<th>请选择</th>
				<th>角色名称</th>
				<th>角色状态</th>
				<th>角色描述</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="duty" items="${dutyList}">
			  	<tr>
			  	<td>
			  	  <input type="checkbox" value="${duty.id}" name="dutyId"
					   <c:forEach var="accountDuty" items="${account.fwAccountDuties}">
						   <c:if test="${accountDuty.fwDuty.id==duty.id}">
						   	checked
						   </c:if>
					   </c:forEach>
					   />
			  	 </td>
				 <td><c:out value="${duty.name}"/></td>
				 <td>
				 <huatek:dicOut category="status" value="${duty.status}"/>
				 </td>
				 <td><div title="${duty.describe}"><huatek:out value="${duty.describe}" size="20" encode="true"/></div></td>
			  	</tr>
  				</c:forEach>
  			</tbody>
		</table>
		</div>
	</div>
    <div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="if(confirm('确认要保存吗？')){postDataByURL('user.do?actionMethod=assign',$('#myform').serialize(),'workspace');}"/></li>
            <li><input type="button" value="取消" class="buttonCls" onclick="getData('user.do?actionMethod=query','','workspace');"/></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form>
