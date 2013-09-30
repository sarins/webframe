<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_interiorLoan_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">集团内部借款审核提交列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="interiorLoan" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
		</div>
   	 	<div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize" id="tb_interiorLoan_table_list">
            <thead>
               <tr>
				<th>序号</th>
				<th>借款人</th>
				<Th>借款金额(万元)</th>
				<th>合同利率(%)</th>
				<th>实际利率(%)</th>
				<th>财务顾问费(万元)</th>
				<th>起息日</th>
				<th>到期日</th>
				<th>还款周期</th>
				<th>编制人</th>
				<th>编制状态</th>
				<th>分管领导</th>
				<th>分管领导审核状态</th>
				<th>操作</th>

			</tr>
            </thead>
            <tbody>
               <c:forEach var="interiorLoan" items="${pageBean.dataList}" varStatus="s">
				<tr class="gradeX">
					<td>
						<c:out value="${s.index+1}"/>
					</td>
					<td><c:out value="${interiorLoan.loanUser}"/></td>
					<td>
						<div style="text-align:right;"><fmt:formatNumber value="${interiorLoan.loanMoney}" type="number" pattern="#,##0.00" />
						</div>
					</td>
					<td><c:out value="${interiorLoan.contractRates}"/>%</td>
					<td><c:out value="${interiorLoan.realRates}"/>%</td>
					<td><div style="text-align:right;"><fmt:formatNumber value="${interiorLoan.adviserCost}" type="number" pattern="#,##0.00" />
						</div>
					</td>
					<td><fmt:formatDate value="${interiorLoan.startRateDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${interiorLoan.endRateDate}" pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${interiorLoan.repayPeriod  eq '365'}">365</c:if>
						<c:if test="${interiorLoan.repayPeriod  eq '360'}">360</c:if>
					</td>
					<td><c:out value="${interiorLoan.transactUser}"/></td>
					<td>
						<c:if test="${interiorLoan.forState  eq '0'}">未完成</c:if>
						<c:if test="${interiorLoan.forState  eq '1'}">已完成</c:if>
					</td>
					<td><c:out value="${interiorLoan.mgLeaderUserName}"/></td>
					<td>
						<c:if test="${interiorLoan.leaderAuditState  eq '0'}">未审核</c:if>
						<c:if test="${interiorLoan.leaderAuditState  eq '1'}">已审核</c:if>
						<c:if test="${interiorLoan.leaderAuditState  eq '2'}">驳回</c:if>
					</td>
					<td>
						<a href="#"  onclick="getData('orgInner.do?actionMethod=audit&interiorId=${interiorLoan.id}','','workspace');">审核预览</a>
					</td>

			 </tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
    <div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="interiorLoan" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
		</div>
        <div class="clear"></div>
    </div>
 </div>