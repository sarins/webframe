<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form:form modelAttribute="interiorLoan" name="interiorLoan" onsubmit="return false">
<fieldset>
	<legend>查询条件</legend>
    <div class="condition_left">
        <table class="formInfo">
        	<tbody>
                <tr>
                	<td class="formElem labelName"><label>借款人：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="ht_t.loanUser" id="ht_t_loanUser" value="${t_loanUser}"/></td>
                    <td class="formElem labelName"><label>代理银行：</label></td>
                    <td class="formElem"><input type="text" class="inText" name="ht_t.loanBank" id="ht_t_loanBank" value="${t_loanBank}"/></td>
                </tr>
				<tr>
					 <td class="formElem labelName"><label>起息日：</label></td>
                     <td class="formElem"><input type="text" class="inText Wdate" onclick="WdatePicker();" name="startDate" id="ht_t_startRateDate" value="${startDate}" readonly="readonly"/></td>
                	 <td class="formElem labelName"><label>到期日：</label></td>
                     <td class="formElem"><input type="text" class="inText Wdate" onclick="WdatePicker();" name="endDate" id="ht_t_endRateDate" value="${endDate}" readonly="readonly"/></td>
			   </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_right">
    	<table class="conditionBtn">
        	<tbody>
			    <tr>
			        <td>
			        <input type="button" value="查询" class="buttonCls" onclick="trimForm('interiorLoan');postDataByFormName('interiorLoan','resultList')"/></td>
			    </tr>
			    <tr>
			        <td><input type="button" value="清空" class="buttonCls" onclick="cleanData();"/>
			        
			        	<input type="hidden" name="type" value="<c:out value="${type}"/>" >
			        </td>
			    </tr>
		    </tbody>
		</table>
	</div>
	<div class="clear"></div>
</fieldset>
<div id="resultList">
</div>
<script language="javascript">
$("document").ready(function(){
	queryData();
});
function queryData(){
	postDataByURL('orgInner.do?actionMethod=queryAudit',$('#interiorLoan').serialize(),'resultList');
}
/*
清空查询条件操作
	*/
function cleanData(){
	document.getElementById('ht_t_loanUser').value='';
	document.getElementById('ht_t_loanBank').value='';
	
	document.getElementById('ht_t_startRateDate').value='';
	document.getElementById('ht_t_endRateDate').value='';
}
</script>
</form:form>