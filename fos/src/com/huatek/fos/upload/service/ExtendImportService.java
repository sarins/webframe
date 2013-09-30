package com.huatek.fos.upload.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.huatek.framework.tag.CommonBean;

public interface ExtendImportService extends ImportService {
	InfoBean validateData(final MultipartFile uploadFile,
			List<CommonBean> parameterList) throws Exception;
}
