package com.fp.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.br.member.model.service.MemberService;
import com.br.member.model.vo.Member;

/**
 * Servlet implementation class AdminSignupcontroller
 */
@WebServlet("/insert.ad")
public class AdminSignupcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSignupcontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			
			request.setCharacterEncoding("UTF-8");
				
				String adminId = request.getParameter("adminId");
				String adminPwd = request.getParameter("adminPwd"); 
				String adminName = request.getParameter("adminName"); 
				String phone = request.getParameter("phone"); 
				
				Member m = new Member(adminId, adminPwd, adminName, phone);
			
			// 2) 요청 처리 (서비스 메소드 호출)
				int result = new MemberService().insertMember(m);
			
			// 3) 돌려받은 결과를 가지고 응답페이지 
				if(result > 0) { // 성공했을경우
					
					// 응답페이지 : index페이지
					// 응답데이터 : 성공메세지 "성공적으로 회원가입 되었습니다!" 알람문구
					// 			(포워딩 방식이 아니기 때문에 request에 담으면 안됨 => session에 담기)
					
					HttpSession session = request.getSession();
					session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다!");
					
					response.sendRedirect(request.getContextPath());
					
					
				}else {// 실패했을경우
					
					// 응답페이지 : /views/common/errorPage.jsp 에러페이지
					// 응답데이터 : 에러문구 (request)
					request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
					
					RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
					view.forward(request, response);
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
