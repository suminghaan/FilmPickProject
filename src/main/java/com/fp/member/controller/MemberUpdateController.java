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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String memId = request.getParameter("memId");
		String memName = request.getParameter("memName");
		String nickname = request.getParameter("nickname");
		String memPwd = request.getParameter("memPwd");
		String memPhone = request.getParameter("memPhone");
		String memEmail = request.getParameter("memEmail");
		String prefGenre = request.getParameter("prefGenre");
		
		Member m = new Member(memId, memName, nickname, memPwd, memPhone, memEmail, prefGenre);
		
		Member updateMem = new MemberService().updateMember(m);
		
		if(updateMem == null) { // 실패	
			request.getSession().setAttribute("alertMsg", "회원정보 수정에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/myPage.me");
			
		}else { // 성공
			System.out.println("성공");
			// 마이페이지 / 알람문구("성공적으로 회원정보 변경되었습니다.")
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "성공적으로 회원정보 변경되었습니다.");
			session.setAttribute("loginUser", updateMem);
			
			response.sendRedirect(request.getContextPath() + "/myPage.me");
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
