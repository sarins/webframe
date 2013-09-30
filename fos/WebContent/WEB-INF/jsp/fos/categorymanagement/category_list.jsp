<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<c:set var="currentGridId" value="tb_sys_category_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">项目类目列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="baseProjectCategoriesForm" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
	</div>
        <div class="clear"></div>
    </div>
<div class="grid">
<table width="100%" class="resize" id="tb_sys_category_table_list">
 	<thead>
		<tr>
			<th width="60" align="center">
				<input name="checkbox5" type="checkbox" id="checkbox5" onclick="checkAll(this)"/>
			</th>
	        <th>类别编码</th>
	        <th>类别名称</th>
	        <th>上级类别</th>
	        <th>所属模块</th>
	        <th>修改</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="baseCategory" items="${pageBean.dataList}" varStatus="s">
	<tr class="gradeX" <c:if test="${!(s.index%2==0) }"> class="tdbgcolor"</c:if>>
		<td>
			<input type="checkbox" value="${baseCategory.id}" name="id" >
		</td>
		<td><c:out value="${baseCategory.proCateCode}"/></td>
		<td><c:out value="${baseCategory.proCateName}"/></td>
		<td><c:out value="${baseCategory.parent.proCateName}"/></td>
		<td>
		<c:if test="${baseCategory.moduleName eq '1'}"><c:out value="资金来源滚动计划"/></c:if>
		<c:if test="${baseCategory.moduleName eq '2'}"><c:out value="资金运用滚动计划"/></c:if>
		<c:if test="${baseCategory.moduleName eq '3'}"><c:out value="融资管理"/></c:if>
		<c:if test="${baseCategory.moduleName eq '4'}"><c:out value="集团内部借款"/></c:if>
		<c:if test="${baseCategory.moduleName eq '5'}"><c:out value="担保管理"/></c:if>
		<c:if test="${baseCategory.moduleName eq '6'}"><c:out value="创投信息"/></c:if>
		<c:if test="${baseCategory.moduleName eq '7'}"><c:out value="委托贷款"/></c:if>
		</td>
		<td><a href="#"  onclick="getData('baseProjectCategories.do?actionMethod=edit&queryId=${baseCategory.id}','','workspace');">修改</a>
		</td>
	</tr>
	</c:forEach>
	 </tbody>
</table>
</div>
 <div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="baseProjectCategoriesForm" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
		</div>
        <div class="clear"></div>
    </div>
</div>

