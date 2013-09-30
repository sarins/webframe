package com.huatek.framework.sso;

/***
 *消息响应实体.
 *
 * @author winner pan
 *
 */
public class ResponseBean implements java.io.Serializable {

	/**
	 *序列化常量.
	 */
	private static final long serialVersionUID = 1L;
	/***
	 * 响应代码.
	 */
	private String resultCode;
	/***
	 * 响应数据.
	 */
	private String retData;
	/****
	 * 是否成功.
	 */
	private boolean success;
	/***
	 * 响应信息.
	 */
	private String resultMsg;
	/***
	 * 接口状态.
	 */
	private String status;



	public String getResultCode() {
		return resultCode;
	}

	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}

	public String getRetData() {
		return retData;
	}

	public void setRetData(String retData) {
		this.retData = retData;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getResultMsg() {
		return resultMsg;
	}

	public void setResultMsg(String resultMsg) {
		this.resultMsg = resultMsg;
	}

	public ResponseBean() {

	}

	public ResponseBean(final String resultCode, final String resultMsg,
			final boolean success) {
		this.resultCode = resultCode;
		this.resultMsg = resultMsg;
		this.success = success;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


}
