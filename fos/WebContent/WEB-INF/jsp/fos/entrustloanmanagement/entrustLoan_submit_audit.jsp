<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_entrustLoan_audit_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="entrustLoan" name="entrustLoan" >
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
        <table class="formInfo">
        	<tbody>
                <tr>
                	<td class="formElem labelName"><label>借款人：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="ht_t.loanUser" id="ht_t.loanUser" value="${t_loanUser}"/></td>
                    <td class="formElem labelName"><label>代理银行：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="ht_t.loanBank" id="ht_t.loanBank" value="${t_loanBank}"/></td>

                </tr>
				<tr>
					 <td class="formElem labelName"><label>起息日：</label></td>
                     <td class="formElem"><input type="text" class="inText Wdate" onclick="WdatePicker();" name="startDate" id="ht_t.startRateDate" value="${startDate}"  readonly="readonly" /></td>
                	 <td class="formElem labelName"><label>到期日：</label></td>
                     <td class="formElem"><input type="text" class="inText Wdate" onclick="WdatePicker();" name="endDate" id="ht_t.endRateDate" value="${endDate}"  readonly="readonly" /></td>
			   </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td>
			        <input type="button" value="查询" class="buttonCls" onclick="trimForm('entrustLoan');postDataByFormName('entrustLoan','workspace')"/></td>
			    </tr>
			    <tr>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanText();"/>
			        </td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>

<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">委托贷款审核提交列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="entrustLoan" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
   	 	<div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize" id="tb_entrustLoan_audit_table_list">
            <thead>
               <tr>
				<th>序号</th>
				<th>借款人</th>
				<Th>贷款金额(万元)</th>
				<th>贷款状态</th>
				<th>合同利率(%)</th>
				<th>实际利率(%)</th>
				<th>财务顾问费(万元)</th>
				<th>起息日</th>
				<th>结息日</th>
				<th>还款周期</th>
				<th>编制人</th>
				<th>编制状态</th>
				<th>分管领导</th>
				<th>分管领导审核状态</th>
				<th>操作</th>

			</tr>
            </thead>
            <tbody>
               <c:forEach var="entrustLoan" items="${pageBean.dataList}" varStatus="s">
				<tr class="gradeX">
					<td>
						<c:out value="${s.index+1}"/>
					</td>
					<td><c:out value="${entrustLoan.loanUser}"/></td>
					<td>
						<div style="text-align:right;"><fmt:formatNumber value="${entrustLoan.loanMoney}" type="number" pattern="#,##0.00" />
						</div>
					</td>
					<td>
						<huatek:dicOut category="loanStatus" value="${entrustLoan.loanStatus}"/>
					</td>
					<td><c:out value="${entrustLoan.contractRates}"/>%</td>
					<td><c:out value="${entrustLoan.realRates}"/>%</td>
					<td><div style="text-align:right;"><fmt:formatNumber value="${entrustLoan.adviserCost}" type="number" pattern="#,##0.00" />
						</div>
					</td>
					<td><fmt:formatDate value="${entrustLoan.startRateDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${entrustLoan.endRateDate}" pattern="yyyy-MM-dd" /></td>
					<Td>
						<c:if test="${entrustLoan.replyPeriod  eq '360'}">360</c:if>
						<c:if test="${entrustLoan.replyPeriod  eq '365'}">365</c:if>
					</Td>
					<td><c:out value="${entrustLoan.transactUser}"/></td>
					<td>
						<c:if test="${entrustLoan.forState  eq '0'}">未完成</c:if>
						<c:if test="${entrustLoan.forState  eq '1'}">已完成</c:if>
					</td>
					<td><c:out value="${entrustLoan.mgLeaderUserName}"/></td>
					<td>
						<c:if test="${entrustLoan.leaderAuditState  eq '0'}">未审核</c:if>
						<c:if test="${entrustLoan.leaderAuditState  eq '1'}">已审核</c:if>
						<c:if test="${entrustLoan.leaderAuditState  eq '2'}">驳回</c:if>
					</td>
					<td>
					<c:if test="${opType  eq 'editSubmit'}">
						<a href="#"  onclick="getData('entrustLoan.do?actionMethod=auditSubmitPreview&entrustLoanId=${entrustLoan.id}&opType=${opType}','','workspace');">提交预览</a>
						</c:if>
						<c:if test="${opType  eq 'audit'}">
						<a href="#"  onclick="getData('entrustLoan.do?actionMethod=auditSubmitPreview&entrustLoanId=${entrustLoan.id}&opType=${opType}','','workspace');">审核预览</a>
						</c:if>
					</td>

			 </tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
    <div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="entrustLoan" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
        <div class="clear"></div>
    </div>
 </div>
<script language="javascript">
$("document").ready(function(){
});
/*
清空查询条件操作
	*/
function cleanText(){
	document.getElementById('ht_t.loanUser').value='';
	document.getElementById('ht_t.loanBank').value='';

	document.getElementById('ht_t.startRateDate').value='';
	document.getElementById('ht_t.endRateDate').value='';
}
</script>
</form:form>