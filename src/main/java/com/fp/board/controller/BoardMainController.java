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
import com.fp.movie.model.vo.Movie;

/**
 * Servlet implementation class BoardMainController
 */
@WebServlet("/main.bo")
public class BoardMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardMainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 커뮤니티 메인페이지의 영화카테고리의 최신순 인기글4개를 담기위한 메소드 호출구문
		List<Board> publicList = new BoardService().selectMainPublicList();
		
		// 커뮤니티 메인페이지의 영화카테고리의 최신순 일반글4개를 담기위한 메소드 호출구문
		List<Board> list = new BoardService().selectMainList();
		
		// 커뮤니티 메인페이지의 잡담카테고리의 최신순 일반글4개를 담기위한 메소드 호출구문
		List<Board> chatList = new BoardService().selectMainChatList();
		
		// 커뮤니티 메인페이지의 우측에 인기영화란의 영화제목을 담기위한 메소드 호출구문
		List<Movie> mList = new BoardService().selectPublicMovieName();
		
		request.setAttribute("publicList", publicList);
		request.setAttribute("list", list);
		request.setAttribute("chatList", chatList);
		request.setAttribute("mList", mList);
		
		request.getRequestDispatcher("/views/community/communityList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
