package com.fp.admin.controller.ad_member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.MemberService;

/**
 * Servlet implementation class ReportMemberChangeDateController
 */
@WebServlet("/changeDate.re")
public class ReportMemberChangeDateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportMemberChangeDateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		String changeDate = request.getParameter("opValue");
		System.out.println("서블릿단에서의 memNo : " + memNo);
		System.out.println("서블릿단에서의 changeDate : " + changeDate);
		
		int result = 0;
		
		if(changeDate.equals("0")) {
			result = new MemberService().changeMemStatus(memNo);
		}else {
			result = new MemberService().changeDate(memNo, changeDate); // 회원 이용제한일 수정
		}
		
		if(result > 0) {
			response.getWriter().print(result);
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
