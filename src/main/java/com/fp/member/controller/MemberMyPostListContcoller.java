package com.fp.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.PageInfo;
import com.fp.member.model.service.MemberService;
import com.fp.member.model.vo.Member;

/**
 * Servlet implementation class MemberMyPostListContcoller
 */
@WebServlet("/myPlist.me")
public class MemberMyPostListContcoller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPostListContcoller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징처리
		int listCount; // 현재 게시글 총 갯수
		int currentPage; // 현재 페이지
		int pageLimit; // 한 페이지에 보여질 게시글 최대갯수
		int boardLimit;// 한 페이지에 보여질 게시글 최대갯수(몇개 단위씩)
		// 위의 4개를 가지고 페이징바 시작수, 끝수, 가장 마지막 페이지(총 페이지수)
		
		int maxPage; // 가장 마지막 페이지(총 페이지수)
		int startPage; // 사용자가 요청한 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 사용자가 요청한 페이지 하단에 보여질 페이징바의 끝수
		
		int memNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		// session에 담아놓은 로그인멤버를 불러오는거 이게 object여서 그거를 member로 형변환하고 필요한 정보 추출
		listCount = new MemberService().selectMyPostListCount(memNo);
		
		currentPage = Integer.parseInt(request.getParameter("page"));
		
		pageLimit = 5;
		boardLimit = 10;

		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 사용자가 요청한 페이지에 보여져야될 게시글 목록
		List<Board> list = new MemberService().selectMyPostList(memNo,pi);
		
		request.setAttribute("memNo", memNo);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/mypage/myPostList.jsp").forward(request, response);
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
