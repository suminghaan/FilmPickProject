package com.fp.admin.controller.ad_community;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fp.admin.model.service.CommunityService;
import com.fp.admin.model.vo.Notice;
import com.fp.common.model.vo.Attachment;
import com.fp.common.template.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ComuNoticeUpdateController
 */
@WebServlet("/update.aa")
public class ComuNoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComuNoticeUpdateController() {
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
		
			int nNo = Integer.parseInt(multiRequest.getParameter("no"));
			String nTitle = multiRequest.getParameter("noticeTitle");
			String nCategory = multiRequest.getParameter("category");
			String nContent = multiRequest.getParameter("noticeContent");
			String nFix = null;
			if(multiRequest.getParameter("noticeFix") == null) {
				nFix = "N";
			}else {
				nFix = "Y";
			}
			
			
			Notice n = new Notice();
			n.setNoticeNo(nNo);
			n.setNoticeTitle(nTitle);
			n.setNoticeCategory(nCategory);
			n.setNoticeContent(nContent);
			n.setNoticeFix(nFix);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/upfiles/");
				
				if(multiRequest.getParameter("originFileNo") != null) {
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				}else {
					at.setRefNo(nNo);
				}
			}
			int result = new CommunityService().updateNotice(n, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "공지사항이 수정 완료 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.co?page=1");
			}else {
				request.getSession().setAttribute("alertMsg", "수정 실패");
				response.sendRedirect(request.getContextPath() + "/list.co?page=1");
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
