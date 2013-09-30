<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.huatek.fos.homepage.entity.hibernate.FusionCharts" %>
<script language="JavaScript" src="${ht_globalUrl}/js/FusionCharts.js"></script>
<c:set var="currentGridId" value="home_page_list_4"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="entrustLoan" name="entrustLoan" onsubmit="return false">
<div class="welcomeRight">
        <div class="gridInfo">
            <div class="gridToolbar">
                <div class="gridHeaderName">委贷预警</div>
                <div class="gridPageBtn">
					<huatek:ajaxCutPage pageBean="${pageBean}" formName="entrustLoan" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
				</div>
				<div class="clear"></div>
			</div>
            <div class="grid" style="height:197px;">
                <table width="100%" class="resize" id="home_page_list_4">
                    <thead>
                        <tr>
                            <th>借款人</th>
                            <th>贷款金额(万元)</th>
                            <th>合同利率(%)</th>
                            <th>起息日</th>
                            <th>结息日</th>
                            <th>委托代理银行</th>
                            <th>付息方式</th>
                            <th>贷款状态</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="entrustLoan" items="${pageBean.dataList}" varStatus="s">
	                        <tr class="gradeX">
	                            <td><a href="#" onclick="viewDetail('${entrustLoan.id}');" title="查看详情"><c:out value="${entrustLoan.loanUser}"/></a></td>
	                            <td><div style="text-align:right;"><fmt:formatNumber value="${entrustLoan.loanMoney}" type="number" pattern="#,##0.00" /></div>
								</td>
	                            <td><c:out value="${entrustLoan.contractRates}"/></td>
	                            <td><fmt:formatDate value="${entrustLoan.startRateDate}" pattern="yyyy-MM-dd" /></td>
	                            <td><fmt:formatDate value="${entrustLoan.endRateDate}" pattern="yyyy-MM-dd" /></td>
	                            <td><c:out value="${entrustLoan.loanBank}"/></td>
	                            <td>
	                            	<c:if test="${entrustLoan.endInterestMode  eq '1'}">月结</c:if>
									<c:if test="${entrustLoan.endInterestMode  eq '2'}">季结</c:if>
								</td>
	                            <td><huatek:dicOut category="loanStatus" value="${entrustLoan.loanStatus}"/></td>
	                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
		    <div class="gridToolbar">
		       
		    </div>
        </div>
</div>
</form:form>
<script type="text/javascript">
function viewDetail(entrustLoanId){
	$.dialog( {
		id: entrustLoanId,
		title : '查看详情列表',
		content : 'url:homePage.do?actionMethod=viewDetail&entrustLoanId=' + entrustLoanId,
		width : 800,
		height : 520,
		lock : true
	});
}
</script>

