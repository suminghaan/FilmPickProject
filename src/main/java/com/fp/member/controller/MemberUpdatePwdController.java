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
 * Servlet implementation class MemberUpdatePwdController
 */
@WebServlet("/updatePwd.me")
public class MemberUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memPwd = request.getParameter("memPwd");
		String newPwd = request.getParameter("newPwd");
		
		HttpSession session = request.getSession();
		Member loginMember =(Member)session.getAttribute("loginUser");
		String memId = loginMember.getMemId();
		
		Member updateMem = new MemberService().updatePwdMember(memId, memPwd, newPwd);
		System.out.println(updateMem);
		if(updateMem == null) {		
			session.setAttribute("alertMsg","비밀번호 변경에 실패했습니다. 다시 입력해주세요.");
		}else {
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "성공적으로 비밀번호 변경되었습니다.");
		}
			response.sendRedirect(request.getContextPath() + "/myPage.me");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
