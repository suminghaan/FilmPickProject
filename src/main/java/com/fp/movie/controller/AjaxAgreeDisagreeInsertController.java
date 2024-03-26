package com.fp.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.movie.model.service.MovieService;

/**
 * Servlet implementation class AjaxAgreeDisagreeInsertController
 */
@WebServlet("/agDisagInsert.fp")
public class AjaxAgreeDisagreeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAgreeDisagreeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		
		// 0일 경우 리뷰에 대해 공감 표시, 1일 경우 리뷰에 대해 공감 제거, 2일 경우 리뷰에 대해 비공감 표시, 3일 경우 리뷰에 대해 비공감 제거
		int type = Integer.parseInt(request.getParameter("type"));
		
		int result = new MovieService().ManipulateApproval(reviewNo, userNo, type);
		
		if (result > 0) {
			response.getWriter().print("공감|비공감 표시 성공");
		} else {
			response.getWriter().print("공감|비공감 표시 실패");
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
