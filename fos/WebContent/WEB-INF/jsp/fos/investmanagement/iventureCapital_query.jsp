<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_funds_apply_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="sourceUseFundsForm" name="ec" onsubmit="return false" target="_blank" action="iventureCapital.do?actionMethod=export">
<fieldset>
	<legend>资金运用查询</legend>
    <div class="condition_left">
    	<table class="formInfo">
        	<tbody>
            	<tr>
            	   <td class="formElem labelName"><label>分类：</label></td>
                    <td class="formElem">
	     				<select name="firstCategory" id="firstCategory">
	     					<option value="">--请选择--</option>
							<c:forEach var="category" items="${categoriesList}">
								<option value="${category.id}">
									<c:out value="${category.proCateName}"/>
								</option>
							</c:forEach>
	     				</select>
					</td>
                    <td class="formElem labelName"><label>项目：</label></td>
               <td class="formElem">
               	<input type="text" class="inText" value="${t_projectName}" name="ht_t.projectName" id="ht_t_projectName"/>
               </td>
                    <td class="formElem labelName"><label>统计日期：</label></td>
                    <td class="formElem"><input type="text" name="gatherDate" class="inText Wdate" onclick="WdatePicker();" value="${initDate}" readonly="readonly"/></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_right">
    	<ul>
        	<li><input type="hidden" name="superQuery" value="true"/>
        	<input type="button" value="查询" class="buttonCls" onclick="trimForm('sourceUseFundsForm');queryData();"/> <input type="button" value="清空" class="buttonCls" onclick="cleanData();"/></li>
        </ul>
    </div>
    <div class="clear"></div>
</fieldset>

<div class="operationTool">
	<ul>
    	<li>
    	<a href="javascript:;" title="查询结果导出Excel" <huatek:displayMethod methodName="export"/>>
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
	postDataByURL('iventureCapital.do?actionMethod=query',$('#sourceUseFundsForm').serialize(),'resultList');
}
	/*
	清空查询条件操作
		*/
	function cleanData(){
		cleanText(['firstCategory','ht_t_firstCategory_proCateName','ht_t_projectName']);
	}

	function exportExcel(){
		document.ec.submit();
	}
</script>