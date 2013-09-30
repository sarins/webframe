package com.huatek.framework.hibernate;

import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.orm.hibernate3.SessionHolder;
import org.springframework.orm.hibernate3.support.OpenSessionInViewInterceptor;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.context.request.WebRequest;

import com.huatek.framework.security.ThreadLocalClient;

public class SessionInterceptor extends OpenSessionInViewInterceptor{
	/**
     * Unbind the Hibernate Session from the thread and closes it (in single session
     * mode), or process deferred close for all sessions that have been opened
     * during the current request (in deferred close mode).
     * @see org.springframework.transaction.support.TransactionSynchronizationManager
     */
    public void afterCompletion(WebRequest request, Exception ex)
            throws DataAccessException {
        String participateAttributeName = getParticipateAttributeName();
        Integer count = (Integer) request.getAttribute(
                participateAttributeName, WebRequest.SCOPE_REQUEST);
        if (count != null) {
            // Do not modify the Session: just clear the marker.
            if (count.intValue() > 1) {
                request.setAttribute(participateAttributeName,
                        Integer.valueOf(count.intValue() - 1),
                        WebRequest.SCOPE_REQUEST);
            } else {
                request.removeAttribute(participateAttributeName,
                        WebRequest.SCOPE_REQUEST);
            }
        } else {
            if (isSingleSession()) {
                // single session mode
                SessionHolder sessionHolder = (SessionHolder) TransactionSynchronizationManager
                        .unbindResource(getSessionFactory());
                logger
                        .debug("Closing single Hibernate Session in OpenSessionInViewInterceptor");
                /***
                 * begin add by winner pan 2013-04-24
                 */
                sessionHolder.getSession().clear();
                /***
                 * end add by winner pan 2013-04-24
                 */
                SessionFactoryUtils.closeSession(sessionHolder
                        .getSession());
            } else {
            	/***
                 * begin add by winner pan 2013-04-24
                 */
            	getSessionFactory().getCurrentSession().clear();
                /***
                 * end add by winner pan 2013-04-24
                 */
                // deferred close mode
                SessionFactoryUtils
                        .processDeferredClose(getSessionFactory());
            }
        }
    }
}
