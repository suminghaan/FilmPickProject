package com.fp.inquiry.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.common.model.vo.Attachment;
import com.fp.inquiry.model.service.InquiryService;
import com.fp.inquiry.model.vo.Inquiry;

/**
 * Servlet implementation class InquiryDetailController
 */
@WebServlet("/detail.in")
public class InquiryDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inqryNo = Integer.parseInt(request.getParameter("no"));
		InquiryService iService = new InquiryService();
		System.out.println("문의사항번호 : " + inqryNo);
		
		Inquiry inqu = iService.selectInquiry(inqryNo);
		Attachment at = iService.selectAttachment(inqryNo);
//		System.out.println("서비스, dao단에서 전부 처리해서 받아온 Inquiry : " + inqu);
//		System.out.println("서비스, dao단에서 전부 처리해서 받아온 Attachment : " + at);
		request.setAttribute("inqu", inqu);
		request.setAttribute("at", at);
		request.getRequestDispatcher("/views/serviceCenter/inquiryContent.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
