package com.huatek.framework.util;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;


public class QueryCondition {
	@SuppressWarnings("unchecked")
	private static List<CommonBean> getPrivateQueryCondition(HttpServletRequest request,Object queryClass,HashMap<String,String> operatorMap,boolean isApplyLikeOperator) {
		List<CommonBean> paramterList = new ArrayList<CommonBean>();
		String saveKey = null;
		if(ThreadLocalClient.get().getSrcAction()!= null){
			saveKey = ThreadLocalClient.get().getSrcAction().getId()+ThreadLocalClient.get().getActionMethod();
		}
		if(request.getMethod().equalsIgnoreCase("post")){
			Enumeration<String> parameterNames = request.getParameterNames();
			while(parameterNames.hasMoreElements()){
				String name =  parameterNames.nextElement().toString();
			if(name.startsWith("ht_")) {
				String fieldName = name.substring(3);
				if(name.startsWith("ht_")&&CommonUtil.isNotZeroLengthTrimString(request.getParameter(name))){
					CommonBean commonBean = null;
					String value = request.getParameter(name);
					if(queryClass==null){
						commonBean = new CommonBean(fieldName, value);
					}else{
						Object typeValue = null;
						if(queryClass instanceof HashMap){
							typeValue = EntityUtil.getPropertyValue((HashMap)queryClass, fieldName, value);
						}else{
							typeValue = EntityUtil.getPropertyValue((Class)queryClass, fieldName, value);
						}
						commonBean = new CommonBean(fieldName, value,typeValue);
					}
					if(operatorMap!=null&&operatorMap.get(fieldName)!=null){
						commonBean.setArithmeticOpertor(operatorMap.get(fieldName));
					}
					commonBean.setApplyLikeOperator(isApplyLikeOperator);
					paramterList.add(commonBean);
					request.getSession().setAttribute(fieldName.replaceAll("\\.", "_"), request.getParameter(name));
				}else if(request.getSession().getAttribute(fieldName.replaceAll("\\.", "_"))!=null){
					request.getSession().setAttribute(fieldName.replaceAll("\\.", "_"), null);
				}
			}
			}
			if(saveKey!=null){
				request.getSession().setAttribute(saveKey, paramterList);
			}
		}else{
			if(saveKey!=null && request.getSession().getAttribute(saveKey)!=null){
				paramterList = (List<CommonBean>)request.getSession().getAttribute(saveKey);
				for(int i=0;i<paramterList.size();i++){
					request.getSession().setAttribute(paramterList.get(i).getName().replaceAll("\\.", "_"), paramterList.get(i).getValue());
				}
			}
		}
		return paramterList;
	}
	/**
	 * The parameter entityClassMap' key is the entity alias name of HSQL.
	 * **/
	public static List<CommonBean> getQueryConditionByClassMap(HttpServletRequest request,HashMap<String,Class<?>> entityClassMap) {
		return getPrivateQueryCondition(request,entityClassMap,null,true);
	}
	public static List<CommonBean> getQueryConditionByClassMap(HttpServletRequest request,HashMap<String,Class<?>> entityClassMap,boolean isApplyLikeOperator) {
		return getPrivateQueryCondition(request,entityClassMap,null,isApplyLikeOperator);
	}
	public static List<CommonBean> getQueryConditionByClassMap(HttpServletRequest request,HashMap<String,Class<?>> entityClassMap,HashMap<String,String> operatorMap) {
		return getPrivateQueryCondition(request,entityClassMap,operatorMap,true);
	}
	public static List<CommonBean> getQueryConditionByClassMap(HttpServletRequest request,HashMap<String,Class<?>> entityClassMap,HashMap<String,String> operatorMap,boolean isApplyLikeOperator) {
		return getPrivateQueryCondition(request,entityClassMap,operatorMap,isApplyLikeOperator);
	}
	public static List<CommonBean> getQueryCondition(HttpServletRequest request,Class<?> queryClass) {
		return getPrivateQueryCondition(request,queryClass,null,true);
	}
	public static List<CommonBean> getQueryCondition(HttpServletRequest request,Class<?> queryClass,boolean isApplyLikeOperator) {
		return getPrivateQueryCondition(request,queryClass,null,isApplyLikeOperator);
	}
	public static List<CommonBean> getQueryCondition(HttpServletRequest request,Class<?> queryClass,HashMap<String,String> operatorMMap) {
		return getPrivateQueryCondition(request,queryClass,operatorMMap,true);
	}
	public static List<CommonBean> getQueryCondition(HttpServletRequest request,Class<?> queryClass,HashMap<String,String> operatorMMap,boolean isApplyLikeOperator) {
		return getPrivateQueryCondition(request,queryClass,operatorMMap,isApplyLikeOperator);
	}
	/**
	 * @deprecated please use the getQueryCondition(HttpServletRequest request,Class<?> queryClass)
	 * */
	public static List<CommonBean> getQueryCondition(HttpServletRequest request) {
		return getQueryCondition(request,null);
	}
	/**
	 * @deprecated please use the getQueryPageBean(HttpServletRequest request)
	 * */
	public static CutPageBean getQueryPageBean(HttpServletRequest request,CutPageBean pageBean){
		if(ThreadLocalClient.get().getSrcAction()==null){
			return pageBean;
		}
		String saveKey = ThreadLocalClient.get().getSrcAction().getId()+ThreadLocalClient.get().getActionMethod();
		if(ThreadLocalClient.get().getRequestMethod().equalsIgnoreCase("post")){
			request.getSession().setAttribute(saveKey+"_pageBean", pageBean);
			return pageBean;
		}else{
			if(request.getSession().getAttribute(saveKey+"_pageBean")!=null){
				return (CutPageBean)request.getSession().getAttribute(saveKey+"_pageBean");
			}
			return pageBean;
		}
	}
	public static CutPageBean getQueryPageBean(HttpServletRequest request){
	    return getQueryPageBean(request,0);
	}
	public static CutPageBean getQueryPageBean(HttpServletRequest request,int pageInitSize){
	    CutPageBean pageBean = new CutPageBean();
	    if(request.getParameter("pageSize")==null&&pageInitSize>0){
	        pageBean.setPageSize(pageInitSize);
	    }else if(request.getParameter("pageSize")!=null){
	        pageBean.setPageSize(Integer.valueOf(request.getParameter("pageSize")));
	    }
	    if(request.getParameter("currentPage")!=null){
	        pageBean.setCurrentPage(Integer.valueOf(request.getParameter("currentPage")));
	    }
        if(ThreadLocalClient.get().getSrcAction()==null){
            return pageBean;
        }
        String saveKey = ThreadLocalClient.get().getSrcAction().getId()+ThreadLocalClient.get().getActionMethod();
        if(ThreadLocalClient.get().getRequestMethod().equalsIgnoreCase("post")){
            request.getSession().setAttribute(saveKey+"_pageBean", pageBean);
            return pageBean;
        }else{
            if(request.getSession().getAttribute(saveKey+"_pageBean")!=null){
                return (CutPageBean)request.getSession().getAttribute(saveKey+"_pageBean");
            }
            return pageBean;
        }
    }

}
