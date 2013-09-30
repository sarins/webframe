package com.huatek.fos.upload;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;

/***
 * Extend Spring framework CommonsMultipartResolver. aim to add the file upload
 * listener.
 * 
 * @author Winner_pan
 * 
 */

public class RoutesMultipartResolver extends CommonsMultipartResolver {
	/*
	 * private ProgressListener progressListener;
	 * 
	 * public void setProgressListener(ProgressListener progressListener) {
	 * this.progressListener = progressListener; }
	 */
	/***
	 * @param request
	 *            HttpServletRequest
	 * @return MultipartHttpServletRequest
	 */
	@SuppressWarnings("unchecked")
	public MultipartHttpServletRequest resolveMultipart(
			final HttpServletRequest request) {
		String encoding = determineEncoding(request);
		FileUpload fileUpload = prepareFileUpload(encoding);
		// if (progressListener != null) {
		ProgressListener progressListener = new FileUploadListener();
		request.getSession().setAttribute(FileUploadListener.SESSION_KEY,
				progressListener);
		fileUpload.setProgressListener(progressListener);
		// }
		try {
			List fileItems = ((ServletFileUpload) fileUpload)
					.parseRequest(request);
			MultipartParsingResult parsingResult = parseFileItems(fileItems,
					encoding);
			return new DefaultMultipartHttpServletRequest(request,
					parsingResult.getMultipartFiles(),
					parsingResult.getMultipartParameters());
		} catch (FileUploadBase.SizeLimitExceededException ex) {
			throw new MaxUploadSizeExceededException(fileUpload.getSizeMax(),
					ex);
		} catch (FileUploadException ex) {
			throw new MultipartException(
					"Could not parse multipart servlet request", ex);
		}
	}
}
