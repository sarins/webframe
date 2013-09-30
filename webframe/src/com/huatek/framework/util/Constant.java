package com.huatek.framework.util;

public interface Constant {
	 String VERIFY_CODE_NAME="verifyCode";
	 String FRAMEWORK_VERSION="version.framework";
	 String FORMAT_DATE_STYLE = "format.date.style";
	 String FORMAT_TIME_STYLE = "format.time.style";
	 /***
	  * 默认的系统编码.
	  */
	 String DEFAULT_SYSTEM_CODE = "default";
     /**
	  * 定义系统的title
	  */
	String SYS_TITLE="webframe管理系统";
	 /**
		 * 生效.
		 */
	 String STATUS_ACTIVE = "'A'";

	 /***
	  * AJAX 调用输出的内容名称.
	  * 使用request attribute.
	  */
	String AJAX_OUT_DATA = "_out_data";
	 /***
	  * AJAX 调用出错.
	  */
	String AJAX_ERROR = "_error_info";

	int VALIDATE_ERROR_CODE = 3000;

}
