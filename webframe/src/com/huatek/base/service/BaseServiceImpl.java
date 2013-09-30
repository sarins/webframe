package com.huatek.base.service;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.hql.FilterTranslator;
import org.hibernate.hql.QueryTranslatorFactory;
import org.hibernate.impl.SessionFactoryImpl;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.Util;

@Service
public class BaseServiceImpl implements BaseService {
	// private static final Logger logger =
	// Logger.getLogger(BaseServiceImpl.class);

	@Resource(name = "hibernateTemplate")
	protected HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public SessionFactory getSessionFactory() {
		return hibernateTemplate.getSessionFactory();
	}

	/**
	 * delete a object which HBM configuration file contains all-delete-orphan
	 * Must get it from database
	 * **/
	public void delete(Object obj) {
		hibernateTemplate.delete(obj);
	}

	public void save(Object obj) {
		hibernateTemplate.save(obj);
	}

	public void saveOrupdate(Object obj) {
		hibernateTemplate.saveOrUpdate(obj);

	}

	public void merge(Object obj) {
		hibernateTemplate.merge(obj);
	}

	public void update(Object obj) {
		hibernateTemplate.update(obj);
	}

	public void deleteAll(Collection<?> Objects) {
		hibernateTemplate.deleteAll(Objects);
	}

	@SuppressWarnings("unchecked")
	public boolean isDuplicate(String hsql, Object[] param, Long id) {
		List<? extends BaseEntity> list = hibernateTemplate.find(hsql, param);
		if (list.size() > 1) {
			return true;
		}
		if (list.size() == 1) {
			BaseEntity inputBean = list.get(0);
			if (id == null) {
				return true;
			}
			if (id.longValue() != inputBean.getId().longValue()) {
				return true;
			}
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public List findDatasByIds(Class<? extends BaseEntity> entityClass,
			Long[] ids) {
		String param = CommonUtil.getIdSQLParam(ids);
		if (param != null) {
			return hibernateTemplate.find("from " + entityClass.getName()
					+ " t where t.id in (" + param + ")", ids);
		}
		return null;
	}

	public Object getObjectById(Class<? extends BaseEntity> entityClass, Long id) {
	    BaseEntity baseEntity = (BaseEntity)hibernateTemplate.get(entityClass, id);
	    if(baseEntity==null){
	        throw new BusinessRuntimeException("error.data.deleted");
	    }
	    return baseEntity;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	/**
	 * 查询锁定对象字段数据库中最新值.
	 * @param entityClass 对象Class
	 * @param id	主键
	 * @param fieldName 锁定对象字段名
	 * @return 对象
	 */
	public String getObjectByIdLock(Class<? extends BaseEntity> entityClass, Long id, String fieldName) {
		 //HQL转SQL
		 SessionFactoryImpl sfi = (SessionFactoryImpl) this.getSessionFactory();
		 String hql = "select t." + fieldName + " from " + entityClass.getName() + " t where t.id=" + id;
		 QueryTranslatorFactory qtf = sfi.getSettings().getQueryTranslatorFactory();
		 FilterTranslator qt = qtf.createFilterTranslator(hql, hql, null, sfi);
		 qt.compile(null, false);
		 Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(qt.getSQLString() + " for update");
		 List<Object> objectValues = query.list();
		 if (objectValues!=null&&objectValues.size() > 0) {

			 return Util.getString(objectValues.get(0));
		 }
		 return "";
	}

	public Object executeProcedure(String callSql,
			CallBackStatement callBackStatement) throws SQLException {
		/***
		 * ConnectionProvider cp = ((SessionFactoryImplementor)getSessionFactory()).getConnectionProvider();
		   Connection conn = cp.getConnection();
		 */
		Connection conn = getSessionFactory().getCurrentSession().connection();
		CallableStatement call = null;
		try {
			call = conn.prepareCall(callSql);
			return callBackStatement.inStatement(call);
		} finally {
			if (call != null) {
				call.close();
			}

		}
	}

	public void clearSession(){
		this.getSessionFactory().getCurrentSession().clear();
	}


}
