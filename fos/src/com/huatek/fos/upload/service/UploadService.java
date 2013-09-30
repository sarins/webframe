package com.huatek.fos.upload.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.huatek.framework.tag.CommonBean;

/**
 * 导入服务类. 完成导入相关操作接口.
 * 
 * @author leon_zhang
 */
public interface UploadService {
	/**
	 * 执行导入.
	 * 
	 * @param uploadFile
	 *            导入文件
	 * @param from
	 *            参数值
	 * @return InfoBean 返回信息对象
	 * @throws Exception
	 *             抛出异常信息
	 */
	InfoBean doImport(MultipartFile uploadFile, String from,
			List<CommonBean> parameterList) throws Exception;

	/**
	 * 执行上传.
	 * 
	 * @param uploadFile
	 *            上传文件
	 * @param from
	 *            参数值
	 * @return InfoBean 返回信息对象
	 * @throws Exception
	 *             抛出异常信息
	 */
	InfoBean doUpload(MultipartFile uploadFile, String type, String orgId)
			throws Exception;
}
