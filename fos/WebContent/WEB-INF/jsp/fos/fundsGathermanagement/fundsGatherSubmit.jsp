<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/init_script.jsp" %>
<form:form modelAttribute="fundsGatherSubmitForm" name="fundsGatherSubmitForm" onsubmit="return false">
<div class="gridInfo">
    <div class="gridToolbar">
        <div class="gridHeaderName">报表汇总提交</div>
       
        <div class="clear"></div>
    </div>
    <div class="grid">
		<table width="100%">
			<tr>
				<td>
					<label>汇总日期：</label>
					<input type="text" name="gatherDate" class="inText" value="${initDate}" readonly="readonly"/>&nbsp;&nbsp;
					<input type="button" class="buttonCls" value="资金来源滚动计划汇总报表生成" onclick="confirmSubmit('${initDate}','1');">&nbsp;&nbsp;
					<input type="button" class="buttonCls" value="资金运用滚动计划汇总报表生成" onclick="confirmSubmit('${initDate}','2');">
				</td>
			</tr>
		</table>
    </div>
    <div class="gridToolbar">
        <div class="clear"></div>
    </div>

</div>
</form:form>
<script language="javascript">
$("document").ready(function(){
});
function confirmSubmit(gtDate,subType){
	if(confirm('确认要提交吗?')){
		postDataByURL('fundsGatherSubmit.do?actionMethod=confirmSubmit&subType='+subType,$('#fundsGatherSubmitForm').serialize(),'workspace','报表汇总执行成功！');
	}
}
</script>