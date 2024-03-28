package com.fp.admin.controller.ad_customer_center;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.CustomerCenterService;

/**
 * Servlet implementation class NoMovieRequestDetailNoApproval
 */
@WebServlet("/noapproval.nm")
public class NoMovieRequestDetailNoApproval extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoMovieRequestDetailNoApproval() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("거절 서블릿 실행");
		String refuseReason = request.getParameter("refuseReason");
		
		int result = new CustomerCenterService().insertRefuseReason(refuseReason);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "거절 처리 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + )
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
