package com.fp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.fp.member.model.service.MemberService;
import com.fp.member.model.vo.Member;
import com.fp.admin.model.service.AdminService;
import com.fp.admin.model.vo.Admin;

/**
 * Servlet implementation class AdminSignupcontroller
 */
@WebServlet("/insert.ad")
public class AdminSignupcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSignupcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
			request.setCharacterEncoding("UTF-8");
				
				String adminId = request.getParameter("adminId");
				String adminPwd = request.getParameter("adminPwd"); 
				String adminName = request.getParameter("adminName"); 
				String phone = request.getParameter("adminphone"); 
				
				Admin a = new Admin(adminId, adminPwd, adminName, phone);
			
				int result = new AdminService().insertAdmin(a);
			
				if(result > 0) { // 성공했을경우					
					
					HttpSession session = request.getSession();
					session.setAttribute("alertMsg", "관리자 회원가입이 완료되었습니다.");
					
					response.sendRedirect(request.getContextPath()+"/main.ad");
					
					
				}else {// 실패했을경우
					
					HttpSession session = request.getSession();
					session.setAttribute("alertMsg", "회원가입 실패 다시 시도하십시오.");
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
