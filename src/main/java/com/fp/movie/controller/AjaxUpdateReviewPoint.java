package com.fp.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.movie.model.service.MovieService;

/**
 * Servlet implementation class AjaxUpdateReviewPoint
 */
@WebServlet("/insertReview.fp")
public class AjaxUpdateReviewPoint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxUpdateReviewPoint() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String likePoint = request.getParameter("likePoint");
		
		// 1이면 update, 0이면 insert
		String alreadyReview = request.getParameter("alreadyReview");
		
		// 이미 review한 정보가 있다면 reviewContent에 해당 정보 저장
		String reviewContent = null;

		if(request.getParameter("reviewContent") != null ) {
			reviewContent = request.getParameter("reviewContent");
		}
		
		int result = 0;
		
		if(alreadyReview.equals("0")) {
			result = new MovieService().insertReview(movieNo, userNo, likePoint, reviewContent);
		} else {
			result = new MovieService().updateReview(movieNo, userNo, likePoint, reviewContent);
		}
		
		
		response.setContentType("text/html; chartset=utf-8");
		if(result > 0) {
			response.getWriter().print("등록 성공!");
		} else {
			response.getWriter().print("등록 실패!");
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
