function getAppearPart(id){
	getData('efwDataRole.do?actionMethod=getModuleAuthority','businessModuleId='+id,'assignDataAuthority');
}
function displayEntity(entityName, moduleId, entityId, params){
	if(document.getElementById("entity_"+entityId).style.display=='block'){
		$("#entity_"+entityId).attr("style","display:none;");
	}else{
		queryEntity(moduleId, entityId,params);
		$("#entity_"+entityId).attr("style","display:block;");
	}
}

function queryEntity(moduleId, entityId, params){
	var DataStr = $('#entityForm_'+entityId).serialize();
	DataStr +='&businessModuleId='+moduleId+'&'+params+'&entityId='+entityId;//
	var displayDiv = entityId;
	postDataByURL('efwDataRole.do?actionMethod=queryDataEntity',DataStr,"entity_"+entityId);

}


function assignAuthority(moduleId,checkObj, entityId, fieldValue,dataRoleId){

	var dataStr = 'dataRoleId='+dataRoleId+'&businessModuleId='+moduleId+'&dataId='+checkObj.value+"&checked="+checkObj.checked+"&entityId="+entityId;
	if(fieldValue){
		dataStr+='&fieldValue='+fieldValue;
	}else{
		dataStr+='&fieldValue='+checkObj.value;
	}
	switchData('efwDataRole.do?actionMethod=assignDataAuthority',dataStr);
}