<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="currentGridId" value="tb_funds_Ori_table_list"></c:set>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="sourceUseFunds" name="ec" target="_blank" action="fundsOrigin.do?actionMethod=export" onsubmit="return false">
<fieldset>
	<legend>资金来源查询</legend>
    <div class="condition_left">
    	<table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label>一级项目分类：</label></td>
                    <td class="formElem">
               <input type="text" value="${t_firstCategory_proCateName}" name="ht_t.firstCategory.proCateName" id="ht_t_firstCategory_proCateName1" class="inText"/>
			</td>
                    <td class="formElem labelName"><label>二级项目分类：</label></td>
               <td class="formElem">
                <input type="text" value="${t_sencondCategory_proCateName}" name="ht_t.sencondCategory.proCateName" id="ht_t_sencondCategory_proCateName" class="inText"/>
                </td>
                    <td class="formElem labelName"><label>项目：</label></td>
                    <td class="formElem"><input type="text" class="inText" value="${t_projectName}" name="ht_t.projectName" id="ht_t_projectName"/></td>
                </tr>
				<tr>
                	<td class="formElem labelName"><label>统计日期：</label></td>
                    <td class="formElem"><input type="text" name="gatherDate" class="inText Wdate" onclick="WdatePicker();" value="${initDate}" readonly="readonly"/></td>
                    <td class="formElem labelName"><label></label></td>
                    <td class="formElem"></td>
                    <td class="formElem labelName"><label></label></td>
                    <td class="formElem"></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="btn_right">
    	<ul>
        	<li><input type="hidden" name="superQuery" value="true"/>
        	<input type="button" value="查询" class="buttonCls" onclick="trimForm('sourceUseFunds');queryData();"/></li>
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
		postDataByURL('fundsOrigin.do?actionMethod=query',$('#sourceUseFunds').serialize(),'resultList');
	}
	/*
	清空查询条件操作
		*/
	function cleanText(){
		document.getElementById('ht_t_firstCategory_proCateName1').value='';
		document.getElementById('ht_t_sencondCategory_proCateName').value='';
		document.getElementById('ht_t_projectName').value='';
	}

	function exportExcel(){
		document.ec.submit();
	}
</script>