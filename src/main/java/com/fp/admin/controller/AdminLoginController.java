package com.fp.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fp.admin.model.service.AdminService;
import com.fp.admin.model.vo.Admin;

/**
 * Servlet implementation class AdminLoginController
 */
@WebServlet("/login.ad")
public class AdminLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String adminId = request.getParameter("adminId");
		String adminPwd = request.getParameter("adminPwd");
		
		Admin a = new AdminService().loginAdmin(adminId, adminPwd);
		
		if(a == null) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "로그인 실패 다시 시도하십시오.");
		}else {
			HttpSession session = request.getSession(); 
			session.setAttribute("loginAdmin", a);
			response.sendRedirect(request.getContextPath()+"/main.ad");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
