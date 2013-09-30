<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_security_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="securityAuthorization" name="securityAuthorization" target="_blank" action="securityAuthorization.do?actionMethod=export" onsubmit="return false">
<fieldset>
	<legend>担保查询</legend>
    <div class="condition_left">
    	<table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label>事项分类：</label></td>
                    <td class="formElem">
              				 <select name="ht_t.categoryType" id="ht_t_categoryType">
								<option value="">---请选择---</option>
								<option value="1" <c:if test="${t_categoryType eq '1'}">selected </c:if>>政府担保</option>
								<option value="2" <c:if test="${t_categoryType eq '2'}">selected </c:if>>商业担保</option>
								<option value="3" <c:if test="${t_categoryType eq '3'}">selected </c:if>>其他</option>
							</select>
				</td>
                    <td class="formElem labelName"><label>事项名称：</label></td>
               <td class="formElem">
                <input type="text" value="${t_eventName}" name="ht_t.eventName" id="ht_t_eventName" class="inText"/>
                </td>
                    <td class="formElem labelName"><label>事项状态：</label></td>
                    <td class="formElem">
                    		<select name="ht_t.eventStatus" id="ht_t_eventStatus">
								<option value="">---请选择---</option>
								<option value="1" <c:if test="${t_eventStatus eq '1'}">selected </c:if>>已到期偿还</option>
								<option value="2" <c:if test="${t_eventStatus eq '2'}">selected </c:if>>正常</option>
							</select>
                    </td>
                </tr>
				<tr>
                	<td class="formElem labelName"><label>提取类别:</label></td>
                    <td class="formElem">
                    		<select name="ht_t.drawType" id="ht_t_drawType">
								<option value="">---请选择---</option>
								<option value="1" <c:if test="${t_drawType eq '1'}">selected </c:if>>已提</option>
								<option value="2" <c:if test="${t_drawType eq '2'}">selected </c:if>>未提</option>
							</select>
                    </td>
                   <td class="formElem labelName"><label>起始日：</label></td>
                   <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="eventInitialDate" id="ht_t_eventInitialDate" value="${t_eventInitialDate}"  readonly="readonly" />
                   </td>
                   <td class="formElem labelName"><label>截止日：</label></td>
                   <td class="formElem">
                    	<input type="text" class="inText Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" name="eventEndDate" id="ht_t_eventEndDate" value="${t_eventEndDate}"  readonly="readonly" />
                   </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_right">
    	<ul>
        	<li><input type="hidden" name="superQuery" value="true"/>
        	<input type="button" value="查询" class="buttonCls" onclick="trimForm('securityAuthorization');queryData();"/></li>
            <li><input type="button" value="清空" class="buttonCls" onclick="cleanText();"/></li>
        </ul>
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
</form:form>
<script language="javascript">
$("document").ready(function(){
	queryData();
});
function queryData(){
	postDataByURL('securityAuthorization.do?actionMethod=query',$('#securityAuthorization').serialize(),'resultList');
}
	/*
	清空查询条件操作
		*/
	function cleanText(){
		document.getElementById('ht_t_categoryType').value='';
		document.getElementById('ht_t_eventName').value='';
		document.getElementById('ht_t_eventStatus').value='';
		document.getElementById('ht_t_drawType').value='';
		document.getElementById('ht_t_eventInitialDate').value='';
		document.getElementById('ht_t_eventEndDate').value='';
	}
	function exportExcel(){
		document.securityAuthorization.submit();
	}
</script>