package com.fp.admin.controller.ad_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.MemberService;
import com.fp.member.model.vo.Member;

/**
 * Servlet implementation class MemberListController
 */
@WebServlet("/updateLevel.me")
public class MemberListController extends HttpServlet { 
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberListController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { // '회원조회' 페이지에서 회원의 등급을 수정하는 서블릿 (Update)
		// userNo가 굳이 필요할까?
		// int userNo = Integer.parseInt(request.getParameter("userNo"));
		String userId = request.getParameter("userId");
		int userLevel = Integer.parseInt(request.getParameter("userLevel"));

		Member m = new Member();
		// m.setMemNo(userNo);
		m.setMemId(userId);
		m.setMemLevel(userLevel);

		int result = new MemberService().updateUserLevel(m);

		if (result > 0) {
			request.getSession().setAttribute("alertMsg", "회원등급 수정이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/updateLevel.me");
		} else {
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
