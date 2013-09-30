<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_funds_apply_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">资金运用计划列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="sourceUseFundsForm" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
	</div>
        <div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize" id="tb_funds_apply_table_list">
            <thead>
                <tr>
				<th>序号</th>
				<th>分类</th>
				<th>项目</th>
				<th>合计(万元)</th>
				<th>10日内(万元)</th>
				<th>日期</th>
				<th>1个月内(万元)</th>
				<th>日期</th>
				<th>2个月内(万元)</th>
				<th>3个月内(万元)</th>
				<th>6个月内(万元)</th>
				<th>6个月以上(万元)</th>
				<th>统计日期</th>
				<th>操作</th>
			</tr>
            </thead>
            <tbody>
                <c:forEach var="sourceUseFunds" items="${pageBean.dataList}" varStatus="s">
				<tr <c:if test="${!(s.index%2==0) }"> class="tdbgcolor"</c:if>>
					<td align="center">
						<c:out value="${s.index+1}"/>
					</td>
					<td><c:out value="${sourceUseFunds.firstCategory.proCateName}"/></td>
					<td><c:out value="${sourceUseFunds.projectName}"/></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.summaryMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.tenDaysMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><fmt:formatDate value="${sourceUseFunds.tenDaysDate}" pattern="yyyy-MM-dd" /></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.aMonthMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><fmt:formatDate value="${sourceUseFunds.aMonthDate}" pattern="yyyy-MM-dd" /></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.twoMonthsMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.threeMonthsMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.sixMonthsMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${sourceUseFunds.moreSixMonthsMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><fmt:formatDate value="${sourceUseFunds.gatherDate}" pattern="yyyy-MM-dd" /></td>
					<td>
					<c:if test="${sourceUseFunds.isModify == '1'}"><a href="#"  onclick="getData('fundsApply.do?actionMethod=editQuery&id=${sourceUseFunds.id}&gatherDate=${sourceUseFunds.gatherDate}','','workspace');">修改</a>
					<c:if test="${superQuery != 'true'}">&nbsp;<a href="#"  onclick="deleteData('${sourceUseFunds.id}');">删除</a>
					&nbsp;<a href="#"  onclick="getData('fundsApply.do?actionMethod=editQuery&id=${sourceUseFunds.id}&isCopy=true&gatherDate=${sourceUseFunds.gatherDate}','','workspace');">复制</a>
					</c:if>
					</c:if>
					</td>
			 </tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
    <div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" formName="sourceUseFundsForm" offerPageSize="20,50,100" isOuterForm="true" isExistForm="true" queryFunction="queryData();"/>
		</div>
        <div class="clear"></div>
    </div>
    </div>