package com.huatek.fos.upload.service;

import org.springframework.web.multipart.MultipartFile;

public interface ImportService {
	InfoBean validateData(final MultipartFile uploadFile) throws Exception;

	void importData(final InfoBean uploadInfoBean) throws Exception;
}
