package com.huatek.framework.tag;

import com.huatek.dictionary.entity.FwDictionary;
import com.huatek.dictionary.service.DictionaryFactory;

public class HtmlUtil {
	public static String getAttrHtml(String attrName,String attrValue){
		if(attrName==null){
			return "";
		}
		return attrName+"=\""+attrValue+"\" ";
	}

	public static String getOracleErrorDicInfo(String errorMessage,String category){
		if(errorMessage.indexOf("(")>0&&errorMessage.indexOf(")",errorMessage.indexOf("("))>0){
			String key = errorMessage.substring(errorMessage.indexOf(".",errorMessage.indexOf("("))+1,errorMessage.indexOf(")",errorMessage.indexOf("(")));
			FwDictionary fwDictionary = DictionaryFactory.getAllDictionaryMap().get(category+"_"+key);
			if(fwDictionary==null){
				return "已经被其他数据引用，引用约束"+errorMessage.substring(errorMessage.indexOf("("),errorMessage.indexOf(")",errorMessage.indexOf("("))+1);
			}
			return fwDictionary.getName();
		}
		return null;

	}

}
