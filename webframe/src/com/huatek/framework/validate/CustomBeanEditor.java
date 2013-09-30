package com.huatek.framework.validate;

import java.beans.PropertyEditorSupport;
import java.lang.reflect.Method;

import com.huatek.framework.exception.BusinessRuntimeException;

public class CustomBeanEditor extends PropertyEditorSupport {
	private final Class<?> beanClass;
	private final boolean allowEmpty;
	private final String idName;
	private final int idType;
	public static final int INTEGER_TYPE = 1;
	public static final int LONG_TYPE = 2;
	public static final int STRING_TYPE = 3;

	/**
	 * @deprecated please use the CustomBeanEditor(Class<?> beanClass,String idName,int idType)
	 * **/
	public CustomBeanEditor(Class<?> beanClass,String idName,int idType, boolean allowEmpty)
			throws IllegalArgumentException {
		if (beanClass == null) {
			throw new IllegalArgumentException(
					"Property class must be a subclass of Number");
		}
		this.beanClass = beanClass;
		this.allowEmpty = allowEmpty;
		this.idName = idName;
		this.idType = idType;
	}

	public CustomBeanEditor(Class<?> beanClass,String idName,int idType)
		throws IllegalArgumentException {
		if (beanClass == null) {
			throw new IllegalArgumentException(
					"Property class must be a subclass of Number");
		}
		this.beanClass = beanClass;
		this.allowEmpty = true;
		this.idName = idName;
		this.idType = idType;
	}

	public void setAsText(String text) {
		Object obj = null;
		try {
			if((text==null||text.trim().length()==0)&&allowEmpty){
				setValue(obj);
				return;
			}
			obj = beanClass.newInstance();
			Class<?>[] idClassType = null;
			Object value = null;
			switch(idType){
			case 1:
				idClassType = new Class[]{Integer.class};
				value = Integer.valueOf(text);
				break;
			case 2:
				idClassType = new Class[]{Long.class};
				value = Long.valueOf(text);
				break;
			default:
				idClassType = new Class[]{String.class};
				value = text;
			}
			String setIdMethod = "set"+idName.substring(0,1).toUpperCase()+idName.substring(1);
			Method setMethod = beanClass.getMethod(setIdMethod,idClassType);
			setMethod.invoke(obj, value);
		}  catch (Exception e) {
            throw new BusinessRuntimeException(e.getMessage(),e);
        }
		setValue(obj);
	}

	public String getAsText() {
		Object obj = getValue();
		if(obj==null){
			return null;
		}
		if(!beanClass.isInstance(obj)){
			return obj.toString();
		}
		String getIdMethod = "get"+idName.substring(0,1).toUpperCase()+idName.substring(1);
		try {
			Method getMethod = beanClass.getMethod(getIdMethod);
			obj = getMethod.invoke(obj);
			if(obj==null){
				return null;
			}
			return obj.toString();
		} catch (Exception e) {
			throw new BusinessRuntimeException(e.getMessage(),e);
		}
	}
}
