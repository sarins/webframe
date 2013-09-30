<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script language="javascript" charset="utf-8">
$(document).ready(function(){
	$('#${currentGridId}').dataTable({
		"bPaginate": false, //翻页功能
		"bLengthChange": false, //改变每页显示数据数量
		"bFilter": false, //过滤功能
		"bSort": false, //排序功能
		"bInfo": false,//页脚信息
		"bAutoWidth": true,//自动宽度
		"oLanguage":{
		    "sZeroRecords": "查询不到任何相关数据"
		}
	});
});
</script>