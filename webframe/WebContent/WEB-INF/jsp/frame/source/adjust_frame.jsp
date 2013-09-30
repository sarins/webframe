<div class="widget">
    <div class="widgetTitle">
    	<span class="widgetTitleIco">调整菜单</span>
    </div>
    <div class="operationTool">
		<ul>
            <li><input type="button" value="保存调整" class="buttonCls" onclick="if(confirm('确认要保存吗？')){saveData();}"/></li>
            <div class="clear"></div>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="widgetContainer">

		<iframe width="100%" name="adjustFrame" border="0" frameborder="no" framespacing="0" onload="SetWinHeight(this)" height="200" src="source.do?actionMethod=adjust">
		</iframe>

	</div>
</div> 
<form name="saveForm" method="post" action="source.do?actionMethod=adjust" target="adjustFrame">
<input type="hidden" name="saveString" id="saveString" value="">
<input type="hidden" name="baseStyle" id="baseStyle" value="01">
</form>
<script language="javascript">
<!--
function saveData(){
	document.saveForm.saveString.value = adjustFrame.treeObj.getNodeOrders();
	document.saveForm.submit();
}
function SetWinHeight(obj){
	var win=obj;
	if (document.getElementById){
		if (win && !window.opera){
			if (win.contentDocument && win.contentDocument.body.offsetHeight){
				win.height = win.contentDocument.body.offsetHeight;
			}else if(win.Document && win.Document.body.scrollHeight){
				win.height = win.Document.body.scrollHeight;
			}
		}
	}
}
//-->
</script>