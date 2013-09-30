package com.huatek.framework.validate;

import java.beans.PropertyEditorSupport;
import java.lang.reflect.Method;

import com.huatek.base.entity.BaseEntity;
import com.huatek.framework.exception.BusinessRuntimeException;

public class BaseEntityEditor extends PropertyEditorSupport {
	private final Class<?> beanClass;
	private final boolean allowEmpty;
	/**
	 * @deprecated please use the public BaseEntityEditor(Class<? extends BaseEntity> beanClass)
	 * **/
	public BaseEntityEditor(Class<? extends BaseEntity> beanClass,
			boolean allowEmpty) throws IllegalArgumentException {
		if (beanClass == null) {
			throw new IllegalArgumentException(
					"Property class must be a subclass of Number");
		}
		this.beanClass = beanClass;
		this.allowEmpty = allowEmpty;
	}

	public BaseEntityEditor(Class<? extends BaseEntity> beanClass)
			throws IllegalArgumentException {
		if (beanClass == null) {
			throw new IllegalArgumentException(
					"Property class must be a subclass of Number");
		}
		this.beanClass = beanClass;
		this.allowEmpty = true;
	}

	public void setAsText(String text) {
		Object obj = null;
		try {
			if ((text == null || text.trim().length() == 0) && allowEmpty) {
				setValue(obj);
				return;
			}
			obj = beanClass.newInstance();
			Object value = Long.valueOf(text);
			Method setMethod = beanClass.getMethod("setId",
					new Class[] { Long.class });
			setMethod.invoke(obj, value);
		}  catch (Exception e) {
            throw new BusinessRuntimeException(e.getMessage(),e);
        }
		setValue(obj);
	}

	public String getAsText() {
		Object obj = getValue();
		if (obj == null) {
			return null;
		}
		if (!beanClass.isInstance(obj)) {
			return obj.toString();
		}
		try {
			Method getMethod = beanClass.getMethod("getId");
			Long id = (Long) getMethod.invoke(obj);
			if (id == null) {
				return null;
			}
			return id.toString();
		}  catch (Exception e) {
            throw new BusinessRuntimeException(e.getMessage(),e);
        }
	}
}
