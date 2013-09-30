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
        <div class="gridHeaderName">集团内部借款明细列表</div>
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
				<th>借款金额(万元)</th>
				<th>合同利率(%)</th>
				<th>实际利率(%)</th>
				<th>财务顾问费(万元)</th>
				<th>起息日</th>
				<th>到期日</th>
				<th>还款周期</th>
				<th>期限(天)</th>
				<th>计提天数(天)</th>
				<th>利息收入(万元)</th>
				<th>结息日期</th>
				<th>代理银行</th>
				<th>付息方式</th>
				<th>借款状态</th>
				<th>是否延期</th>
				<th>延期起始日</th>
				<th>延期截至日</th>
				<th>付息明细</th>
				<c:if test="${superQuery != 'true'}">
				<th>操作</th>
				</c:if>
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
					<td><c:out value="${interiorLoan.timeLimit}"/></td>
					<td><c:out value="${interiorLoan.provisionDays}"/></td>
					<td><div style="text-align:right;"><fmt:formatNumber value="${interiorLoan.interestIncome}" type="number" pattern="#,##0.00" />
						</div>
					</td>
					<td><c:out value="${interiorLoan.endInterestDate}"/>日</td>
					<td><c:out value="${interiorLoan.loanBank}"/></td>
					<td>
						<c:if test="${interiorLoan.endInterestMode  eq '1'}">月结</c:if>
						<c:if test="${interiorLoan.endInterestMode  eq '2'}">季结</c:if>
						<c:if test="${interiorLoan.endInterestMode  eq '3'}">年结</c:if>
					</td>
					<td>
						<c:if test="${interiorLoan.loanStatus  eq '1'}">正常</c:if>
						<c:if test="${interiorLoan.loanStatus  eq '2'}">逾期还款</c:if>
						<c:if test="${interiorLoan.loanStatus  eq '3'}">续贷</c:if>
					</td>
					<td>
						<c:if test="${interiorLoan.isDelay  eq '0'}">否</c:if>
						<c:if test="${interiorLoan.isDelay  eq '1'}">是</c:if>
					</td>
					<td><fmt:formatDate value="${interiorLoan.delayStartDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${interiorLoan.delayEndDate}" pattern="yyyy-MM-dd" /></td>
					<td><a href="#" onclick="payInterestDetail('${interiorLoan.id}','${interiorLoan.endInterestMode}');">付息明细</a>
					</td>
					<c:if test="${superQuery != 'true'}">
					<td><c:if test="${interiorLoan.isModify == '1'}">
						<a href="#"  onclick="getData('orgInner.do?actionMethod=editQuery&interiorId=${interiorLoan.id}','','workspace');">修改</a>
						<a href="#"  onclick="deleteData('${interiorLoan.id}');">删除</a>
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
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="interiorLoan" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
		</div>
        <div class="clear"></div>
    </div>
 </div>