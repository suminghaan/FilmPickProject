package com.fp.admin.controller.ad_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fp.admin.model.service.MemberService;
import com.fp.admin.model.vo.Admin;
import com.fp.admin.model.vo.ReportedMember;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String reason = request.getParameter("reason");
		int adminNo = ((Admin) session.getAttribute("loginAdmin")).getAdminNo();
		System.out.println(adminNo);
		
		
		ReportedMember rp = new ReportedMember();
		rp.setMemNo(memNo);
		rp.setLimitReason(reason);
		rp.setAdminNo(adminNo);
		
		int result1 = new MemberService().updateKickMember(rp);
		int result2 = new MemberService().insertKickMem(rp);
		

		if (result1 > 0) {
			session.setAttribute("alertMsg", "강제탈퇴가 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/rplist.me?page=1");
		} else {
			request.getSession().setAttribute("alertMsg", "강제탈퇴 실패했습니다.");
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
