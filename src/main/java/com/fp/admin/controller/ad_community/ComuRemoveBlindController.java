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
 * Servlet implementation class ComuRemoveBlindController
 */
@WebServlet("/removeBlind.co")
public class ComuRemoveBlindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComuRemoveBlindController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("b_No"));
		
		int result = new CommunityService().removeBlind(boardNo);
		
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMst", "해당 게시글이 블라인드 해제되었습니다.");
			response.sendRedirect(request.getContextPath()+ "/blindList.co?page=1");
		}else {
			session.setAttribute("alertMst", "블라인드 해제 실패");
			response.sendRedirect(request.getContextPath()+ "/blindList.co?page=1");
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
