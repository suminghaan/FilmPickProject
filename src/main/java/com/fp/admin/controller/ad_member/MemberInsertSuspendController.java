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
 * Servlet implementation class MemberInsertSuspendController
 */
@WebServlet("/insertsuspend.me")
public class MemberInsertSuspendController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertSuspendController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int memNo = Integer.parseInt(request.getParameter("hiddenMemNo"));
		String reason = request.getParameter("hiddenReason");
		int adminNo = ((Admin) session.getAttribute("loginAdmin")).getAdminNo();
		int date = Integer.parseInt(request.getParameter("suspendDate"));
		
		System.out.println(memNo + " " + reason + " " + adminNo + " " + date);
		ReportedMember rp = new ReportedMember();
		rp.setMemNo(memNo);
		rp.setLimitReason(reason);
		rp.setAdminNo(adminNo);
		rp.setEndDateNum(date - 1);
		
		int result = new MemberService().insertReportedMem(rp);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "활동중지 처리가 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/rplist.me?page=1");
		} else {
			
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
