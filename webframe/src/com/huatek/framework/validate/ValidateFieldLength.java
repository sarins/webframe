package com.huatek.framework.validate;

import java.nio.charset.Charset;

import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

public class ValidateFieldLength {
	/**
	 * Reject the given field with the given error code, error arguments and
	 * default message if the value is empty.
	 * <p>
	 * An 'empty' value in this context means either <code>null</code> or the
	 * empty string "".
	 * <p>
	 * The object whose field is being validated does not need to be passed in
	 * because the {@link Errors} instance can resolve field values by itself
	 * (it will usually hold an internal reference to the target object).
	 *
	 * @param errors
	 *            the <code>Errors</code> instance to register errors on
	 * @param field
	 *            the field name to check
	 * @param maxLength
	 *            the max length of the check field
	 * @param errorCode
	 *            the error code, interpretable as message key
	 * @param defaultMessage
	 *            fallback default message
	 */
	public static void validateMaxLength(Errors errors, String field,int maxLength,
			String errorCode,String defaultMessage) {
		Assert.notNull(errors, "Errors object must not be null");
		Object value = errors.getFieldValue(field);
		if(value == null || !StringUtils.hasLength(value.toString())){
			return;
		}
		if(value.toString().getBytes(Charset.forName("GBK")).length> maxLength){
			errors.rejectValue(field, errorCode,new Object[]{maxLength},defaultMessage);
		}
	}

	public static void validateMinLength(Errors errors, String field,int minLength,
			String errorCode,String defaultMessage) {
		Assert.notNull(errors, "Errors object must not be null");
		Object value = errors.getFieldValue(field);
		if(value == null || !StringUtils.hasLength(value.toString())){
			return;
		}
		if(value.toString().getBytes(Charset.forName("GBK")).length< minLength){
			errors.rejectValue(field, errorCode,new Object[]{minLength},defaultMessage);
		}
	}
}
