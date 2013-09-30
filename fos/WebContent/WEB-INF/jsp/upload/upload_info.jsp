<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<span id="responseContent">

	<c:if test="${uploadInfoBean.success=='true'}">
		<div style="color:red;margin:10px;">成功</div>
	</c:if>
	<c:if test="${uploadInfoBean.success=='false'}">
		<div style="color:red;margin:10px;">失败</div>
	</c:if>
	<c:out value="${uploadInfoBean.infoMsg}"  escapeXml="false" />
	<c:if test="${uploadInfoBean.errorMsg != ''}">
		<div style="color:red;margin:10px;"><c:out value="${uploadInfoBean.errorMsg}" escapeXml="false" /></div>
	</c:if>

</span>
<script language="javascript">
window.onload = function(){
	var result = '${uploadInfoBean.success}';
	if( result == 'true'){
		parent.isSuccess = true;
	}else{
		parent.isSuccess = false;
	}
	parent.endProcess();
	parent.document.getElementById("showContent").innerHTML = document.getElementById("responseContent").innerHTML;
	parent.document.getElementById("showContent").style.display="block";
}
</script>