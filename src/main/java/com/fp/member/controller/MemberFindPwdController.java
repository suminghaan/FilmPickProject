package com.fp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.member.model.service.MemberService;
import com.fp.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindPwdController
 */
@WebServlet("/findPwd.me")
public class MemberFindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = request.getParameter("memId");
		String memName = request.getParameter("memName");
		String memPhone = request.getParameter("memPhone");
		
		Member m = new MemberService().selectFindPwd(memId, memName, memPhone);
		
		request.setAttribute("m", m);
		
		request.getRequestDispatcher("/views/mypage/memberFindPwd.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
