package com.huatek.framework.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.HuatekSessionContext;

/**
 * Servlet implementation class Logout
 */
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logout() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		if(CommonUtil.isNotZeroLengthTrimString(request.getParameter("sessionId"))){
			session = HuatekSessionContext.getInstance().getSession(request.getParameter("sessionId"));
			if(session!=null){
				session.invalidate();
				HuatekSessionContext.getInstance().delSession(session);
				session = null;
			}else{
				request.getSession().invalidate();
			}
		}else{
			session = request.getSession();
			session.invalidate();
		}
		request.getRequestDispatcher("/").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
