package com.huatek.fos.upload;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.security.ClientInformationImpl;

/**
 * Servlet implementation class UploadProgressBarServlet.
 */
public class UploadProgressBarServlet extends HttpServlet {
	private static final int FULL_PERCENT = 100;
	/**
	 * Default serial version id.
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadProgressBarServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", -10);
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		FileUploadListener listener = null;
		StringBuffer buffy = new StringBuffer();
		boolean isFinish = false;
		long bytesRead = 0, contentLength = 0;
		String taskName = null;
		// Check to see if we've created the listener object yet
		listener = (FileUploadListener) session
				.getAttribute(FileUploadListener.SESSION_KEY);
		FwAccount user = (FwAccount) session
				.getAttribute(ClientInformationImpl.LOGIN_ACCOUNT);
		taskName = "文件上传";
		if (listener != null) {

			// Get the meta information
			bytesRead = listener.getBytesRead();
			contentLength = listener.getContentLength();
			if (bytesRead == contentLength) {
				session.setAttribute(FileUploadListener.SESSION_KEY, null);
			}

		} else if (user.getProcessBarBean() != null) {
			taskName = user.getProcessBarBean().getTaskName();
			bytesRead = user.getProcessBarBean().getFinishedNum();
			contentLength = user.getProcessBarBean().getTotalNum();
		} else {
			if (user.isBeginProcess()) {
				isFinish = true;
			} else {
				return;
			}
		}
		user.setBeginProcess(true);
		response.setContentType("text/xml");
		buffy.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
		buffy.append("<response>\n");
		buffy.append("\t<process_name>" + taskName + "</process_name>\n");
		buffy.append("\t<bytes_read>" + bytesRead + "</bytes_read>\n");
		buffy.append("\t<content_length>" + contentLength
				+ "</content_length>\n");
		// Check to see if we're done
		if (isFinish) {
			user.setBeginProcess(false);
			buffy.append("\t<finished/>");
		} else {
			// Calculate the percent complete
			long percentComplete = contentLength > 0 ? ((FULL_PERCENT * bytesRead) / contentLength)
					: 0;
			buffy.append("\t<percent_complete>" + percentComplete
					+ "</percent_complete>\n");
		}
		buffy.append("</response>\n");
		out.println(buffy.toString());
		out.flush();
		out.close();
	}

}
