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
 * Servlet implementation class MemberLevelUpdateController
 */
@WebServlet("/updatelevel.me")
public class MemberLevelUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLevelUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String userId = request.getParameter("userId"); 
		  int userLevel = Integer.parseInt(request.getParameter("userLevel"));
		  System.out.println(userId + " " + userLevel);
		  int result = new MemberService().updateUserLevel(userId, userLevel);
		  
		  if (result > 0) { 
			  request.getSession().setAttribute("alertMsg", "회원등급 수정이 완료되었습니다.");
			  response.sendRedirect(request.getContextPath() + "/list.bo?memId=" + userId + "&page=1"); 
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
