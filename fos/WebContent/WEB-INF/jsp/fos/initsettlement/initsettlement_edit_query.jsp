<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form:form modelAttribute="initSettlement" cssClass="niceform" name="ec" onsubmit="return false">
<div class="widget">
	<div class="widgetTitle"><span class="widgetTitleIco"><c:if
		test="${initSettlement.id == null}">新增期初结转资金</c:if><c:if
		test="${initSettlement.id != null}">修改期初结转资金</c:if></span>
	</div>
	<div class="widgetContainer">
	<table class="formInfo">
		<tbody>
			<tr>
				<td class="formElem labelName"><label><span class="redmark">*</span>类型分类：</label></td>
				<td class="formElem">
				<input type="radio" name="useType" id="useType" value="1" checked />自有资金期初结转金额
				<input type="radio" name="useType" id="useType" value="2" <c:if test="${initSettlement.useType == '2' }">checked</c:if>/>财政专户期初结转金额
				</td>

				<td class="formElem labelName">&nbsp;&nbsp;</td>
				<td class="formElem">&nbsp;&nbsp;</td>


			</tr>
			<tr>
				<td class="formElem labelName"><label><span class="redmark">*</span>统计日期：</label></td>
				<td class="formElem">
				<input id="gatherDate" name="gatherDate" type="text" class="inText Wdate" onclick="WdatePicker();" value="${initDate}" readonly="readonly" />
				</td>

				<td class="formElem labelName">&nbsp;&nbsp;</td>
				<td class="formElem">&nbsp;&nbsp;</td>

			</tr>
			<tr>
				<td class="formElem labelName"><label><span class="redmark">*</span>期初结转金额（10日内）：</label></td>
				<td class="formElem">
					 <table class="txtinfo">
                    		<tr>
                    			<td id="firstTd"><input type="text" class="inText" id="settlementMoney" name="settlementMoney" value="${initSettlement.settlementMoney }"/></td>
                    			<td style="padding-left:10px;">万元</td>
                    		</tr>
                    </table>
                </td>

                <td class="formElem labelName">&nbsp;&nbsp;</td>
				<td class="formElem">&nbsp;&nbsp;</td>

			</tr>
		</tbody>
	</table>
	</div>
	<div class="editePageBtn" style="padding-left:130px;">
		<ul>
			<li><input class="buttonCls" type="button" value="保存" onclick="saveData();"></li>
			<li><input class="buttonCls" type="button" value="清空" onclick="cleanText();"/ ></li>
		</ul>
		<div class="clear"></div>
	</div>
</div>


<div id="resultList"></div>
</form:form>
<script type="text/javascript" charset="utf-8">
$("document").ready(function() {
	var gatherDate = '<fmt:formatDate value="${initSettlement.gatherDate}" pattern="yyyy-MM-dd" />';
	if(gatherDate != ''){
		$('#gatherDate').val(gatherDate);
	}
	queryData();
});
function queryData(){
	postDataByURL('initSettlement.do?actionMethod=editQuery',$('#initSettlement').serialize(),'resultList');
}
function saveData() {
	postDataByURL('initSettlement.do?actionMethod=edit',$('#initSettlement').serialize(), 'workspace');
}

function deleteData(initSettlementId){
	if (confirm("确认删除?")) {
		postDataByURL('initSettlement.do?actionMethod=delete&initSettlementid='+initSettlementId,$('#initSettlement').serialize(),'workspace');
	}
}
function cleanText(){
	document.getElementById('useType').checked='checked';
	document.getElementById('gatherDate').value='';
	document.getElementById('settlementMoney').value='';
}
</script>