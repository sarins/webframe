package com.huatek.framework.show;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.huatek.authority.service.DataAuthorityService;
import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.security.ClientInformationImpl;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.service.GlobalVar;
import com.huatek.framework.service.LoginService;

@Controller
@RequestMapping("/login.do")
public class LoginController {
	private static final String REDIRECT_MODULE_SHOW = "redirect:menu.do?actionMethod=getMenu";
	@Autowired
	private LoginService loginService;
	@Autowired
	private DataAuthorityService dataAuthorityService;

	@RequestMapping(params="actionMethod=doLogin",method = RequestMethod.POST)
	public String doLogin(final HttpSession session, final HttpServletRequest request) throws UnsupportedEncodingException {
		//get user
		FwAccount account = ThreadLocalClient.get().getOperator();
		//get user authority
		account = loginService.loadUserAuthority(account.getId());
		//使用数据权限
		account.setBaseUserAuthorityData(dataAuthorityService.getUserDataAuthority(account.getId()));
		ThreadLocalClient.get().setOperator(account);
		session.setAttribute(ClientInformationImpl.LOGIN_ACCOUNT, account);
		if(account.getUserMenuTree()!=null&&account.getUserMenuTree().size()>0&&account.getUserMenuTree().get(0).getSourceCode()!=null&&
				!account.getUserMenuTree().get(0).getSourceCode().equals("#")
				){
			String url = account.getUserMenuTree().get(0).getFwSystem().getSystemURL(request.getServerName(), request.getServerPort());
			if(!url.endsWith("/")){
				url+="/";
			}
			url+="menu.do?actionMethod=getMenu&menuId="+account.getUserMenuTree().get(0).getId();
			url+="&welcome="+java.net.URLEncoder.encode(account.getUserMenuTree().get(0).getSourceCode(),GlobalVar.CHARSET_UTF_8);
			return "redirect:"+url;
		}
		return REDIRECT_MODULE_SHOW;
	}
}
