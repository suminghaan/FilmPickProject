package com.fp.movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.common.model.vo.Approval;
import com.fp.common.model.vo.Attachment;
import com.fp.movie.model.service.MovieService;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.Review;
import com.fp.person.model.service.PersonService;
import com.fp.person.model.vo.Person;
import com.fp.member.model.service.MemberService;
import com.fp.member.model.vo.Member;

/**
 * Servlet implementation class MovieDetailController
 */
@WebServlet("/movieDetail.fp")
public class MovieDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		int userNo = 0;
		int countMovieLike = 0;
		if (request.getSession().getAttribute("loginUser") != null) {
			userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		}
		
		Movie m = new MovieService().selectMovieInfo(movieNo);
		ArrayList<Attachment> attList = new MovieService().selectAddiMovie(movieNo);
		ArrayList<Person> personList = new PersonService().selectPersonInfo(movieNo);
		ArrayList<Review> reviewList = new MovieService().selectReviewInfo(movieNo);
		ArrayList<Movie> movieList = new MovieService().selectRelMovieList(movieNo);
		
		Review review = null;
		
		if(userNo != 0) {
			ArrayList<Approval> apprList = new MovieService().selectApproval(userNo);
			review = new MovieService().selectUserReview(movieNo, userNo);
			countMovieLike = new MovieService().selectMovieLike(movieNo, userNo);
			request.setAttribute("apprList", apprList);
		}
		
		if(m != null) {
			request.setAttribute("movie", m);
		} else {
			System.out.println("movie == null");
		}
		
		if(attList != null) {
			request.setAttribute("attList", attList);
		} else {
			System.out.println("attList == null");
		}
		
		if(personList != null) {
			request.setAttribute("personList", personList);
		} else {
			System.out.println("personList == null");
		}
		
		if(reviewList != null) {
			request.setAttribute("reviewList", reviewList);
		} else {
			System.out.println("reviewList == null");
		}
		
		if(movieList != null) {
			request.setAttribute("movieList", movieList);
		} else {
			System.out.println("movieList == null");
		}
		
		request.setAttribute("review", review);
		request.setAttribute("countMovieLike", countMovieLike);
		request.getRequestDispatcher("/views/search/movieDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
