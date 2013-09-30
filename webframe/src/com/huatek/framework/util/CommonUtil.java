package com.huatek.framework.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import com.huatek.framework.exception.BusinessRuntimeException;

public class CommonUtil {

	public static boolean isZeroLengthTrimString(String value){
		return value==null || value.trim().length()==0;
	}
	public static boolean isNotZeroLengthTrimString(String value){
		return !(isZeroLengthTrimString(value));
	}
	public static String getParamValue(PageContext pageContext, String name){
		String satrribute=pageContext.findAttribute(name).toString();
		String value=pageContext.getRequest().getParameter(satrribute);
		if(value==null || value.trim().length()==0){
			return "";
		}
		return value;
	}
	public static String getParamValue(HttpServletRequest request, String name){
		String value=request.getParameter(name);
		if(isZeroLengthTrimString(value)){
			return "";
		}
		return value;
	}
	public static Date getAddDate(String yyyy_MM_DD, int days){
		if(yyyy_MM_DD==null){
			return new Date();
		}
		String[] calendar = yyyy_MM_DD.split("-");
		GregorianCalendar gc =new GregorianCalendar();
		gc.set(Integer.parseInt(calendar[0]), Integer.parseInt(calendar[1]) - 1, Integer.parseInt(calendar[2]),0,0,0);
		gc.add(5, days);
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		return java.sql.Date.valueOf(sdf.format(gc.getTime()));
	}
	public static String getIdSQLParam(Long[] ids) {
		if(ids==null||ids.length==0){
			return null;
		}
		StringBuffer param = new StringBuffer("");
		for(int i=0;i<ids.length;i++){
			if(i>0){
				param.append(",");
			}
			param.append("?");
		}
		return param.toString();
	}

	public static Date getDateValue(String value){
		boolean isTime = value.trim().indexOf(" ")>0;
		String formatStyle = "";
		if(isTime){
			formatStyle = Parameter.getInstance().getProp().getProperty(Constant.FORMAT_DATE_STYLE,"yyyy-MM-dd HH:mm:ss");
		}else{
			formatStyle = Parameter.getInstance().getProp().getProperty(Constant.FORMAT_DATE_STYLE,"yyyy-MM-dd");
		}
		try {
            return getSampleDateFormat(formatStyle).parse(value);
        } catch (ParseException e) {
            throw new BusinessRuntimeException(e.getMessage(),e);
        }
	}
	public static SimpleDateFormat  getSampleDateFormat(String format){
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		return sdf;
	}

	public static String getURL(String url, String menuId, String method) {
		return url+"?actionMethod="+method+"&menuId="+menuId;
	}


}
