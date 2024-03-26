package com.fp.admin.controller.ad_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.MemberService;

/**
 * Servlet implementation class ReportMemberKickController
 */
@WebServlet("/reportkick.me")
public class ReportMemberKickController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportMemberKickController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 실행됐구욤");
		String userId = request.getParameter("userId");
		
		int result = new MemberService().updateKickMember(userId);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", userId + "님의 강제탈퇴가 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/rplist.me?page=1");
		} else {
			request.getSession().setAttribute("alertMsg", userId + "님의 강제탈퇴 실패했습니다.");
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
