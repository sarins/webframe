package com.huatek.framework.service;

import java.util.List;
import org.springframework.orm.hibernate3.HibernateTemplate;
import com.huatek.base.service.TreeNodeServiceImpl;
import com.huatek.base.tree.TreeUtil;
import com.huatek.framework.entity.FwGroup;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.GlobalFilterManagement;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.tag.CutPageBean;
import com.huatek.framework.tag.QueryPageBean;

public class GroupServiceImpl extends TreeNodeServiceImpl implements GroupService{

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		super.hibernateTemplate = hibernateTemplate;
	}
	public synchronized boolean saveGroup(FwGroup group) {
		if(!isDuplicate("From FwGroup t where t.name=?",new Object[]{group.getName()},group.getId())){
			TreeUtil.setLeveAndStyle(group, super.getHibernateTemplate());
			if(group.getId()==null){
				save(group);
			}else{
				merge(group);
			}
			return true;
		}
		return false;
	}

	/*@SuppressWarnings("unchecked")
	public List<FwGroup> getPermitGroups() {
		String sql = "from FwGroup t where t.status='A'";
		return hibernateTemplate.find(sql+" and ("+QueryCondition.getGroupFilter(ThreadLocalClient.get().getPermitGroup(), "parent")+") order by t.style asc");
	}*/

	public FwGroup getGroupById(Long groupId) {
	    FwGroup fwGroup=(FwGroup)hibernateTemplate.get(FwGroup.class, groupId);
		if(fwGroup==null){
            throw new BusinessRuntimeException("error.data.deleted");
        }
		return fwGroup;
	}
	public CutPageBean getGroupPageBean(CutPageBean pageBean,
			List<CommonBean> paramterList) {
		String queryCondition = " 1=1 ";
		String totalRowsHsql = " select count(t) from FwGroup t where"+queryCondition;
		String resultSql = "from FwGroup t where "+queryCondition;
		return QueryPageBean.getQueryPageBean(hibernateTemplate, totalRowsHsql, resultSql,"order by t.parent.style asc", pageBean,paramterList);

	}

	@SuppressWarnings("unchecked")
	public List<FwGroup> getGroupParents(Long sourceId) {
		if(sourceId==null){
			return hibernateTemplate.find("from FwGroup t where t.status='A' order by t.style asc");
		}else{
			FwGroup source = (FwGroup)hibernateTemplate.get(FwGroup.class, sourceId);
			return hibernateTemplate.find("from FwGroup t where t.status='A' and t.style not like '"+source.getStyle().substring(0,2*source.getLevel())+"%' order by t.style asc");
		}

	}

    /***
     *获取普通用户组信息List
     */
    @SuppressWarnings("unchecked")
    public List<FwGroup> getFilterGroupList() {
        String condition = GlobalFilterManagement.getGroupFilter("t");
        String queryString = "from FwGroup t where t.status='A' and" + condition;
        return hibernateTemplate.find(queryString);
    }

}
