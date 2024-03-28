package com.fp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fp.board.model.service.BoardService;
import com.google.gson.Gson;

/**
 * Servlet implementation class BoardGoodController
 */
@WebServlet("/good.bo")
public class AjaxBoardGoodController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxBoardGoodController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int boardNo = Integer.parseInt(request.getParameter("bNo"));
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int resultCount = 0; // 추천했는지 검사하는 변수
		int result = 0; 
		
		resultCount = new BoardService().selectCount(boardNo, memNo);
		System.out.println(resultCount);
		
		if(resultCount == 0) {
			result = new BoardService().good(boardNo, memNo);
		}

		response.getWriter().print(result);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
