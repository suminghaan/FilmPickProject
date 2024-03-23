package com.fp.movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.member.model.vo.Member;
import com.fp.movie.model.service.MovieService;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.Review;

/**
 * Servlet implementation class OtherUserInfoController
 */
@WebServlet("/otherUser.fp")
public class OtherUserInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtherUserInfoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int otherUserNo = Integer.parseInt(request.getParameter("otherUserNo"));
		
		Member otherUser = new MovieService().selectOtherUser(otherUserNo);
		ArrayList<Review> otherUserReview = new MovieService().selectOtherUserReview(otherUserNo);
		ArrayList<Movie> bothInterestMovieList = new MovieService().bothInterestMovie(userNo, otherUserNo);
		
		if(otherUser != null) {
			request.setAttribute("otherUser", otherUser);
		} else {
			System.out.println("다른 유저 정보가 null입니다.");
		}
		
		if(otherUserReview != null) {
			request.setAttribute("otherUserReview", otherUserReview);
		} else {
			System.out.println("유저가 평가한 리뷰가 null입니다");
		}
		
		if (bothInterestMovieList != null) {
			request.setAttribute("bothInterestMovieList", bothInterestMovieList);
		} else {
			System.out.println("둘 다 재밌게 본 영화가 null입니다.");
		}
		
		request.getRequestDispatcher("/views/search/userInfo.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
