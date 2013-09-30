<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_funds_leader_table_list1"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="reportsDetails" name="ec" onsubmit="return false">
<fieldset><legend>查询条件</legend>
<div class="condition_left">
<table class="formInfo">
	<tbody>
		<tr>
			<td class="formElem labelName"><label>开始日期：</label></td>
			<td class="formElem"><input type="text" name="startDate" id="startDate" class="inText Wdate" onclick="WdatePicker();" value="${startDate}" readonly="readonly"/></td>
			<td class="formElem labelName"><label>截至日期：</label></td>
			<td class="formElem"><input type="text" name="endDate" id="endDate" class="inText Wdate" onclick="WdatePicker();" value="${endDate}" readonly="readonly" /></td>
		</tr>
	</tbody>
</table>
</div>
 <div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
            	<tr>
                	<td><input type="button" value="查询" class="buttonCls" onclick="trimForm('reportsDetails');postDataByFormName('reportsDetails','workspace')"/></td>
                    <td><input type="button" value="清空" class="buttonCls" onclick="cleanText();"/></td>
                </tr>
            </tbody>
        </table>
    </div>
<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
        <div class="clear"></div>
    </ul>
    <div class="clear"></div>
</div>
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">报表列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="reportsDetails" offerPageSize="20,50,100" isExistForm="true" isOuterForm="true"/>
	</div>
        <div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize" id="tb_funds_leader_table_list1">
            <thead>
                <tr>
				<th>序号</th>
				<th>统计日期</th>
				<th>资金来源</th>
				<th>资金运用</th>
				<th>所属部门</th>
			</tr>
            </thead>
            <tbody>
                <c:forEach var="reportsDetails" items="${pageBean.dataList}" varStatus="s">
				<tr <c:if test="${!(s.index%2==0) }"> class="tdbgcolor"</c:if>>
					<td>
						<c:out value="${s.index+1}"/>
					</td>
					<td><fmt:formatDate value="${reportsDetails.gatherDate}" pattern="yyyy-MM-dd" /></td>
					<td>
					<a href="#" onclick="getData('fundsOriginGather.do?actionMethod=originPreview&gatherDate=${reportsDetails.gatherDate}','','workspace');">
					<c:out value="${reportsDetails.oneReportsName}"/>
					</a>
					</td>
					<td>
					<a href="#" onclick="getData('fundsApplyGather.do?actionMethod=applyPreview&gatherDate=${reportsDetails.gatherDate}','','workspace');">
					<c:out value="${reportsDetails.towReportsName}"/>
					</a>
					</td>
					<td>
					<c:out value="${reportsDetails.group.name}"/>
					</td>
			 </tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
    <div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" formName="reportsDetails" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
        <div class="clear"></div>
    </div>
    </div>
</form:form>
<script language="javascript">
$("document").ready(function(){
});
	/*
	清空查询条件操作
		*/
	function cleanText(){
		document.getElementById('startDate').value='';
		document.getElementById('endDate').value='';
	}
</script>