package com.huatek.dictionary.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.huatek.base.service.BaseServiceImpl;
import com.huatek.dictionary.entity.FwDictionary;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;

/**
 * 系统数据字典服务.
 * @author Winner pan
 *
 */
public class DictionaryServiceImpl extends BaseServiceImpl implements DictionaryService {

    public void flushCache(boolean isLocal) {

    }

    public FwDictionary getFwDictionary(Long dictionaryId) {
        return (FwDictionary) super.getObjectById(FwDictionary.class, dictionaryId);
    }

    public CutPageBean getFwDictionaryPageBean(Long categoryId, CutPageBean pageBean,
                                               List<CommonBean> paramterList) {
        String condition = "";
        if (categoryId != null) {
            condition = " where t.fwCategory.id=" + categoryId;
        }
        String totalRowsHsql = " select count(t) from FwDictionary t " + condition;
        String resultSql = "from FwDictionary t " + condition;
        return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql, resultSql,
            "order by t.id desc ", pageBean, paramterList);

    }

    @SuppressWarnings("unchecked")
    public List<FwDictionary> loadAllFwDictionaryList(String systemCode) {
        return super.hibernateTemplate.find(
            "from FwDictionary t where t.fwCategory.fwSystem.sysCode=?", systemCode);
    }

    /**
     * 修改状态.
     *
     * @param ids
     *            渠道ID
     * @param statuss
     *            状态
     */
    public void conditionAll(final Long[] ids, final String statuss) {
        for (int i = 0; i < ids.length; i++) {
            FwDictionary dic = (FwDictionary) getObjectById(FwDictionary.class, ids[i]);
            if (dic != null) {
                dic.setStatus(statuss);
                merge(dic);
            }
        }
    }

    public Map<String, FwDictionary> loadAllDictionaryMap(String systemCode) {
        List<FwDictionary> fwDictionaryList = loadAllFwDictionaryList(systemCode);
        Map<String, FwDictionary> fwDictionaryMap = new HashMap<String, FwDictionary>();
        for (FwDictionary fwDictionary : fwDictionaryList) {
            fwDictionaryMap.put(fwDictionary.getFwCategory().getCode()+"_"+fwDictionary.getCode(), fwDictionary);
        }
        return fwDictionaryMap;
    }

    public List<FwDictionary> loadCategoryDictionary(String categoryCode) {
        return super.hibernateTemplate.find("from FwDictionary t where t.fwCategory.code=? order by t.orderNum asc",
            categoryCode);
    }

    @Override
    public int saveOrUpdateFwDictionary(FwDictionary fwDictionary) {
        //如果编码重复
        if (isDuplicate("from FwDictionary t where t.code =? and t.fwCategory.id=?", new Object[] {
                fwDictionary.getCode(), fwDictionary.getFwCategory().getId() }, fwDictionary
            .getId())) {
            return 1;
        }
        /*//如果字典排序重复
        if (isDuplicate("from FwDictionary t where t.orderNum =? and t.fwCategory.id=?",
            new Object[] { fwDictionary.getOrderNum(), fwDictionary.getFwCategory().getId() },
            fwDictionary.getId())) {
            return 2;
        }*/
        if(fwDictionary.getId()==null){
            save(fwDictionary);
        }else{
            merge(fwDictionary);
        }
        return 0;
    }

}
