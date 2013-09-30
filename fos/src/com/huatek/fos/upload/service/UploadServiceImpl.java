package com.huatek.fos.upload.service;

import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.huatek.base.entity.ProcessBarBean;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.exception.BusinessCheckException;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.util.Parameter;

/**
 * 上传导入服务类. 完成上传导入相关操作接口实现.
 * 
 * @author leon_zhang
 */
public class UploadServiceImpl implements UploadService {
	/**
	 * 文件服务.
	 */
	// @Autowired
	// private BaseDocumentService baseDocumentService;
	/**
	 * 自动注入服务类.
	 */
	@Resource(name = "hibernateTemplate")
	private HibernateTemplate hibernateTemplate;

	/**
	 * 导入服务.
	 */
	private Map<String, ImportService> importMap;
	/**
	 * 日志常量.
	 */
	private static final Logger LOGGER = Logger
			.getLogger(UploadServiceImpl.class);

	public void setImportMap(Map<String, ImportService> importMap) {
		this.importMap = importMap;
	}

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
	public InfoBean doImport(MultipartFile uploadFile, String from,
			List<CommonBean> parameterList) throws Exception {
		FwAccount user = (FwAccount) ThreadLocalClient.get().getOperator();
		user.setProcessBarBean(new ProcessBarBean("更新数据", 4, 0));
		// 获取导入服务
		ImportService importService = importMap.get(from);
		InfoBean uploadInfoBean = new InfoBean();
		try {
			user.getProcessBarBean().setFinishedNum(1);
			// 获取系统时间，执行数据校验，获取系统时间
			long validateStart = System.currentTimeMillis();

			if (importService instanceof ExtendImportService) {
				uploadInfoBean = ((ExtendImportService) importService)
						.validateData(uploadFile, parameterList);
			} else {
				uploadInfoBean = importService.validateData(uploadFile);
			}

			long validateEnd = System.currentTimeMillis();
			user.getProcessBarBean().setFinishedNum(2);
			// 执行导入
			if (uploadInfoBean.isSuccess()) {
				importService.importData(uploadInfoBean);
				user.getProcessBarBean().setFinishedNum(3);
				// 设置解析时间
				long importEnd = System.currentTimeMillis();
				BigDecimal parseTime = new BigDecimal(validateEnd
						- validateStart).divide(BigDecimal.valueOf(1000));
				BigDecimal importTime = new BigDecimal(importEnd - validateEnd)
						.divide(BigDecimal.valueOf(1000));
				uploadInfoBean.setInfoMsg("解析时间为=" + parseTime + "秒<br/> \n"
						+ "导入时间为：" + importTime + "秒<br/> \n"
						+ uploadInfoBean.getInfoMsg());
				uploadInfoBean.setSuccess(true);
				user.getProcessBarBean().setFinishedNum(4);
			}
		} catch (Exception e) {
			if (LOGGER.isDebugEnabled()) {
				e.printStackTrace();
			}
			LOGGER.error(e.getMessage());
			uploadInfoBean.setSuccess(false);
			uploadInfoBean.setErrorMsg(e.getMessage());
		} finally {
			user.setProcessBarBean(null);
		}
		return uploadInfoBean;
	}

	/**
	 * 执行导入.
	 * 
	 * @param uploadFile
	 *            导入文件
	 * @param type
	 *            类型
	 * @param orgId
	 *            id
	 * @throws Exception
	 *             抛出异常信息
	 */
	public InfoBean doUpload(final MultipartFile uploadFile, final String type,
			final String orgId) throws Exception {
		FwAccount user = (FwAccount) ThreadLocalClient.get().getOperator();
		user.setProcessBarBean(new ProcessBarBean("更新数据", 4, 0));
		InfoBean uploadInfoBean = new InfoBean();
		user.getProcessBarBean().setFinishedNum(1);
		// 获取系统配置路径
		String directory = Parameter.getInstance().getProp()
				.getProperty("upload.dir");
		File copyPath = new File(directory);
		if (!copyPath.exists()) {
			uploadInfoBean.setSuccess(false);
			uploadInfoBean.setErrorMsg("文件上传目录地址不存在。");
			user.setProcessBarBean(null);
			throw new BusinessRuntimeException("文件上传目录地址不存在。");
		}
		if (!copyPath.isDirectory()) {
			if (!copyPath.mkdirs()) {
				throw new BusinessRuntimeException("不能创建文件目录:" + directory);
			}
		}
		// 获取上传文件名称
		String uploadFileName = uploadFile.getOriginalFilename();
		// 上传文件隶属目录
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String dateStr = sdf.format(new Date());
		// 系统分隔符
		String SEP = System.getProperty("file.separator");
		// 文件目录
		StringBuffer tFilePath = new StringBuffer();
		if (type.equalsIgnoreCase("contract")) {
			tFilePath.append("customer" + SEP + orgId + SEP + "contract" + SEP
					+ dateStr + SEP);
		} else if (type.equalsIgnoreCase("invoice")) {
			// 其它类型上传路径
			// tFilePath.append("customer"+SEP+orgId+SEP+"invoice"+SEP+new
			// Date()+SEP);
		} else if (type.equalsIgnoreCase("order")) {
			// 新建零售单
			tFilePath.append("order" + SEP + orgId + SEP + "newSalesOrder"
					+ SEP + dateStr + SEP);
		} else if (type.equalsIgnoreCase("requestOrder")) {
			// 新建需求单
			tFilePath.append("requestOrder" + SEP + orgId + SEP
					+ "newRequestOrder" + SEP + dateStr + SEP);
		} else if (type.equalsIgnoreCase("logo")) {

			// 新建logo上传目录
			tFilePath.append("logo" + SEP);
		} else {
			uploadInfoBean.setSuccess(false);
			uploadInfoBean.setErrorMsg("没有找到相关类型。");
			user.setProcessBarBean(null);
			throw new BusinessRuntimeException("没有找到相关类型。");
		}
		user.getProcessBarBean().setFinishedNum(2);
		// 获取放置上传文件路径
		File uploadPath = new File(copyPath + SEP + tFilePath);
		if (!uploadPath.isDirectory()) {
			if (!uploadPath.mkdirs()) {
				uploadInfoBean.setSuccess(false);
				uploadInfoBean.setErrorMsg("上传文件目录不存在。");
				user.setProcessBarBean(null);
				throw new BusinessCheckException("上传文件目录不存在。");
			}
		}
		// 拷贝上传文件到指定文件目录下
		String filePath = uploadPath + SEP + UUID.randomUUID() + uploadFileName;
		FileCopyUtils.copy(uploadFile.getBytes(), new File(filePath));
		// // 得到上传文件后缀名
		// List<File> unzipFiles = new ArrayList<File>();
		// String ext = uploadFileName.substring(uploadFileName.lastIndexOf(".")
		// + 1).toLowerCase();
		// // 解压ZIP文件格式
		// if (ext.equalsIgnoreCase("zip")) {
		// unzipFiles = Util.unzip(filePath, uploadPath.getPath());
		// } else if (ext.equalsIgnoreCase("xml")) {
		// unzipFiles.add(new File(filePath));
		// } else {
		// throw new BusinessRuntimeException("上传文件格式不对");
		// }
		user.getProcessBarBean().setFinishedNum(3);
		// 保存文件名，路径
		// BaseDocument document = new BaseDocument();
		// document.setName(uploadFileName);
		// document.setPath(filePath);
		// document.setOrgId(Long.valueOf(orgId));
		// baseDocumentService.save(document);

		// 上传成功
		uploadInfoBean.setSuccess(true);
		user.getProcessBarBean().setFinishedNum(4);
		user.setProcessBarBean(null);
		return uploadInfoBean;
	}

}
