<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page import="com.huatek.fos.homepage.entity.hibernate.FusionCharts" %>
<script language="JavaScript" src="${ht_globalUrl}/js/FusionCharts.js"></script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
		$('#home_page_list_1,#home_page_list_2,#home_page_list_3').dataTable({
			"bPaginate": false, //翻页功能
			"bLengthChange": false, //改变每页显示数据数量
			"bFilter": false, //过滤功能
			"bSort": false, //排序功能
			"bInfo": false,//页脚信息
			"bAutoWidth": true,//自动宽度
			"oLanguage":{
			    "sZeroRecords": "查询不到任何相关数据"
			}
		});
	});
</script>
<script type="text/javascript" charset="utf-8">
	$("document").ready(function(){
		queryData();
	});
	function queryData(){
		postDataByURL('homePage.do?actionMethod=queryEntrustLoan',$('#entrustLoan').serialize(),'resultList');
	}
</script>
<script type="text/javascript">
	function showStacked3DChartdiv(){
		var chart = new FusionCharts("charts/FCF_StackedColumn3D.swf", "myChartId", "1280", "400");
	   	chart.setDataXML("${strBuffer}");
	   	chart.render("stacked3DChartdiv");
	}
	showStacked3DChartdiv();
</script>

<body>
<div class="welcomeBody">
	<div class="welcomeLeft">
		<div class="gridInfo">
			<div class="gridToolbar">
				<div class="gridHeaderName">资产信息</div>
				<div class="clear"></div>
			</div>
			<div class="grid" style="border-bottom: 1px solid #D5D5D5;">
				<table width="100%" class="resize" id="home_page_list_1">
					<thead>
                        <tr>
                            <th colspan="4">资产负债信息</th>
                        </tr>
                        <tr>
                            <th>资产总计(万元)</th>
							<th>负债合计(万元)</th>
							<th>资产负债率(%)</th>
                            <th>统计时间</th>
                        </tr>
					</thead>
					<tbody>
					<c:if test="${assetDebt.id != null}">
						<tr class="gradeX">
                        	<td>
                        		<div style="text-align:right;">
									<fmt:formatNumber value="${assetDebt.assetAmount}" type="number" pattern="#,##0.00" />
								</div>
							</td>
							<td>
								<div style="text-align:right;">
									<fmt:formatNumber value="${assetDebt.debtToatl}" type="number" pattern="#,##0.00" />
								</div>
							</td>
							<td><c:out value="${assetDebt.debtRatio}"/></td>
                            <td><fmt:formatDate value="${assetDebt.endDate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:if>
					</tbody>
				</table>
				<table width="100%" class="resize" id="home_page_list_2">
					<thead>
                        <tr>
                            <th colspan="4">年度融资信息</th>
                        </tr>
                        <tr>
							<th>有效融资总额(万元)</th>
							<th>年度计划融资总额(万元)</th>
                            <th>起始日期</th>
                            <th>截止日期</th>
                        </tr>
					</thead>
					<tbody>
					<c:if test="${assetInfomation.budgetMoney != null}">
						<tr class="gradeX">
							<td><div style="text-align:right;">
									<fmt:formatNumber value="${assetInfomation.financAmunt}" type="number" pattern="#,##0.00" />
								</div></td>
							<td><div style="text-align:right;">
									<fmt:formatNumber value="${assetInfomation.budgetMoney}" type="number" pattern="#,##0.00" />
								</div></td>
							<td><fmt:formatDate value="${assetInfomation.startDate}" pattern="yyyy-MM-dd" /></td>
                            <td><fmt:formatDate value="${assetInfomation.endDate}" pattern="yyyy-MM-dd" /></td>
						</tr>
						</c:if>
					</tbody>
				</table>
              <table width="100%" class="resize" id="home_page_list_3">
					<thead>
                        <tr>
                            <th colspan="4">年度担保信息</th>
                        </tr>
                        <tr>
							<th>有效担保总额(万元)</th>
							<th>年度计划担保总额(万元)</th>
                            <th>起始日期</th>
                            <th>截止日期</th>
                        </tr>
					</thead>
					<tbody>
					<c:if test="${assetInfomationSecurty.budgetMoney != null}">
						<tr class="gradeX">
							<td><div style="text-align:right;">
									<fmt:formatNumber value="${assetInfomationSecurty.sercurtyAmunt}" type="number" pattern="#,##0.00" />
								</div></td>
							<td><div style="text-align:right;">
									<fmt:formatNumber value="${assetInfomationSecurty.budgetMoney}" type="number" pattern="#,##0.00" />
								</div></td>
							<td><fmt:formatDate value="${assetInfomationSecurty.startDate}" pattern="yyyy-MM-dd" /></td>
                            <td><fmt:formatDate value="${assetInfomationSecurty.endDate}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div id="resultList">
	</div>
</div>
<div class="clear"></div>
<div class="gridInfo" style="border-bottom: 1px solid #D5D5D5;margin:10px 5px;">
    <div class="gridToolbar">
        <div class="gridHeaderName">集中还款预警</div>
        <div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize">
            <tr>
                <td width="100%">
                    <div id="stacked3DChartdiv" style="float:left;">
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>

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

