package com.huatek.framework.sso;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.exception.BusinessRuntimeException;
import com.huatek.framework.security.ClientInformationImpl;
import com.huatek.framework.service.GlobalVar;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.Constant;



@Controller
@RequestMapping("/sso.show")
public class SessionManagmentController {
	/***
	 * GSON 操作常量.
	 */
	public static final Gson GSON = new GsonBuilder().setDateFormat(
			"yyyy-MM-dd HH:mm:ss").create();
	public static final Map<String, Map<String, SubSystemSessionBean>> SSO_MAP = new HashMap<String, Map<String, SubSystemSessionBean>>();
	private Log logger = LogFactory.getFactory().getInstance(this.getClass().getName());
	/**
	 * 单点登录获取用户名对应的sessionId.
	 *
	 * @param model
	 *            Model对象
	 * @param request
	 *            Request对象
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(params = "actionMethod=ssoCheck")
	public String ssoCheck(final Model model, final HttpServletRequest request)
			throws IOException {
		String mainSessionID = request.getParameter("mainSysSessionId");
		HttpSession session = null;
		if(request.getSession().getId().equals(mainSessionID)){
			session = request.getSession();
		}
		/*HttpSession session = HuatekSessionContext.getInstance().getSession(
				mainSessionID);
		if(session==null ){

		}*/
		ResponseBean response = new ResponseBean();
		if (session != null) {
			response.setResultCode("1");
			response.setResultMsg("success");
			response.setSuccess(true);
			if("true".equals(request.getParameter("doLogin"))){
				FwAccount user = (FwAccount) session
						.getAttribute(ClientInformationImpl.LOGIN_ACCOUNT);
				response.setRetData(HttpClientUtil.serializableEntity(user));
				saveSubSysSession(mainSessionID,model,request);
			}
		} else {
			response.setResultCode("-1");
			response.setResultMsg("failure");
			response.setSuccess(false);
		}
		request.setAttribute(Constant.AJAX_OUT_DATA, GSON.toJson(response));
		return "frame/out_data.jsp";
	}

	/**
	 * 单点登录存放子系统的session信息.
	 *
	 * @param model
	 *            Model对象
	 * @param request
	 *            Request对象
	 * @return
	 * @throws IOException
	 */
	private void saveSubSysSession(String mainSysSession,final Model model,
			final HttpServletRequest request) throws IOException {
		// 子系统的sessionId
		String sessionId = request.getParameter("subSysSessionId");
		// 子系统的端口号
		String port = request.getParameter("port");
		// 子系统的工程名
		String path = request.getParameter("path");
		// 子系统的url
		String logoutUrl = request.getParameter("logoutUrl");
		// 子系统的ip
		String subIp = request.getParameter("subIp");
		// 获取主系统的sessionid
		SubSystemSessionBean subSysSession = new SubSystemSessionBean();
		subSysSession.setSessionId(sessionId);
		subSysSession.setUrl(logoutUrl);
		subSysSession.setIp(subIp);
		subSysSession.setPort(port);
		subSysSession.setPath(path);
		if (SSO_MAP.get(mainSysSession) == null) {
			// 存放所有子系统的系统列表
			Map<String, SubSystemSessionBean> subSysSessionMap = new HashMap<String, SubSystemSessionBean>();
			subSysSessionMap.put(mainSysSession, subSysSession);
			SSO_MAP.put(mainSysSession, subSysSessionMap);
		} else {
			SSO_MAP.get(mainSysSession).put(sessionId, subSysSession);
		}
	}

	@RequestMapping(params = "actionMethod=logout")
	public String logout(final HttpServletRequest request){
		HttpSession session = request.getSession();
		Map<String, SubSystemSessionBean> subSysSessionMap = SSO_MAP.get(session.getId());
		//循环将所有的子系统注销
		if(subSysSessionMap!=null&&subSysSessionMap.size()>0){
			Iterator<SubSystemSessionBean> it = subSysSessionMap.values().iterator();
			while(it.hasNext()){
				SubSystemSessionBean subSystem = it.next();
				String subSysUrl ="http://"+subSystem.getIp()+":"+subSystem.getPort()+subSystem.getPath()+subSystem.getUrl();
				try {
					List<NameValuePair> nameValuePairList = new ArrayList<NameValuePair>();
					nameValuePairList.add(new BasicNameValuePair("sessionId",subSystem.getSessionId()));
					logger.info(HttpClientUtil.postMethod(subSysUrl, nameValuePairList,subSystem.getSessionId()));
				} catch (Exception e) {
					logger.error(e.getMessage());
					e.printStackTrace();
				}
			}
		}
		//失效主系统session
		session.invalidate();
		//重定向到主系统的登录界面
		return "redirect:/";
	}
	@RequestMapping(params = "actionMethod=getToken")
	public String getToken(final HttpServletRequest request, final HttpServletResponse response) throws IOException{
		String oldUrl = request.getParameter("oldUrl");
		if(CommonUtil.isZeroLengthTrimString(oldUrl)){
			throw new BusinessRuntimeException("业务子系统没有传送本地URL请求地址");
		}
		oldUrl = java.net.URLDecoder.decode(oldUrl,GlobalVar.CHARSET_UTF_8);
		if(oldUrl.indexOf("?")<0){
			oldUrl = oldUrl + "?";
		}else{
			oldUrl = oldUrl + "&";
		}
		oldUrl=oldUrl+"tokenId="+request.getSession().getId();
		response.sendRedirect(oldUrl);
		return null;
	}
}
