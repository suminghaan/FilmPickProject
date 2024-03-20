package com.fp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.board.model.service.BoardService;
import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.Attachment;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/detail.bo")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = Integer.parseInt(request.getParameter("no"));
		BoardService bService = new BoardService();
		// 1) 조회수 증가 (update)
		int result = bService.increaseCount(boardNo);
		
		if(result > 0) {
		// 조회수 증가 성공
			Board b = bService.selectBoard(boardNo);
			if(b.getbCategory().equals("1")) {
				b.setbCategory("영화");
			}else {
				b.setbCategory("잡담");
			}
			Attachment at = bService.selectAttachment(boardNo);
			request.setAttribute("b", b);
			request.setAttribute("at", at);
			request.getRequestDispatcher("/views/community/postViews.jsp").forward(request, response);
		}else {
		// 조회수 증가 실패
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
