package com.fp.inquiry.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fp.common.model.vo.Attachment;
import com.fp.common.template.MyFileRenamePolicy;
import com.fp.inquiry.model.service.InquiryService;
import com.fp.inquiry.model.vo.Inquiry;
import com.fp.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class InquiryInsertController
 */
@WebServlet("/inquiry.no")
public class InquiryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			/*-------------------------------------------------------------------------------------------------------*/
			String inqryTitle = multiRequest.getParameter("title");
			String inqryContent = multiRequest.getParameter("content");
			
			HttpSession session = request.getSession();
			int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			
			Inquiry in = new Inquiry();
			in.setInqryTitle(inqryTitle);
			in.setInqryContent(inqryContent);
			in.setMemNo(memNo);
			
			Attachment at = null;
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/upfiles/");
			}
			
			int result = new InquiryService().insertInquiry(in, at);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "1대1문의가 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/views/serviceCenter/inquiryList.jsp");
			}else {
				if(at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
				session.setAttribute("alertMsg", "1대1문의 등록을 실패하였습니다.");
				response.sendRedirect(request.getContextPath() + "/views/serviceCenter/inquiryList.jsp");
			}
			
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
