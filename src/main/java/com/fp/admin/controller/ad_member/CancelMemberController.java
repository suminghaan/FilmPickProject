package com.fp.admin.controller.ad_member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.MemberService;
import com.fp.admin.model.vo.CancelMember;
import com.google.gson.Gson;

/**
 * Servlet implementation class CancelMemberController
 */
@WebServlet("/cmlist.me")
public class CancelMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userId = request.getParameter("userId");
		String sDate = request.getParameter("start_date");  // "2020-12-02"
		String eDate = request.getParameter("end_date");
		
		
		
		List<CancelMember> cml = new MemberService().cancelMemList(userId, sDate, eDate);
		
		System.out.println(cml);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(cml, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
