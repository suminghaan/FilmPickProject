package com.fp.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fp.member.model.vo.Member;
import com.fp.movie.model.service.MovieService;

/**
 * Servlet implementation class MemberMovieStarRatingListDetailReturn
 */
@WebServlet("/movieStarRatingListDetailReturn")
public class MemberMovieStarRatingListDetailReturn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMovieStarRatingListDetailReturn() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("UTF-8");
		
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		String likePoint = request.getParameter("rating");
		String reviewContent = request.getParameter("reviewContent");
		
		// 0이면 insert, 1이면 update
		int alreadyReview = Integer.parseInt(request.getParameter("alreadyReview"));
		
		int result = 0;
		
		if(alreadyReview == 0) {
			result = new MovieService().insertReview(movieNo, userNo, likePoint, reviewContent);
		} else if (alreadyReview == 1) {
			result = new MovieService().updateReview(movieNo, userNo, likePoint, reviewContent);
		}
		
		HttpSession session = request.getSession();
		
		if (result > 0) {
			session.setAttribute("alertMsg", "리뷰 등록에 성공했습니다.");
		} else {
			session.setAttribute("alertMsg", "리뷰 등록에 실패했습니다.");
		}
		
		response.sendRedirect(request.getContextPath() + "/movieStarRatingList.me?page=1");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
