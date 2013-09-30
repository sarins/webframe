package com.huatek.framework.service;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.huatek.base.service.TreeNodeServiceImpl;
import com.huatek.base.tree.TreeUtil;
import com.huatek.framework.entity.FwSource;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;

public class SourceServiceImpl  extends TreeNodeServiceImpl implements SourceService{

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		super.hibernateTemplate = hibernateTemplate;
	}
	public void saveSource(FwSource source){
			TreeUtil.setLeveAndStyle(source, super.getHibernateTemplate());
			this.merge(source);
	}

	@SuppressWarnings("unchecked")
	public List<FwSource> getMenuSources() {
		return hibernateTemplate.find("from FwSource t where t.status='A' and t.id>1 order by t.style asc");
	}

	public CutPageBean getSourcePageBean(CutPageBean pageBean,
			List<CommonBean> paramterList) {
		String queryCondition = " 1=1 ";
		String totalRowsHsql = " select count(t) from FwSource t where"+queryCondition;
		String resultSql = "from FwSource t where "+queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql, resultSql,"order by t.style asc", pageBean,paramterList);
	}

	@SuppressWarnings("unchecked")
	public List<FwSource> getAllSourceDataAsTree() {
		return hibernateTemplate.find("from FwSource t order by t.style asc");
	}

}
