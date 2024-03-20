package com.fp.admin.controller.ad_member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.MemberService;
import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.vo.Review;

/**
 * Servlet implementation class MemberReviewController
 */
@WebServlet("/list.rv")
public class MemberReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		String memNo = request.getParameter("memNo");
		
		System.out.println(memId + " " + memNo);
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;

		listCount = new MemberService().selectReviewListCount(memNo);

		currentPage = Integer.parseInt(request.getParameter("page"));

		pageLimit = 5;

		boardLimit = 10;

		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		List<Review> pageList = new MemberService().selectReviewList(memNo, pi);

		List<Board> userProfile = new MemberService().selectUserBoardList(memId); // 회원 프로필 조회하는건 게시글 페이지랑 동일함
		
		request.setAttribute("pi", pi);
		request.setAttribute("pageList", pageList);
		request.setAttribute("userProfile", userProfile);

		request.getRequestDispatcher("/views/admin/ad_member/memberReviewPostView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
