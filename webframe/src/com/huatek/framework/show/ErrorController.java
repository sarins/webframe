package com.huatek.framework.show;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error.show")
public class ErrorController {
	@RequestMapping(params = "actionMethod=show")
	public String show(final Model model, final HttpServletRequest request) {
		return "frame/show_error.jsp";
	}

}
