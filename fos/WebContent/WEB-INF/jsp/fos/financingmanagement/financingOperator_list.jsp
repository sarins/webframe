<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_financingDetail_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">融资/授信列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="financingDetail" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
		</div>
   	 	<div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize" id="tb_financingDetail_table_list">
            <thead>
               <tr>
				<th>序号</th>
				<th>机构</th>
				<Th>信息类别</th>
				<th>合同编号</th>
				<th>机构种类</th>
				<th>融资种类</th>
				<th>融资金额(万元)</th>
				<th>融资用途</th>
				<th>起始日</th>
				<th>截止日</th>
				<th>实际截止日期</th>
				<th>融资期限(月)</th>
				<th>结息日</th>
				<th>利率(%)</th>
				<th>利率调整方式</th>
				<th>结算方式</th>
				<th>还款周期</th>
				<th>是否提前还款</th>
				<th>提前还款日期</th>
				<th>担保/抵押方式</th>
				<th>备注</th>
				<th>查看历史</th>
				<th>付息明细</th>
				<th>操作</th>
			</tr>
            </thead>
            <tbody>
               <c:forEach var="financingDetail" items="${pageBean.dataList}" varStatus="s">
				<tr class="gradeX">
					<td>
						<c:out value="${s.index+1}"/>
					</td>
					<td><c:out value="${financingDetail.mecName}"/></td>
					<td>
						<c:if test="${financingDetail.infoCategory eq '1'}">融资</c:if>
						<c:if test="${financingDetail.infoCategory eq '2'}">授信</c:if>
					</td>
					<td><c:out value="${financingDetail.contactNumber}"/></td>
					<td>
						<c:if test="${financingDetail.mecCategory eq '1'}">银行</c:if>
						<c:if test="${financingDetail.mecCategory eq '2'}">信托</c:if>
						<c:if test="${financingDetail.mecCategory eq '3'}">券商</c:if>
					</td>
					<td>
						<c:out value="${financingDetail.financingCategory}"/>
					<td>
						<div style="text-align:right;">
							<fmt:formatNumber value="${financingDetail.financingMoney}" type="number" pattern="#,##0.00" />
						</div>
					</td>
					<td><c:out value="${financingDetail.use}"/></td>
					<td><fmt:formatDate value="${financingDetail.startDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${financingDetail.endDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${financingDetail.realEndDate}" pattern="yyyy-MM-dd" /></td>
					<td><c:out value="${financingDetail.timeLimit}"/></td>
					<td><c:out value="${financingDetail.endIntDate}"/>日</td>
					<td><c:out value="${financingDetail.interestRate}"/>%</td>
					<td><c:out value="${financingDetail.rateAdjustMode}"/></td>
					<td>
						<c:if test="${financingDetail.endIntMode  eq '1'}">月结</c:if>
						<c:if test="${financingDetail.endIntMode  eq '2'}">季结</c:if>
						<c:if test="${financingDetail.endIntMode  eq '3'}">年结</c:if>
					</td>
					<td>
						<c:if test="${financingDetail.replyPeriod  eq '360'}">360</c:if>
						<c:if test="${financingDetail.replyPeriod  eq '365'}">365</c:if>
					</td>
					<td>
						<c:if test="${financingDetail.isAdvanceReply  eq '1'}">是</c:if>
						<c:if test="${financingDetail.isAdvanceReply  eq '2'}">否</c:if>
					</td>
					<td><fmt:formatDate value="${financingDetail.earlyReplyDate}" pattern="yyyy-MM-dd" /></td>
					<td><c:out value="${financingDetail.mortMode}"/></td>
					<td>
						<div title="${financingDetail.remark}"><huatek:out value="${financingDetail.remark}" size="20" encode="true"/></div>
					</td>
					<td>
						<c:if test="${financingDetail.isNewest eq '1' && financingDetail.originalId ne financingDetail.id}">
							<a href="#"  onclick="viewHistory('${financingDetail.id}');">查看历史</a>
						</c:if>
					</td>
					<td>
						<a href="#"  onclick="payInterestDetail('${financingDetail.id}','${financingDetail.endIntMode}');">付息明细</a>
					</td>
					<td>
					<c:if test="${financingDetail.isNewest eq '1'}">
						<a href="#"  onclick="getData('financing.do?actionMethod=editQuery&financingId=${financingDetail.id}','','workspace');">修改</a>
					</c:if>
					<c:if test="${superQuery != 'true'}">
					<a href="#"  onclick="deleteData('${financingDetail.id}','${financingDetail.originalId}');">删除</a>
					</c:if>
					</td>

			 </tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
    <div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="financingDetail" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
		</div>
        <div class="clear"></div>
    </div>
 </div>
