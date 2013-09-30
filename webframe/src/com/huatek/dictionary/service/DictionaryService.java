package com.huatek.dictionary.service;

import java.util.List;
import java.util.Map;

import com.huatek.base.service.BaseService;
import com.huatek.dictionary.entity.FwDictionary;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
/**
 * 系统数据字典的service.
 * @author winner pan
 *
 */
public interface DictionaryService extends BaseService {


	/**
	 * 获取某个系统的全部数据字典列表.
	 * @return 返回字典类型对象列表.
	 */
	List<FwDictionary> loadAllFwDictionaryList(String systemCode);
	/**
	 * 根据ID获取字典对象.
	 * @param propertyDicId 字典对象ID
	 * @return 返回属性字典对象
	 */
	FwDictionary getFwDictionary(Long dictionaryId);
	/**
	 * 数据字典值分页查询.
	 * @param pageBean 分页对象
	 * @param paramterList 参数列表
	 * @return 返回分页数据
	 */
	CutPageBean getFwDictionaryPageBean(Long categoryId,CutPageBean pageBean, List<CommonBean> paramterList);



	/***
	 * 获取所有字典信息Map.
	 * @param systemCode 系统编码.
	 */
	Map<String,FwDictionary> loadAllDictionaryMap(String systemCode);

	/***
	 * 获取某个字典的明细信息.
	 * @param categoryCode 目录编码.
	 */
	List<FwDictionary> loadCategoryDictionary(String categoryCode);

	/***
	 * 刷新缓存数据.
	 * @param isLocal 是否本地刷新.
	 */
	void flushCache(boolean isLocal);
	/**
     * 修改状态.
     *
     * @param ids 品牌ID
     * @param statuss 状体
     */
    void conditionAll(Long[] ids, String statuss);
    /**
     *新增或者修改字典的值.
     * @param fwDictionary
     * @return
     */
    int saveOrUpdateFwDictionary(final FwDictionary fwDictionary);
}
