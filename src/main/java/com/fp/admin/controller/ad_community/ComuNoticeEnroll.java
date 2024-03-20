package com.fp.admin.controller.ad_community;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fp.admin.model.service.CommunityService;
import com.fp.admin.model.vo.Admin;
import com.fp.admin.model.vo.Notice;
import com.fp.common.model.vo.Attachment;
import com.fp.common.template.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ComuNoticeEnroll
 */
@WebServlet("/insert.co")
public class ComuNoticeEnroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComuNoticeEnroll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String noticeTitle = multiRequest.getParameter("noticeTitle");
			String noticeContent = multiRequest.getParameter("noticeContent");
			String category = multiRequest.getParameter("noticeCategory");
			String noticeFix = multiRequest.getParameter("noticeFix");
			
			HttpSession session = request.getSession();
			int adminNo = ((Admin)session.getAttribute("loginAdmin")).getAdminNo();
			
			Notice n = new Notice();
			n.setNoticeTitle(noticeTitle);
			n.setNoticeContent(noticeContent);
			n.setNoticeCategory(category);
			n.setNoticeWriter(String.valueOf(adminNo));
			n.setNoticeFix(noticeFix);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/upfiles/");
			}
			
			int result = new CommunityService().insertNotice(n, at);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "공지사항이 성공적으로 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.co?page=1");
			}else {
				if(at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
				session.setAttribute("alertMsg", "공지사항 등록 실패. \n다시 입력해주세요.");
				response.sendRedirect(request.getContextPath() + "/insert.co");
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
