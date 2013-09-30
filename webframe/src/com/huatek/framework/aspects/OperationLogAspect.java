package com.huatek.framework.aspects;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;

import com.huatek.framework.entity.FwActionCnt;
import com.huatek.framework.entity.FwActionLog;
import com.huatek.framework.security.ClientInfoBean;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.service.OperationService;
import com.huatek.framework.util.Parameter;

@Aspect
public class OperationLogAspect {
	@Autowired
	private OperationService operationService;
	private static final Log LOGGER = LogFactory.getLog(OperationLogAspect.class);
	@After ("execution(* com.huatek.framework.action.*.*(..))")
	public void log(){

		ClientInfoBean infoBean = ThreadLocalClient.get();
		if(infoBean.getRequestMethod()==null||infoBean.getRequestMethod().equalsIgnoreCase("get")){
			return;
		}
		if(infoBean.getSrcAction()==null||infoBean.getSrcAction().getLogLevel().intValue()==0){
			return ;
		}
		if(infoBean.isLogged()){
			return;
		}
		LOGGER.debug("Begin log the action information");
		//if the loglevel is 1,then log the action
		FwActionLog fwActionLog = new FwActionLog();
		fwActionLog.setActionTime(infoBean.getAccessCalendar().getTime());
		fwActionLog.setClientIp(infoBean.getHostIp());
		fwActionLog.setClientPort(Long.valueOf(infoBean.getHostPort()+""));
		fwActionLog.setFwAccount(infoBean.getOperator());
		fwActionLog.setFwSrcAction(infoBean.getSrcAction());
		//if the loglevel is 2,then log the action content
		if(infoBean.getSrcAction().getLogLevel().intValue()==2){
			Set<FwActionCnt> auditContents = infoBean.getAuditContents();
			if(auditContents!=null && !auditContents.isEmpty()) {
				fwActionLog.setFwActionCnts(new HashSet<FwActionCnt>());
				Iterator<FwActionCnt> it = auditContents.iterator();
				while(it.hasNext()) {
					FwActionCnt content = it.next();
					content.setFwActionLog(fwActionLog);
					fwActionLog.getFwActionCnts().add(content);
				}
		    }
		}
		operationService.save(fwActionLog);
		infoBean.setLogged(true);
		LOGGER.debug("End log the action information");
	}
}
