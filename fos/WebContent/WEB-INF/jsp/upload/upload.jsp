<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Ajax File Upload</title>
<link href="${ht_globalUrl}/css/main.css" rel="stylesheet" type="text/css" />
<link href="${ht_globalUrl}/css/custom.css" rel="stylesheet" type="text/css" />
<link href="${ht_globalUrl}/css/cmsDefault.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.space { padding: 10px;}
fieldset {margin: 10px; }
fieldset legend{padding-left:0px;}
</style>

<script type="text/javascript" src="${ht_globalUrl}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/jquery-showLoading.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/cmsDefault.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/ht_frame.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/lhgdialog.min.js"></script>
<script type="text/javascript" src="${ht_globalUrl}/js/jquery.filestyle.js"></script>
<script language="javascript">
$(function(){
	$("input.fileInput").filestyle({
		imageheight : 26,
		imagewidth : 46,
		width : 250
		});
});
var req;
var isSuccess=false;
var ajaxRequestCount = 0;
var isProcess = false;
function ajaxFunction() {
	if(!isProcess){
		checkProgressBar();
		return;
	}
	var url = "UploadProgressBarServlet?rndNumber="+RndNum(4);
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
		req.open("GET", url, true);
		req.onreadystatechange = function() {
			if (req.readyState == 4) {
				ajaxRequestCount = ajaxRequestCount + 1;
				processStateChange();
			}
		};
		req.send(null);
	} else if (window.ActiveXObject)// IE Browsers
	{
		req = new ActiveXObject("Microsoft.XMLHTTP");
		if (req) {
			ajaxRequestCount = ajaxRequestCount + 1;
			req.onReadyStateChange = processStateChange;
			req.open("GET", url, true);
			req.send();
		}
	}
	startProcess();
}

function checkProgressBar(){
	var progressBarWidth = document.getElementById("progressBar").width;
	if((progressBarWidth == '' || progressBarWidth == '0px') && ajaxRequestCount < 2 && !isProcess){
		document.getElementById("initializing").style.visibility = "hidden";
		document.getElementById("progressBarTable").style.visibility = "visible";
		document.getElementById("percentCompleteTable").style.visibility = "visible";
		document.getElementById("bytesRead").style.visibility = "visible";
		document.getElementById("status").innerHTML = "任务完成";
		document.getElementById("progressBar").style.width = "100%";
		if(isSuccess){
			document.getElementById("percentComplete").innerHTML = "导入完成!";
		}else{
			document.getElementById("percentComplete").innerHTML = "导入失败!";
		}
	}
}

function RndNum(n){
	var rnd="";
	for(var i=0;i<n;i++)
		rnd+=Math.floor(Math.random()*10);
	return rnd;
}
function isAbleSubmit(){
	if(document.getElementById("fileName").value==''){
		alert('请选择要导入的文件!');
		return false;
	}
	return true;
}
function startProcess(){
	isProcess = true;
	document.getElementById("mysubmit").disabled=true;
	document.getElementById("showContent").style.display='none';
}
function endProcess(){
	isProcess = false;
	document.getElementById("mysubmit").disabled=false;
	document.getElementById("bytesRead").style.visibility = "hidden";
	if (isSuccess) {
		document.getElementById("status").innerHTML = "任务完成";
		document.getElementById("progressBar").style.width = "100%";
		document.getElementById("percentComplete").innerHTML = "导入成功!";
	}else{
		document.getElementById("status").innerHTML = "任务失败";
		document.getElementById("bytesRead").innerHTML = '';
		document.getElementById("percentComplete").innerHTML = "导入失败!";
	}
}
function processStateChange() {
	/**    *  State    Description
	 *    0      The request is not initialized
	 *    1      The request has been set up
	 *    2      The request has been sent
	 *    3      The request is in process
	 *    4      The request is complete    */

	if (req.readyState == 4) {
		if (req.status == 200) // OK response
		{
			var xml = req.responseXML;
			// Sleep then call the function again
			if(isProcess){
				window.setTimeout(function(){ajaxFunction();}, 300);
			}
			if(xml==null || !xml.getElementsByTagName("process_name")[0]){
				return;
			}

			// No need to iterate since there will only be one set of lines
			var isNotFinished = xml.getElementsByTagName("finished")[0];
			var myBytesRead = xml.getElementsByTagName("bytes_read")[0];
			var processName = xml.getElementsByTagName("process_name")[0].firstChild.nodeValue;
			if(processName!=null&&processName!=''&&processName!='null'){
				processName+='执行进度';
			}else{
				processName = '任务完成';
			}
			document.getElementById("status").innerHTML = processName;
			var myContentLength = xml.getElementsByTagName("content_length")[0];
			var myPercent = xml.getElementsByTagName("percent_complete")[0];
			// Check to see if it's even started yet
			if ((isNotFinished == null) && (myPercent == null)) {
				document.getElementById("initializing").style.visibility = "visible";
			} else {
				document.getElementById("initializing").style.visibility = "hidden";
				document.getElementById("progressBarTable").style.visibility = "visible";
				document.getElementById("percentCompleteTable").style.visibility = "visible";
				document.getElementById("bytesRead").style.visibility = "visible";
				myBytesRead = myBytesRead.firstChild.data;
				myContentLength = myContentLength.firstChild.data;
				if (myPercent != null)// It's started, get the status of the upload
				{
					myPercent = myPercent.firstChild.data;
					document.getElementById("progressBar").style.width = myPercent
							+ "%";
					document.getElementById("bytesRead").innerHTML = myBytesRead
							+ " of " + myContentLength + " 已经完成";
					document.getElementById("percentComplete").innerHTML = myPercent
							+ "%";
				}else {
					if(processName.indexOf('文件上传')>=0){
						document.getElementById("bytesRead").style.visibility = "hidden";
						document.getElementById("progressBar").style.width = "100%";
						document.getElementById("percentComplete").innerHTML = "文件成功上传，等待数据导入!";
					}else{
					document.getElementById("bytesRead").style.visibility = "hidden";
					document.getElementById("progressBar").style.width = "100%";
					document.getElementById("percentComplete").innerHTML = "成功完成!";
					}
				}
			}
		} else {
			alert(req.statusText);
		}
	}
}
</script>
</head>
<body>
<div class="widget">
	<div class="widgetTitle">
		<span class="widgetTitleIco">上传文件</span>
	</div>

<div id="uploadContent">
<iframe id="uploadFrameID" name="uploadFrame" height="0" width="0"
	frameborder="0" marginwidth="0" marginheight="0" scrolling="yes"></iframe>
	<input type = "hidden" value="${uploadInfoBean.success}"/>
<form id="myForm" enctype="multipart/form-data"
	 action="upload.do?actionMethod=upload" target="uploadFrame"
	 method="post" onsubmit="if(isAbleSubmit()){isProcess=true;ajaxFunction();return true;}else{return false;}">
	<table border="0" width="550" style="padding: 0px; margin: 10px">
  <tbody>
  <tr>
    <td width="150" align="right" valign="middle" style="font-size:12px;padding-top:10px\9;">选择文件路径：</td>
    <td width="450" valign="middle" >
    	<input type="hidden" name="from" value="${from}">
    	<input type="hidden" name="type" value="${type}">
    	<input type="hidden" name="id" value="${id}">
    	<input type="hidden" name="ht_t.parameterId" value="${parameterId}">
    	<input type="file" name="fileName" id="fileName" class="fileInput" onclick="if(isProcess){alert('系统在处理中，请稍后点击。');return false;}"
      	title="请选择上传文件" /><input type="submit" name="mysubmit" id="mysubmit" title="Upload file now." value="上传" style="margin-left:55px;background:url(${ht_globalUrl }/images/upload_btn.jpg);width:46px;height:23px;border:none;color:#ffffff;cursor:pointer;margin-top:2px;padding-bottom: 5px;padding-bottom:0px\9;padding-top:2px\9;position:relative\9;top:2px\9;">
    </td>
  </tr>

   <tr id="isImportOrder" style="display: none;">
    <td colspan="2">
    <font color="red">导入订单将会覆盖基础订货单位已经订购的数量，请慎重导入!<br/>
    	本功能只能支持离线版文件导入，不支持excel文件导入，文件名例如:XXXX.zip.
    </font></td>
   	<!--
    <td width="90" style="width: 7em; text-align: right">删除已有数据</td>
    <td>
     	<input type="radio" value="1" name="deleteOrder" checked="checked">是 &nbsp; <input type="radio" value="0" name="deleteOrder">否
    </td>
     -->
   </tr>

  </tbody>
</table>
</form>
<fieldset >
<legend id="status">状态</legend>
<div class="space">
&nbsp;
</div>

<!-- Add hidden DIVs for updating and the progress bar (just a table) below the form -->
<div id="initializing"
	style="visibility: hidden; position: absolute; top: 160px;  width:100%">
<table width="100%" style="border: 1px; background-color: #a2a2a2;">
	<tr>
		<td>
		<table width="100%"
			style="border: 1px; background-color: #a2a2a2; color: #555555;">
			<tr>
				<td align="center"><b>Initializing Upload...</b></td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<div id="progressBarTable"
	style="visibility: hidden; top: 160px; width:100%">
<table width="100%"
	style="border: 1px; background-color: #a2a2a2; color: #555555;">
	<tr>
		<td>
		<table id="progressBar" width="0px"
			style="border: 1px; width: 0px; background-color: #89d63d;">
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<table width="100%" style="color: #555555">
	<tr>
		<td align="center" nowrap="nowrap">
			<span id="bytesRead" style="font-weight: bold;">&nbsp;</span>
		</td>
	</tr>
</table>
</div>
<div id="percentCompleteTable" align="center" style="visibility: hidden;  absolute; top: 160px; width:100%">
<table width="100%" style="border: 1px;">
	<tr>
		<td>
		<table width="100%" style="border: 1px;">
			<tr>
				<td align="center" nowrap="nowrap">
					<span id="percentComplete" style="color: #555555 font-weight: bold;">&nbsp;</span>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<div class="space">&nbsp;</div>
</fieldset>
</div>
<div style="clear:both"></div>
<div id="showContent" style="display:none">验证结果</div>

</div>
</body>
</html>