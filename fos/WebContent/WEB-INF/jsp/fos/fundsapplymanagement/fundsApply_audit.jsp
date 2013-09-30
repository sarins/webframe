<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_funds_apply_audit_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="auditReportRecordForm" name="ec" onsubmit="return false">
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
                	<td><input type="button" value="查询" class="buttonCls" onclick="trimForm('auditReportRecordForm');postDataByFormName('auditReportRecordForm','workspace')"/></td>
                    <td><input type="button" value="清空" class="buttonCls" onclick="cleanData();"/></td>
                </tr>
            </tbody>
        </table>
    </div>
<div class="clear"></div>
</fieldset>
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">报表列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="auditReportRecordForm" offerPageSize="20,50,100" isExistForm="true" isOuterForm="true"/>
	</div>
        <div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize" id="tb_funds_apply_audit_table_list">
            <thead>
                <tr>
				<th>序号</th>
				<th>统计日期</th>
				<th>报表名称</th>
				<th>编制人</th>
				<th>编制状态</th>
				<th>分管领导</th>
				<th>分管领导审核状态</th>
				<th>操作</th>
			</tr>
            </thead>
            <tbody>
                <c:forEach var="auditReportRecord" items="${pageBean.dataList}" varStatus="s">
				<tr <c:if test="${!(s.index%2==0) }"> class="tdbgcolor"</c:if>>
					<td>
						<c:out value="${s.index+1}"/>
					</td>
					<td><fmt:formatDate value="${auditReportRecord.gatherDate}" pattern="yyyy-MM-dd" /></td>
					<td>
					<c:out value="${auditReportRecord.reportsName}"/>
					</td>
					<td><c:out value="${auditReportRecord.orgUserName}"/></td>
					<td>
					<c:if test="${auditReportRecord.forState eq '0'}"><c:out value="未完成"/></c:if>
		  			<c:if test="${auditReportRecord.forState eq '1'}"><c:out value="已完成"/></c:if>
					</td>
					<td><c:out value="${auditReportRecord.mgLeaderUserName}"/></td>
					<td>
					<c:if test="${auditReportRecord.leaderAuditState eq '0'}"><c:out value="未审核"/></c:if>
		  			<c:if test="${auditReportRecord.leaderAuditState eq '1'}"><c:out value="已审核"/></c:if>
		  			<c:if test="${auditReportRecord.leaderAuditState eq '2'}"><c:out value="驳回"/></c:if>
					</td>
					<td><a href="#" onclick="getData('fundsApplyAudit.do?actionMethod=auditPreview&gatherDate=${auditReportRecord.gatherDate}&auditId=${auditReportRecord.id}&submitType=${submitType}','','workspace');">
					<c:if test="${submitType eq 'sbAudit'}">
					审核预览
					</c:if>
					<c:if test="${submitType eq 'sbReport'}">
					提交预览
					</c:if>
					</a></td>
			 </tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
    <div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" formName="auditReportRecordForm" offerPageSize="20,50,100" isExistForm="true"/>
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
	function cleanData(){
		cleanText(['startDate','endDate']);
	}
</script>