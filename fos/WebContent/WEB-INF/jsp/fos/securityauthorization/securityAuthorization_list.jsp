<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_security_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">担保授信列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="securityAuthorization" offerPageSize="20,50,100" isExistForm="true" isOuterForm="true" queryFunction="queryData();"/>
	</div>
        <div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize" id="tb_security_table_list">
            <thead>
                <tr>
				<th>序号</th>
				<th>事项分类</th>
				<th>事项名称</th>
				<th>提取类别</th>
				<th>合同金额(万元)</th>
				<th>担保金额(万元)</th>
				<th>起始日期</th>
				<th>截止日期</th>
				<th>事项状态</th>
				<th>审批情况</th>
				<th>事项概述</th>
				<th>备注</th>
				<th>操作</th>
			</tr>
            </thead>
            <tbody>
                <c:forEach var="securityAuthories" items="${pageBean.dataList}" varStatus="s">
				<tr <c:if test="${!(s.index%2==0) }"> class="tdbgcolor"</c:if>>
					<td align="center">
						<c:out value="${s.index+1}"/>
					</td>
					<td>
						<c:if test="${securityAuthories.categoryType eq '1'}">政府担保</c:if>
						<c:if test="${securityAuthories.categoryType eq '2'}">商业担保</c:if>
						<c:if test="${securityAuthories.categoryType eq '3'}">其他</c:if>
					</td>
					<td><c:out value="${securityAuthories.eventName}"/></td>
					<td>
						<c:if test="${securityAuthories.drawType eq '1'}">已提</c:if>
						<c:if test="${securityAuthories.drawType eq '2'}">未提</c:if>
					</td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${securityAuthories.contractMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><div style="text-align:right;">
					<fmt:formatNumber value="${securityAuthories.securityMoney}" type="number" pattern="#,##0.00" />
					</div></td>
					<td><fmt:formatDate value="${securityAuthories.eventInitialDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${securityAuthories.eventEndDate}" pattern="yyyy-MM-dd" /></td>
					<td>
						<c:if test="${securityAuthories.eventStatus eq '1'}">已到期偿还</c:if>
						<c:if test="${securityAuthories.eventStatus eq '2'}">正常</c:if>
					</td>
					<td>
						<div title="${securityAuthories.approveCondition}"><huatek:out value="${securityAuthories.approveCondition}" size="20" encode="true"/></div>
					</td>
					<td>
						<div title="${securityAuthories.eventSummary}"><huatek:out value="${securityAuthories.eventSummary}" size="20" encode="true"/></div>
					</td>
					<td>
						<div title="${securityAuthories.remarks}"><huatek:out value="${securityAuthories.remarks}" size="20" encode="true"/></div>
					</td>
					<td><a href="#"  onclick="getData('securityAuthorization.do?actionMethod=editQuery&securityAuthoryId=${securityAuthories.id}','','workspace');">修改</a>
					<c:if test="${superQuery != 'true'}">&nbsp;<a href="#"  onclick="deleteData('${securityAuthories.id}');">删除</a>
					</c:if>
					</td>
			 </tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
    <div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" formName="securityAuthorization" offerPageSize="20,50,100" isExistForm="true" queryFunction="queryData();"/>
		</div>
        <div class="clear"></div>
    </div>
    </div>