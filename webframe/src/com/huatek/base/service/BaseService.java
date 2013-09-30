package com.huatek.base.service;

import java.sql.SQLException;
import java.util.Collection;
import java.util.List;

import com.huatek.base.entity.BaseEntity;

public interface BaseService {
	 void save(Object obj);

	 void update(Object obj);

	 void saveOrupdate(Object obj);

	 void merge(Object obj);

	 void delete(Object obj);

	 void deleteAll(Collection<?> Objects);

	 boolean isDuplicate(String hsql,Object[] param,Long id);

	@SuppressWarnings("unchecked")
	 List findDatasByIds(Class<? extends BaseEntity> entityClass, Long[] ids);

	Object getObjectById(Class<? extends BaseEntity> entityClass,Long id);
	/**
	 * 查询锁定对象字段数据库中最新值.
	 * @param entityClass 对象Class
	 * @param id	主键
	 * @param fieldName 锁定对象字段名
	 * @return 对象
	 */
	String getObjectByIdLock(Class<? extends BaseEntity> entityClass, Long id, String fieldName);
	/***
	 * 执行调用存储过程的回调方法.
	 * @param callSql 调用存储过程的语句.
	 * @param callBackStateMent 执行回调接口
	 * @return
	 * @throws SQLException
	 */
	Object executeProcedure(final String callSql,
			CallBackStatement callBackStatement) throws SQLException;
	/***
	 * 清空session 缓存.
	 */
	void clearSession();

}
