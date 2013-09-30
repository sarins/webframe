<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script type="text/javascript" src="js/data_authority.js"></script>
<style>
.subMenu{
	display:none;
	margin:5px 0 0 15px;
}
ul.leftMenu{
	padding:5px 10px;
	border-top: 1px solid #E7E7E7;
}
ul.leftMenu li{list-style-type: circle;list-style-position: inside;}
ul.leftMenu li.firstMenu{
	padding:5px 0;
	list-style-type:none;
}
ul.leftMenu a{
	color:black;
}
#assignDataAuthority p{margin:0px;padding:10px;background-color:#fff;border:1px #e9e9e9 solid;}
.assignBody{padding:0 10px 10px;}
.supTicket{padding:5px;margin-bottom:10px;background-color:#fff;border:1px #e9e9e9 solid;}
.issueType{padding:5px 0;}
</style>
<div class="widget">
	<div class="widgetTitle">
		<span class="widgetTitleIco">分配数据权限</span>
		<div style="float:right;padding:3px;"><input type="button" value="返回" class="buttonCls" onclick="getData('efwDataRole.do?actionMethod=query', '', 'workspace');"/></div>
	</div>
	<div class="widgetContainer">
		<table class="formInfo">
			<tbody>
			  <tr>
			    <td class="formElem labelName"><label>当前数据角色名称:</label></td>
			    <td class="formElem lessTen"> <c:out value="${efwDataRole.daName }" /></td>
			  </tr>
			  </tbody>
		</table>
	</div>
	<div class="assignBody">
		<table>
			<tr>
				<td width="240" valign="top">${Menu}</td>
				<td width="100%" valign="top"><div id="assignDataAuthority"><p>请选择左边模块菜单</p></div></td>
			</tr>
		</table>
		<div class="clear"></div>
	</div>

    
</div>

<script type="text/javascript">
/*
$(document).ready(function() {
	$("#moduleList tr").click(function(){
		$("#moduleList").find("tr").each(function(){
			$(this).attr("style","background-color:;font-weight:");
			});
    	$(this).attr("style","background-color:#ccc;font-weight:normal");
	});
});
*/
$(document).ready(function(){
	$(".firstMenu").find("a:first").toggle(
			function(){$(this).parent().find(".subMenu").show();},
			function(){$(this).parent().find(".subMenu").hide();}
	);

});

</SCRIPT>