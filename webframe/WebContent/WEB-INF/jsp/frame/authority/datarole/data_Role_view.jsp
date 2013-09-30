<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek"  uri="http://www.huatek.com/j2ee" %>
<script type="text/javascript">
Ext.onReady(function(){
	  Ext.state.Manager.setProvider(new Ext.state.CookieProvider({}));
	  var grid1 = new Ext.grid.TableGrid1("tb1_acct_edit_checked_table_${last_module_id}",{remove:false});
	  $(".x-grid3-scroller").css("height","auto");
		$(".x-grid3-scroller").css("padding-bottom","25px");
		$(".x-grid3").css("height","auto");
		$(".x-grid3-header-inner").css("height","auto");
		$(".x-panel-body-noheader").css("height","auto");
		$(".x-grid-panel").css("height","auto");
	});
</script>
<form name="efwDataRoleAuthority" id="efwDataRoleAuthority" method="post" action="">
<input type="hidden" name="acctId" value="<c:out value="${account.id}"/>"/>
当前&nbsp;<b>数据角色：<c:out value="${efwDataRole.daName}"/></b>

<div class="widget">
<div class="head"><h5 class="iDropper">已分配数据权限</h5>
<table border="0" cellspacing="0" cellpadding="0" align="right" style="padding:4px 5px 4px 0;">
        <tbody>
            <tr>
                <td>
                	<!--<input class="seaBtn" type="button" value="保存" onclick="jqchk()">&nbsp;&nbsp;
					-->
					<input class="seaBtn" type="button" value="返回" onclick="getData('efwDataRole.do?actionMethod=query','','workspace');">
                </td>
            </tr>
        </tbody>
    </table>
</div>
<div id="tableBody1">
<table width="98.5%" id="tb1_acct_edit_checked_table_${last_module_id}">
    <thead>
	<tr><th>一级菜单名称</th>
		<th>二级菜单名称</th>
		<th>实体名称</th>
        <th>字段名称</th>

	</tr>
	</thead>
	<tbody>
	<c:forEach var="role" items="${efwDataRoleAuthorityList}" varStatus="s">
	<tr <c:if test="${!(s.index%2==0) }"> class="tdbgcolor"</c:if>>
		<td><c:out value="${role.efwBusinessModule.description}"/></td>
		<td>
			<c:out value="${role.efwBusinessModule.name}"/>
		</td>
		<td>
			<c:out value="${role.efwSourceEntity.entityName}"/>
		</td>
		<td>
			<c:out value="${role.fieldName}"/>
		</td>
	</tr>
	</c:forEach>
	</tbody>
</table>
</div>
</div>
</form>
<script language="javascript">
	function queryData(){
		var dataStr = $('#fwAccountDuty').serialize();
		postDataByURL('user.do?actionMethod=queryData&id=${account.id}',dataStr,'workspace');
	}
</script>
