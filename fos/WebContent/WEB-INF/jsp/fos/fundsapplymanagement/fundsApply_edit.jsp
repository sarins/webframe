<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form:form modelAttribute="sourceUseFundsForm" name="ec" onsubmit="return false">
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">资金运用</span>
    	<span class="toggle"><a href="javascript:;">&nbsp;</a></span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>统计日期：</label></td>
                    <td class="formElem"><input type="text" id="gatherDate" name="gatherDate"  value="${initDate}" readonly="readonly" class="inText"/></td>
                    <td class="formElem labelName"><label></label></td>
                    <td class="formElem"></td>
                    <td class="formElem labelName"><label></label></td>
                    <td class="formElem"></td>
                </tr>
                <tr>
                	<td class="formElem labelName"><label><span class="redmark">*</span>分类：</label></td>
                    <td class="formElem">
	     				<select name="firstCategory" id="firstCategory">
	     					<option value="">--请选择--</option>
							<c:forEach var="category" items="${categoriesList}">
								<option value="${category.id}"
									<c:if test="${category.id==sourceUseFunds.firstCategory.id}"> selected</c:if>>
									<c:out value="${category.proCateName}"/>
								</option>
							</c:forEach>
	     				</select>
					</td>
                    <td class="formElem labelName"><label><span class="redmark">*</span>项目：</label></td>
                    <td class="formElem"><input type="text" name="projectName" id="projectName" class="inText" value="${sourceUseFunds.projectName}" /></td>
					<td class="formElem labelName"></td>
                    <td class="formElem"></td>
                </tr>
                <tr>
                    <td class="formElem labelName"><label><span class="redmark">*</span>10日内(万元)：</label></td>
                    <td class="formElem">
                    	<input type="text" name="tenDaysMoney" id="tenDaysMoney" class="cusText" value="${sourceUseFunds.tenDaysMoney}"/><input type="text" name="tenDaysDate" id="tenDaysDate" class="cusText Wdate" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'gatherDate\',{d:1});}'})" value="<fmt:formatDate value="${sourceUseFunds.tenDaysDate}" pattern="yyyy-MM-dd" />" readonly="readonly"/>
                    </td>
                    <td class="formElem labelName"><label>1个月内(万元)：</label></td>
                    <td class="formElem">
                    	<input type="text" name="aMonthMoney" id="aMonthMoney" class="cusText" value="${sourceUseFunds.aMonthMoney}"/><input type="text" name="aMonthDate" id="aMonthDate" class="cusText Wdate" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'gatherDate\',{d:1});}'})" value="<fmt:formatDate value="${sourceUseFunds.aMonthDate}" pattern="yyyy-MM-dd" />" readonly="readonly"/>
                    </td>
                    <td class="formElem labelName"><label>2个月内(万元)：</label></td>
                    <td class="formElem">
                    	<input type="text" name="twoMonthsMoney" id="twoMonthsMoney" class="inText" value="${sourceUseFunds.twoMonthsMoney}"/>
                    </td>
                </tr>
				<tr>
                	<td class="formElem labelName"><label>3个月内(万元)：</label></td>
                    <td class="formElem">
                    	<input type="text" name="threeMonthsMoney" id="threeMonthsMoney" class="inText" value="${sourceUseFunds.threeMonthsMoney}"/>
                    </td>
                    <td class="formElem labelName"><label>6个月内(万元)：</label></td>
                    <td class="formElem">
                    	<input type="text" name="sixMonthsMoney" id="sixMonthsMoney" class="inText" value="${sourceUseFunds.sixMonthsMoney}"/>
                    </td>
                    <td class="formElem labelName"><label>6个月以上(万元)：</label></td>
                    <td class="formElem">
                    	<input type="text" name="moreSixMonthsMoney" id="moreSixMonthsMoney" class="inText" value="${sourceUseFunds.moreSixMonthsMoney}"/>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="editePageBtn">
    	<ul>
            <li><input type="button" value="保存" class="buttonCls" onclick="saveData();"/></li>
            <li><input type="button" value="清空" class="buttonCls" onclick="cleanData();"/></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
</div>
<div id="resultList">
</div>
</form:form>
<script language="javascript">
$("document").ready(function(){
	var tenDaysDate = '${sourceUseFunds.tenDaysDate}';
	var aMonthDate = '${sourceUseFunds.aMonthDate}';
	var gatherDate = '<fmt:formatDate value="${gatherDate}" pattern="yyyy-MM-dd" />';
	if(gatherDate != ''){
		$('#gatherDate').val(gatherDate);
	}
	queryData();
});
function queryData(){
	var gatherDate = $('#gatherDate').val();
	postDataByURL('fundsApply.do?actionMethod=editQuery&initDate='+gatherDate,$('#sourceUseFundsForm').serialize(),'resultList');
}
function saveData(){
	trimForm('sourceUseFundsForm');
	postDataByURL('fundsApply.do?actionMethod=edit',$('#sourceUseFundsForm').serialize(),'workspace');
}
function deleteData(sourceUseFundsId){
	postDataByURL('fundsApply.do?actionMethod=delete&id='+sourceUseFundsId,$('#sourceUseFundsForm').serialize(),'workspace');
}
	/*
	清空查询条件操作
		*/
	function cleanData(){
		cleanText(['firstCategory','projectName','tenDaysMoney','tenDaysDate','aMonthMoney','aMonthDate','twoMonthsMoney','threeMonthsMoney','sixMonthsMoney','moreSixMonthsMoney']);

	}
</script>