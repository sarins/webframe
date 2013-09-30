package com.huatek.dictionary.service;

import java.util.List;
import java.util.Map;

import com.huatek.dictionary.entity.FwCategory;
import com.huatek.dictionary.entity.FwDictionary;
import com.huatek.framework.util.Parameter;
import com.huatek.framework.util.SpringContext;

public class DictionaryFactory {
	/***
	 * 获取所有字典目录.
	 * @return 返回所有字典目录列表.
	 */
	public static List<FwCategory> getAllFwCategoryList(){
		CategoryService categoryService = (CategoryService)SpringContext.getBean("dicCategoryService");
		return categoryService.loadAllFwCategoryList(Parameter.getInstance().getProp().getProperty("app.system.code","default"));
	}
	/***
	 * 获取所有字典目录的Map.
	 * key=字典目录编码.
	 * @return 返回所有字典目录的Map.
	 */
	public static Map<String, FwCategory> getAllFwCategoryMap(){
		CategoryService categoryService = (CategoryService)SpringContext.getBean("categoryService");
		return categoryService.loadAllFwCategoryMap(Parameter.getInstance().getProp().getProperty("app.system.code","default"));
	}
	/***
	 * 获取所有字典数据的Map.
	 * key=字典目录编码.
	 * @return 返回所有字典目录的Map.
	 */
	public static Map<String, FwDictionary> getAllDictionaryMap(){
		DictionaryService dictionaryService = (DictionaryService)SpringContext.getBean("dictionaryService");
		return dictionaryService.loadAllDictionaryMap(Parameter.getInstance().getProp().getProperty("app.system.code","default"));
	}

	/***
	 * 获取指定目录的字典数据列表.
	 * key=字典目录编码.
	 * @return 返回所有字典目录的Map.
	 */
	public static List<FwDictionary> getCategoryDictionaryList(String categoryCode){
		DictionaryService dictionaryService = (DictionaryService)SpringContext.getBean("dictionaryService");
		return dictionaryService.loadCategoryDictionary(categoryCode);
	}

}
