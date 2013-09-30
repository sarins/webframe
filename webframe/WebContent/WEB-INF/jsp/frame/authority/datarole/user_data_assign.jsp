<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_account_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="account" id="account" cssClass="niceform" name="ec">
<div class="widget">
	<div class="widgetTitle">
    	<span class="widgetTitleIco">分配数据权限</span>
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
<div class="grid">
	<table id="tb_sys_account_table_list">
	    <thead>
		<tr>
			<th>请选择</th>
			<th>数据角色名称</th>
			<th>状态</th>
	        <th>描述</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="dataRole" items="${efwUserDataList}" varStatus="s">
			<tr class="gradeX">
				<td>
				<input type="checkbox"  name="boxId" id="boxId"  value="${dataRole.id}"
				 <c:forEach var="userDataList" items="${allUserDataList}">
				   <c:if test="${userDataList.efwDataRole.id==dataRole.id}">
				   	checked
				   </c:if>
			   </c:forEach>></td>
				<td><c:out value="${dataRole.daName}"/></td>
				<td><huatek:dicOut category="status" value="${dataRole.status}"/>
				</td>
				<td><div title="${dataRole.description}"><huatek:out value="${dataRole.description}" size="20" encode="true"/></div></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="saveData();"/></li>
            <li><input type="button" value="返回" class="buttonCls" onclick="getData('user.do?actionMethod=query','','workspace');"/></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>
<script language="javascript">
function saveData(){
	var chk_value =[];
	$('input[name="boxId"]:checked').each(function(){
	chk_value.push($(this).val());
	});
	var ids=${account.id};
	var i=0;
	var idStr='';
	for(i=0;i<chk_value.length;i++)
	{
		idStr=idStr+chk_value[i]+';';
	}
	//alert(idStr);
	postDataByURL('userDataRole.do?actionMethod=assign','id='+ids+'&boxId='+idStr,'workspace');

}
</script>