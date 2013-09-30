package com.huatek.fos.show;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.huatek.fos.upload.service.InfoBean;
import com.huatek.fos.upload.service.UploadService;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.tag.CommonBean;
import com.huatek.framework.util.QueryCondition;

/**
 * 本类完成文件上传工作.
 * 
 * @author leon_zhang
 * 
 */
@Controller
@RequestMapping("/upload.do")
public class FileUploadController {

	/**
	 * 日志常量.
	 */
	private static final Logger LOGGER = Logger
			.getLogger(FileUploadController.class);

	/**
	 * 上传服务接口.
	 */
	@Autowired
	private UploadService uploadService;

	/**
	 * 文件上传处理方法.
	 * 
	 * @param uploadFile
	 *            SpringMVC框架的MultipartFile对象
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @param from
	 *            上传文件来源标识
	 * @return 返回至文件上传完成页面
	 * @throws IOException
	 *             读写异常
	 */
	@RequestMapping(params = "actionMethod=upload", method = RequestMethod.POST)
	public String processUpload(
			@RequestParam("fileName") final MultipartFile uploadFile,
			final Model model, final String from,
			final HttpServletRequest request) throws IOException {

		InfoBean uploadInfoBean = null;
		// 调用服务处理文件上传逻辑
		try {
			List<CommonBean> parameterList = QueryCondition
					.getQueryCondition(request);

			uploadInfoBean = uploadService.doImport(uploadFile, from,
					parameterList);
			// 捕获异常记录至日志文件
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			if (uploadInfoBean == null) {
				uploadInfoBean = new InfoBean();
				uploadInfoBean.setErrorMsg(e.getMessage());
			}
		}

		// 将上传完成后的信息放入SpringMVC框架的Model对象中
		model.addAttribute("uploadInfoBean", uploadInfoBean);
		// 返回至文件上传完成信息页面
		return "upload/upload_info.jsp";
	}

	/**
	 * 文件上传初始化并返回文件上传页面.
	 * 
	 * @param model
	 *            SpringMVC框架的Model对象
	 * @param from
	 *            文件上传来源标识
	 * @return 返回文件上传页面
	 */
	@RequestMapping(params = "actionMethod=upload", method = RequestMethod.GET)
	public String upload(final Model model, final String from,
			final HttpServletRequest request) {
		// 将文件上传来源标识放入SpringMVC框架的Model对象中
		model.addAttribute("from", from);
		model.addAttribute("parameterId", request.getParameter("parameterId"));
		// 返回至文件上传页面
		return "upload/upload.jsp";
	}

	/**
	 * 跳转到文件上传页面.
	 * 
	 * @return 返回文件上传页面
	 */
	@RequestMapping(params = "actionMethod=simpleUpload", method = RequestMethod.GET)
	public String simpleUpload(HttpServletRequest request) {
		// 返回至文件上传页面
		request.setAttribute("type", request.getParameter("type"));
		request.setAttribute("orgId", request.getParameter("orgId"));
		return "upload/uploadFile.jsp";
	}

	/**
	 * 文件上传.
	 * 
	 * @return 返回至文件上传完成页面。
	 */
	@RequestMapping(params = "actionMethod=simpleUpload", method = RequestMethod.POST)
	public String doSimpleUpload(
			@RequestParam("fileName") final MultipartFile uploadFile,
			HttpServletRequest request) {
		// 返回至文件上传页面
		String orgId = request.getParameter("orgId");
		String type = request.getParameter("type");
		if (orgId == null || orgId.trim().length() == 0) {
			throw new BusinessRuntimeException("上传文件失败：请选择一条数据！");
		}
		if (type == null || type.trim().length() == 0) {
			throw new BusinessRuntimeException("上传文件失败：请指定上传类型！");
		}
		String fileName = uploadFile.getOriginalFilename();
		String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
		String pattern[] = { "xls", "xlsx", "doc", "docx", "ppt", "pdf", "txt",
				"csv", "zip", "rar", "png", "jpg", "jpeg", "bmp" };
		InfoBean uploadInfoBean = null;
		List<String> list = Arrays.asList(pattern);
		if (!list.contains(fileType)) {
			if (uploadInfoBean == null) {
				uploadInfoBean = new InfoBean();
				uploadInfoBean.setSuccess(false);
				uploadInfoBean.setErrorMsg("上传文件失败：不支持该文件类型！");
			}
		}

		if (uploadFile.getSize() > 52428800) {
			if (uploadInfoBean == null) {
				uploadInfoBean = new InfoBean();
				uploadInfoBean.setSuccess(false);
				uploadInfoBean.setErrorMsg("上传文件失败：文件大小不能超过50M！");
			}
		}
		if (uploadInfoBean != null && uploadInfoBean.getErrorMsg() != null
				&& uploadInfoBean.getErrorMsg().trim().length() > 0) {
			request.setAttribute("uploadInfoBean", uploadInfoBean);
			return "upload/upload_info.jsp";
		}
		// 调用服务处理文件上传逻辑
		try {
			uploadInfoBean = uploadService.doUpload(uploadFile, type, orgId);
			// 捕获异常记录至日志文件
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			if (uploadInfoBean == null) {
				uploadInfoBean = new InfoBean();
				uploadInfoBean.setErrorMsg(e.getMessage());
			}
		}
		request.setAttribute("uploadInfoBean", uploadInfoBean);
		return "upload/upload_info.jsp";
	}
}
