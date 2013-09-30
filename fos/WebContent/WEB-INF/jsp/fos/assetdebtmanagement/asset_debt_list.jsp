<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_assetDebt_table_list"></c:set>
<%@ include file="/init_script.jsp" %>

<form:form modelAttribute="assetDebt" name="assetDebt" onsubmit="return false">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
        <table class="formInfo">
        	<tbody>
				<tr>
					 <td class="formElem labelName"><label>起始日期：</label></td>
                     <td class="formElem"><input type="text" class="inText Wdate" onclick="WdatePicker();" name="ht_t.startDate" id="ht_t_startDate" value="${t_startDate}" readonly="readonly" /></td>
                	 <td class="formElem labelName"><label>截至日期：</label></td>
                     <td class="formElem"><input type="text" class="inText Wdate" onclick="WdatePicker();" name="ht_t.endDate" id="ht_t_endDate" value="${t_endDate}"  readonly="readonly" /></td>
                </tr>	  
            </tbody>
        </table>
    </div>
   <div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
            	<tr>
                	<td><input type="button" value="查询" class="buttonCls" onclick="trimForm('assetDebt');postDataByFormName('assetDebt','workspace')"/></td>
                    <td><input type="button" value="清空" class="buttonCls" onclick="cleanText();"/></td>
                </tr>
            </tbody>
        </table>
    </div>
	<div class="clear"></div>
</fieldset>
<!-- 查询条件区域 End-->

<!-- 编辑按钮区域 Start-->
<div class="operationTool">
	<ul>
    	<li><a title="资产负债信息导入" onclick="uploadDialog()" href="#">资产负债信息导入</a>
		</li>
    </ul>
    <div class="clear"></div>
</div>
<!-- 编辑按钮区域 End-->


<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">资产负债列表</div>
        <div class="gridPageBtn">
			<huatek:ajaxCutPage pageBean="${pageBean}" formName="assetDebt" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
   	 	<div class="clear"></div>
    </div>
    <div class="grid">
        <table width="100%" class="resize"  id="tb_assetDebt_table_list">
            <thead>
               <tr>
            	<th>序号</th>
				<th>资产合计</th>
				<th>负债总计</th>
	       	 	<th>负债率</th>
				<th>起始时间</th>
	        	<th>截至时间</th>
	        	<th>操作</th>
			</tr>
            </thead>
            <tbody>
               <c:forEach var="assetDebt" items="${pageBean.dataList}" varStatus="s">
				<tr class="gradeX">
					<td>
						<c:out value="${s.index+1}"/>
					</td>
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
					<td><fmt:formatDate value="${assetDebt.startDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${assetDebt.endDate}" pattern="yyyy-MM-dd" /></td>
					<td><a href="#"  onclick="deleteData('${assetDebt.id}');">删除</a></td>
				</tr>
			</c:forEach>
            </tbody>
        </table>
    </div>
   <div class="gridToolbar">
        <div class="gridPageBtn">
		<huatek:ajaxCutPage pageBean="${pageBean}" isOuterForm="true" formName="assetDebt" offerPageSize="20,50,100" isExistForm="true"/>
		</div>
        <div class="clear"></div>
    </div>
 </div>

</form:form>
<script language="javascript">
/*
清空查询条件操作
	*/
function cleanText(){
	document.getElementById('ht_t_startDate').value='';
	document.getElementById('ht_t_endDate').value='';
}

function uploadDialog(){
	$.dialog( {
		id: "assetdebt",
		title : '资产负债导入',
		content: 'url:upload.do?actionMethod=upload&from=assetDebt',
		width : 800,
		height : 520,
		lock : true
	});
}

function deleteData(assetDebtId){
	if(confirm("确定删除？")){
		postDataByURL('assetDebt.do?actionMethod=delete&id='+assetDebtId,$('#assetDebt').serialize(),'workspace');
	}
}
</script>
