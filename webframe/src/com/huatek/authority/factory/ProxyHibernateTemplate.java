package com.huatek.authority.factory;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

/****
 * 代理Spring hibernate template. 做权限校验.
 *
 * @author winner pan
 *
 */
public class ProxyHibernateTemplate extends HibernateTemplate {
	/**
	 * 日志记录器.
	 */
	/*
	 * private static final Logger LOGGER = Logger
	 * .getLogger(ProxyHibernateTemplate.class);
	 */
	/***
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public List find(final String queryString) {
		// String hsql = DataAuthority
		// .getAuthorityString(queryString, super.getSessionFactory());
		return this.find(queryString, null);
	}

	/***
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public List find(final String queryString, final Object value) {
		return find(queryString, new Object[]{value});
	}

	/***
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public List find(final String queryString, final Object[] value) {
		String hsql = DataAuthority.getAuthorityString(queryString, super
				.getSessionFactory());
		return super.find(hsql, value);
	}

	/***
	 * {@inheritDoc}
	 */
	public Serializable save(final Object obj) {

		Serializable serilize = super.save(obj);
		DataAuthority.checkAuthority(obj, super.getSessionFactory(),true);
		return serilize;
	}

	/***
	 * {@inheritDoc}
	 */
	public void update(final Object obj) {
		super.update(obj);
		DataAuthority.checkAuthority(obj, super.getSessionFactory(),true);
	}

	/***
	 * {@inheritDoc}
	 */
	public void saveOrUpdate(final Object obj) {
		super.saveOrUpdate(obj);
		DataAuthority.checkAuthority(obj, super.getSessionFactory(),true);
	}

	/***
	 * {@inheritDoc}
	 */
	public Object merge(final Object obj) {
		Object mergeObj = super.merge(obj);
		DataAuthority.checkAuthority(mergeObj, super.getSessionFactory(),true);
		return mergeObj;
	}

	/***
	 * {@inheritDoc}
	 */
	public void delete(final Object obj) {
		super.delete(obj);
		DataAuthority.checkDelete(obj, super.getSessionFactory());
		DataAuthority.checkAuthority(obj, super.getSessionFactory(),true);
	}

	/***
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public void deleteAll(final Collection entities) {
		for (Object entity : entities) {
			DataAuthority.checkDelete(entity, super.getSessionFactory());
			DataAuthority.checkAuthority(entity, super.getSessionFactory(),true);
		}
		super.deleteAll(entities);
	}

	/***
	 * {@inheritDoc}
	 */
	@SuppressWarnings("unchecked")
	public Object get(final Class entityClass, final Serializable id) {
		Object obj = super.get(entityClass, id);
		DataAuthority.checkAuthority(obj, super.getSessionFactory(),false);
		return obj;

	}
}
