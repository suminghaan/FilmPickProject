package com.fp.admin.controller.ad_customer_center;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.CustomerCenterService;
import com.fp.admin.model.vo.Admin;

/**
 * Servlet implementation class AdminInquiryUpdateController
 */
@WebServlet("/adupdate.iq")
public class AdminInquiryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInquiryUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inquiryAnswer = request.getParameter("inquiryAnswer");
		int adminNo = ((Admin)request.getSession().getAttribute("loginAdmin")).getAdminNo();
		int inqryNo = Integer.parseInt(request.getParameter("inqryNo"));
		int result = new CustomerCenterService().updateInquiryAnswer(inquiryAnswer, adminNo, inqryNo);

		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/list.iq?page=1");
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
