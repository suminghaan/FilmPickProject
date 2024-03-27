package com.fp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fp.member.model.service.MemberService;
import com.fp.member.model.vo.Member;

/**
 * Servlet implementation class MemberSignupController
 */
@WebServlet("/insert.me")
public class MemberSignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memId = request.getParameter("memId");
		String memPwd = request.getParameter("memPwd");
		String memEmail =request.getParameter("memEmail");
		String nickname = request.getParameter("nickname");
		String memName = request.getParameter("memName");
		String memBirth = request.getParameter("memBirth");
		String memGender = request.getParameter("memGender");
		String memPhone = request.getParameter("memPhone");
		String prefGenre = request.getParameter("prefGenre");
		
		Member m = new Member(memId, memPwd, memEmail, nickname, memName, memBirth, memGender, memPhone, prefGenre);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			request.setAttribute("nickname", nickname);
			request.getRequestDispatcher("/views/mypage/memberSignupComplete.jsp").forward(request, response);
		
		}else {
			request.setAttribute("errorMsg", "회원가입에 실패했습니다. 다시 입력해주세요.");
			response.sendRedirect(request.getContextPath() + "/signupForm.me");
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
