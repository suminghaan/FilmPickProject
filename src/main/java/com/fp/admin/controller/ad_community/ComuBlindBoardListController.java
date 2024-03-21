package com.fp.admin.controller.ad_community;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.CommunityService;
import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.PageInfo;

/**
 * Servlet implementation class ComuBlindBoardListController
 */
@WebServlet("/blindList.co")
public class ComuBlindBoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComuBlindBoardListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// --------- 페이징 처리 -------------
		int listCount;
		int currentPage;
		int pageLimit;
		int noticeLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = new CommunityService().selectBlindBoardListCount();
		currentPage = Integer.parseInt(request.getParameter("page"));
		pageLimit = 5;
		noticeLimit = 10;
		maxPage = (int)Math.ceil((double)listCount/noticeLimit);
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, noticeLimit, maxPage, startPage, endPage);
		
		List<Board> list = new CommunityService().selectBlindBoardList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/admin/ad_community/commuBlindList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
