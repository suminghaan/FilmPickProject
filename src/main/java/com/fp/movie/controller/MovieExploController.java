package com.fp.movie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.service.MovieService;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.SearchFilter;

/**
 * Servlet implementation class MovieExploController
 */
@WebServlet("/explo.mo")
public class MovieExploController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieExploController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String currScreen = request.getParameter("currentScreen"); // 상영중인영화조회
		String category = request.getParameter("category"); // 카테고리조회
		String viewRating = request.getParameter("viewRating"); // 등급조회
		String yesrs = request.getParameter("yesrs"); // 연도조회
		String nation = request.getParameter("nation"); // 국가조회
		String filter = request.getParameter("filter"); // 필터조회
		
		SearchFilter f = new SearchFilter();
		
		번호, 포스터, 제목, 별점, 개봉일 국가
		Movie m = new Movie();
		
		
		int listCount; // 현재 게시글 총 갯수
		int currentPage; // 현재 페이지 (사용자가 요청한 페이지)
		int pageLimit; // 페이징바의 페이지 최대갯수 (몇개 단위씩)
		int boardLimit; // 한 페이지에 보여질 게시글 최대갯수 (몇개 단위씩)
		
		int maxPage; // 가장 마지막페이지(총페이지수)
		int startPage; // 사용자가 요청한 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 사용자가 요청한 페이지 하단에 보여질 페이징바의 끝수
		
		listCount = new MovieService().selectListCount(); // 총 게시글 갯수 (db로부터 조회)
		currentPage = Integer.parseInt(request.getParameter("page")); //사용자가 요청한 페이지수 (현재페이지)
		pageLimit = 5; // 페이징바의 페이지 최대갯수 (페이징바의 목록수 단위)
		boardLimit = 25; // 게시글 최대 갯수 (게시글 노출 단위)
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit); // 총 페이지 수 
		
		startPage = (currentPage-1) / pageLimit * pageLimit + 1; // 페이징바의 시작수
		
		endPage = startPage + pageLimit - 1; // 페이징바의 끝수
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		List<Movie> list = new MovieService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/views/search/searchExplo.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
