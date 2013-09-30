<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="efwBusinessModuleMap" items="${efwBusinessModuleMapList}">
    <div class="supTicket nobg">
        <div class="issueType">
        	<span class="issueInfo"><a  title="" onclick="displayEntity('${efwBusinessModuleMap.efwSourceEntity.entityClass}',${businessModuleId},'${efwBusinessModuleMap.efwSourceEntity.id}','dataRoleId=${efwDataRole.id}');" style="cursor:pointer;">${efwBusinessModuleMap.efwSourceEntity.entityName}：</a></span>
            <div class="fix"></div>
        </div>
       <div id="entity_${efwBusinessModuleMap.efwSourceEntity.id}"> </div>
    </div>
</c:forEach>











