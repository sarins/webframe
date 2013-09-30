<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_entrustLoan_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">委托贷款明细列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="entrustLoan" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
		</div>
   	 	<div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize" id="tb_entrustLoan_table_list">
            <thead>
               <tr>
				<th>序号</th>
				<th>借款人</th>
				<th>贷款金额(万元)</th>
				<th>贷款状态</th>
				<th>合同利率(%)</th>
				<th>实际利率(%)</th>
				<th>财务顾问费(万元)</th>
				<th>起息日</th>
				<th>结息日</th>
				<th>还款周期</th>
				<th>期限(月)</th>
				<th>计提天数(天)</th>
				<th>利息收入(万元)</th>
				<th>结息日期</th>
				<th>代理银行</th>
				<th>付息方式</th>
				<th>付息明细</th>
				<c:if test="${superQuery != 'true'}">
				<th>操作</th>
				</c:if>
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
					<td>
						<c:if test="${entrustLoan.replyPeriod  eq '360'}">360</c:if>
						<c:if test="${entrustLoan.replyPeriod  eq '365'}">365</c:if>
					</td>
					<td><c:out value="${entrustLoan.timeLimit}"/></td>
					<td><c:out value="${entrustLoan.provisionDays}"/></td>
					<td><div style="text-align:right;"><fmt:formatNumber value="${entrustLoan.interestIncome}" type="number" pattern="#,##0.00" />
						</div>
					</td>
					<td><c:out value="${entrustLoan.endInterestDate}"/>日</td>
					<td><c:out value="${entrustLoan.loanBank}"/></td>
					<td>
						<c:if test="${entrustLoan.endInterestMode  eq '1'}">月结</c:if>
						<c:if test="${entrustLoan.endInterestMode  eq '2'}">季结</c:if>
						<c:if test="${entrustLoan.endInterestMode  eq '3'}">年结</c:if>
					</td>
					<td><a href="#" onclick="payInterestDetail('${entrustLoan.id}','${entrustLoan.endInterestMode}');">付息明细</a>
					</td>
					<c:if test="${superQuery != 'true'}">
					<td>
					<c:if test="${entrustLoan.isModify == '1'}">
						<a href="#"  onclick="getData('entrustLoan.do?actionMethod=editQuery&entrustLoanId=${entrustLoan.id}','','workspace');">修改</a>
						<a href="#"  onclick="deleteData('${entrustLoan.id}');">删除</a>
						</c:if>
					</td>
					</c:if>
			 </tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
    <div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="entrustLoan" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
		</div>
        <div class="clear"></div>
    </div>
 </div>