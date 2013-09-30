<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onCheck: zTreeOnCheck
		}

	};
	var zNodes = ${treeNodes};

	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
	});
	function zTreeOnCheck(event, treeId, treeNode) {
			$.each(function(treeNode,param){
					this.checked=treeNode.checked;
			});

	}
</script>
<form:form modelAttribute="fwSrcAction" onsubmit="return false">
<input type="hidden" name="dutyId" value="${duty.id}">
<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">分配操作权限</span>
    </div>
    <div class="widgetContainer">
        <table class="formInfo">
        	<tbody>
            	<tr>
                	<td class="formElem labelName"><label>当前角色：</label></td>
                    <td class="formElem lessTen"><c:out value="${duty.name }"/></td>
                 </tr>
                 <tr>
                	<td class="formElem labelName" valign="top" style="padding-top:20px;"><label>开始分配：</label></td>
                    <td class="formElem lessTen">
                    	<ul id="treeDemo" class="ztree"></ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
 	<div class="editePageBtn">
    	<ul>
            <li><input type="button" value="确定" class="buttonCls" onclick="savedata()"/></li>
            <li><input type="button" value="取消" class="buttonCls" onclick="getData('role.do?actionMethod=query','','workspace');"/></li>
        </ul>
        <div class="clear"></div>
    </div>
</div>
</form:form>
<script language="javascript">
	function savedata(){
		if(confirm('确认要保存吗？')){
			var dataStr = $('#fwSrcAction').serialize();
			dataStr +="&srcActionId=";
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = zTree.getCheckedNodes(true);
			for(var i=0;i<nodes.length;i++){

				if(!nodes[i].isParent){
					 var flag = $(nodes[i]).attr('flag');
					 if(flag==2){
					 	dataStr +="&srcActionId="+nodes[i].id;
					 }
				}
			}
			postDataByURL('role.do?actionMethod=assignFunction',dataStr,'workspace');
		}
	}
</script>