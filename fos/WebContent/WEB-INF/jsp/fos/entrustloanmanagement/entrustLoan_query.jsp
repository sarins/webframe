<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form:form modelAttribute="entrustLoan" name="entrustLoan" target="_blank" action="entrustLoan.do?actionMethod=export" onsubmit="return false">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
        <table class="formInfo">
        	<tbody>
                <tr>
                	<td class="formElem labelName"><label>借款人：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="ht_t.loanUser" id="ht_t_loanUser" value="${t_loanUser}"/></td>
                    <td class="formElem labelName"><label>委托代理银行：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="ht_t.loanBank" id="ht_t_loanBank" value="${t_loanBank}"/></td>
                    <td class="formElem labelName"><label>付息方式：</label></td>
                    <td class="formElem">
					 <table class="txtinfo">
                    		<tr>
                    			<td class="firstTd">
                    			<select name="ht_t.endInterestMode" id="ht_t_endInterestMode">
									<option value="">---请选择---</option>
									<option value="1" <c:if test="${t_endInterestMode  eq '1'}">selected </c:if>>月结</option>
									<option value="2" <c:if test="${t_endInterestMode  eq '2'}">selected </c:if>>季结</option>
									<option value="3" <c:if test="${t_endInterestMode  eq '3'}">selected </c:if>>年结</option>
								</select></td>
                    			
                    		</tr>
                    </table>
               	 	</td>
                </tr>
				<tr>
					 <td class="formElem labelName"><label>起息日：</label></td>
                     <td class="formElem"><input type="text" class="inText Wdate" onclick="WdatePicker();" name="startDate" id="ht_t_startRateDate" value="${startDate}"  readonly="readonly"/></td>
                	 <td class="formElem labelName"><label>到期日：</label></td>
                     <td class="formElem"><input type="text" class="inText Wdate" onclick="WdatePicker();" name="endDate" id="ht_t_endRateDate" value="${endDate}"  readonly="readonly" /></td>
                     <td class="formElem labelName"><label><label>贷款状态：</label></label></td>
                     <td class="formElem">
					 <table class="txtinfo">
                    		<tr>
                    			<td class="firstTd">	<huatek:dicSelect name="ht_t.loanStatus" id="ht_t_loanStatus" category="loanStatus" value="${t_loanStatus}"/></td>
                    			
                    		</tr>
                    </table>
               	 	</td>
			   </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td>
			        <input type="hidden" name="superQuery" value="true"/>
			        <input type="button" value="查询" class="buttonCls" onclick="trimForm('entrustLoan');queryData()"/></td>
			    </tr>
			    <tr>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanText();"/></td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div class="operationTool">
	<ul>
    	<li><a href="javascript:;" title="查询结果导出Excel">
				<img src="${ht_globalUrl}/images/excel.jpg" width="55px" height="23px" onclick="exportExcel();"/>
			</a>
		</li>
    </ul>
    <div class="clear"></div>
</div>
<div id="resultList">
</div>
<script language="javascript">
$("document").ready(function(){
	queryData();
});
function queryData(){
	postDataByURL('entrustLoan.do?actionMethod=query',$('#entrustLoan').serialize(),'resultList');
}

function payInterestDetail(entrustLoanId,endIntMode){
	$.dialog({
		id: entrustLoanId + endIntMode,
		title : '付息明细列表',
		content: 'url:entrustLoan.do?actionMethod=payInterestDetail&entrustLoanId=' + entrustLoanId + '&endIntMode=' + endIntMode,
		width : 800,
		height : 520,
		lock : true
	});
}
function exportExcel(){
	document.entrustLoan.submit();
}

/*
清空查询条件操作
	*/
function cleanText(){
	document.getElementById('ht_t_loanUser').value='';
	document.getElementById('ht_t_loanBank').value='';

	document.getElementById('ht_t_startRateDate').value='';
	document.getElementById('ht_t_endRateDate').value='';

	document.getElementById('ht_t_endInterestMode').value='';
	document.getElementById('ht_t_loanStatus').value='';
}
</script>
</form:form>