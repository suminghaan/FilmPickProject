package com.fp.admin.controller.ad_community;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fp.admin.model.service.CommunityService;

/**
 * Servlet implementation class ComuReportCommentBlindController
 */
@WebServlet("/reportCommentBlind.co")
public class ComuReportCommentBlindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComuReportCommentBlindController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int replyNo = Integer.parseInt(request.getParameter("rno"));
		int result = new CommunityService().reportCommentBlind(replyNo);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMsg", "해당 댓글이 블라인드 처리 되었습니다.");
			response.sendRedirect(request.getContextPath()+"/blindList.co?page=1");
		}else {
			session.setAttribute("alertMsg", "블라인드 처리 실패");
			response.sendRedirect(request.getContextPath()+"/reportCommentList.co?page=1");
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
