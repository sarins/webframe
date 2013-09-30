<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="huatek" uri="http://www.huatek.com/j2ee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=8"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>资金运营管理系统</title>
<link rel="stylesheet" type="text/css" href="${ht_globalUrl}/css/cmsDefault.css"/>
<link rel="stylesheet" type="text/css" href="${ht_globalUrl}/css/jquery.dataTables.css"/>
<link rel="stylesheet" type="text/css" href="${ht_globalUrl}/js/tree/zTreeStyle/zTreeStyle.css"/>
<script type="text/javascript" src="${ht_globalUrl}/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/jquery-showLoading.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/fixedColumns.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/tree/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/cmsDefault.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/ht_frame.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/lhgdialog.min.js"></script>
<script type="text/javascript">
var globalUrl = '${ht_globalUrl}/';
var cannot_connect_server = '不能连接到应用服务器，请检查网络或服务是否开启。';

var welcome='<huatek:urlDecode value="${welcome}"/>';
$(document).ready(function(){
	if(welcome!=''){
		getData(welcome,'','workspace');
	}
});
</script>
</head>
<body>

<!-- Top navigation bar -->
<div class="topNav">
	<div class="cmsLogo"><a href="javascript:;" title=""><img src="${ht_globalUrl}/images/logo.png" alt=""  title=""/></a></div>
    <div class="cmsNav">
        <ul>
            <li><a href="javascript:;" title=""><img src="${ht_globalUrl}/images/topnav/profile.png" alt="" title=""/><span>用户：<c:out value="${LoginAccount.userName}" /></span></a></li>
            <li><a href="${ht_globalUrl}/menu.do?actionMethod=getMenu&welcome=<huatek:urlEncode value="resPassword.show?actionMethod=edit"/>" title=""><img src="${ht_globalUrl}/images/topnav/settings.png" alt="" title=""/><span>修改密码</span></a></li>
            <li><a href="${ht_globalUrl}/sso.show?actionMethod=logout" title=""><img src="${ht_globalUrl}/images/topnav/logout.png" alt="" title=""/><span>注销</span></a></li>
        </ul>
    </div>
    <div class="clear"></div>
</div>

<!-- Header -->
<div class="header">
    <div class="middleNav">
    	<ul>
            <c:out value="${navHtml}" escapeXml="false"></c:out>
            <div class="clear"></div>
        </ul>
    </div>
    <div class="clear"></div>
</div>


 <!--Wrapper-->
<div class="wrapper">
    <!--left-->
    <div class="leftMenu" <c:if test="${subMenuHtml==null}">style="display:none"</c:if>>
         <c:out value="${subMenuHtml}" escapeXml="false"></c:out>
    </div>
    <!--switch-->
    <c:if test="${subMenuHtml != null}">
    <div class="switch"><img src="${ht_globalUrl}/images/switchRight.jpg"/></div>
    </c:if>
    <!--right-->
    <div class="rightContainer">
        <div class="rightTitle" id="moduleTitle">
        	<c:if test="${fwSource!=null}">
        		<c:out value="${fwSource.name}"></c:out>
        	</c:if>
        	<c:if test="${fwSource==null}">首页</c:if>
        </div>
        <div class="rightContent">
			<div class="nNote nSuccess" id="success_box" style="display:none">
	        </div>
	        <div class="nNote nFailure" id="error_box" style="display:none">
	        </div>
	        <div id="workspace"></div>
        </div>
    </div>
    <div class="clear"></div>
</div>

 <!--BackTop-->
<div class="backTop" title="回到顶部">&nbsp;</div>
</body>
</html>

