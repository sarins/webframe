package com.huatek.framework.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

import com.huatek.framework.entity.FwSrcAction;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ClientInfoBean;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.util.CommonUtil;
/***
 * 用于检查访问的URL以及对应的操作是否已经赋予当前的操作人员。
 * 本类只检查是否具有操作权限，不判断是否具有数据权限。数据权
 * 限请见数据权限的配置。
 * 访问案列：
 * 操作人员访问用户添加模块，需要提交以下参数。
 * 当前访问的模块,menuId=12345
 * 当前访问的URL,context/user.do
 * 当前访问的方法，actionMethod=add
 *
 * 如果是直属于用户管理模块，也就是该模块的URL=user.do，那么给
 * 操作人员配置的权限为：URL=null, actionMethods=query;add
 *
 * 如果不是直属于用户管理模块，而是从属于其他业务模块，配置的权限
 * 为：URL=user.do, actionMethods=query;add
 *
 * 操作必须提交当前模块ID,这是用于获取模块权限的唯一标识。
 * 获取模块的可操作权限。
 * 判断当前操作是否拥有权限。
 *
 * 权限保存在Map中。
 *
 *
 *
 * @author 潘仁胜
 */
@Aspect
public class PermitCheckAspect {
	//private static final Log logger = LogFactory.getLog(PermitCheckAspect.class);
	@Before ("execution(* com.huatek.framework.action.*.*(..))")
	public void check(){

		ClientInfoBean infoBean = ThreadLocalClient.get();
		if(infoBean==null){
			return;
		}
		//判断是否有权限
		String urlKey = CommonUtil.getURL(infoBean.getActionURL(), infoBean.getMenuId().toString(), infoBean.getActionMethod());
		if(ThreadLocalClient.get().getOperator()==null){
			throw new BusinessRuntimeException("error.login.session.timeout");
		}
		FwSrcAction fwSrcAction = ThreadLocalClient.get().getOperator().getPermitActionMap().get(urlKey);
		if(fwSrcAction==null){
			throw new BusinessRuntimeException("Error.unpass.permit.check");
		}else{
			infoBean.setSrcAction(fwSrcAction);
			infoBean.setPermitAction(infoBean.getOperator().getMenusActionMap().get(infoBean.getMenuId().toString()));
		}
	}
}
