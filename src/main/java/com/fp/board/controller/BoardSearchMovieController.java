package com.fp.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.board.model.service.BoardService;
import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.vo.Movie;

/**
 * Servlet implementation class BoardSearchMovieController
 */
@WebServlet("/searchMovie.bo")
public class BoardSearchMovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchMovieController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 헤더부분에 있는 헤드셋아이콘 클릭시 /list.no?page=1		=> 공지사항 1번페이지 요청
		// 페이징바에 있는 페이지번호 클릭시 /list.no?page=클릭한번호	=> 클릭한페이지 요청
		
		// --------------- 페이징처리 ---------------
		int listCount;		// 현재 게시글 총 갯수
		int currentPage;	// 현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		// 페이징바의 페이지 최대갯수 (몇개 단위씩 표현할지) 우리는 5개로 하기로 함
		int boardLimit;		// 한 페이지에 보여질 공지사항 최대갯수 (몇개 단위씩 게시글 보여질지) 우리는 10개 단위로 보여지게끔 하기로 함
		// 위의 4개를 가지고 페이징바의 시작수, 끝수, 가장마지막페이지(총 페이지수)를 구해야만 페이징바 처리 가능
		int startPage;		// 사용자가 요청한 페이지 하단에 보여질 페이징바의 시작수
		int endPage;		// 사용자가 요청한 페이지 하단에 보여질 페지징바의  끝수
		int maxPage;		// 가장 마지막 페이지(총 페이지수)
		String keyword = request.getParameter("searchKeyword");
		
		// listCount : 총 키워드에 맞는 인기게시글 갯수 (db로부터 조회)
		listCount = new BoardService().keywordSelectListCount(keyword);
		// currentPage : 사용자가 요청한(클릭) 페이지 수 (현재 띄워줄 페이지 번호)
		currentPage = Integer.parseInt(request.getParameter("page"));
		// pageLimit : 페이징바의 페이지 최대 갯수 (페이징바의 목록수  단위)
		pageLimit = 5;
		// boardLimit : 공지사항의 최대 갯수(게시글 노출 단위)
		boardLimit = 10;
		//  ↑↑↑↑위 4개를 가지고 start, end, max 페이지 구하면 페이징바 구현 가능
		// -------------------------------------------------------------
		
		// Math.ceil은 올림처리 메소드
		// maxPage : 제일 마지막 페이지 수 (총 페이지 수)
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// startPage : 페이징바의 시작수
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		
		// endPage : 페이징바의 끝수
		endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이징바를 만들기 위한 데이터 (PageInfo객체)
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// 사용자가 요청한 페이지에 보여져야될 인기게시글 목록
		List<Board> list = new BoardService().selectKeywordList(pi, keyword);
		
		// 커뮤니티 메인페이지의 우측에 인기영화란의 영화제목을 담기위한 메소드 호출구문
		List<Movie> mList = new BoardService().selectPublicMovieName();
		
		// 커뮤니티 영화이름 클릭시 영화 상세페이지 이동을 위한 영화번호를 담기위한 메소드
		List<Movie> allMovie = new BoardService().selectAllMovie();
		
		// 응답페이지 => /views/community/searchMovieList.jsp
		// 응답데이터 => 사용자가 요청한 페이지상에 보여져야될 게시글 목록, 페이징바를 만들기 위한 pi
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("mList", mList);
		request.setAttribute("allMovie", allMovie);
		
		// 리퀘스트객체와 리스폰스 객체를 응답페이지 jsp에 전달하기
		request.getRequestDispatcher("/views/community/searchMovieList.jsp").forward(request, response);
//		response.sendRedirect(request.getContextPath() + "/searchMovie.bo");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
