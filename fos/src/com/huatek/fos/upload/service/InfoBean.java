package com.huatek.fos.upload.service;

import java.io.File;
import java.util.List;

import com.huatek.base.entity.BaseEntity;

public class InfoBean {

	private boolean isSuccess;

	private String errorMsg;

	private String infoMsg = "";

	private File file;

	private List<BaseEntity> data;

	public String getInfoMsg() {
		return infoMsg;
	}

	public void setInfoMsg(String infoMsg) {
		this.infoMsg = infoMsg;
	}

	public boolean isSuccess() {
		return isSuccess;
	}

	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public List<BaseEntity> getData() {
		return data;
	}

	public void setData(List<BaseEntity> data) {
		this.data = data;
	}

}
