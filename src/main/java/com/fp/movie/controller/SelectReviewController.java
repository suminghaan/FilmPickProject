package com.fp.movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.common.model.vo.Approval;
import com.fp.member.model.vo.Member;
import com.fp.movie.model.service.MovieService;
import com.fp.movie.model.vo.Review;

/**
 * Servlet implementation class SelectReviewController
 */
@WebServlet("/moreReview.fp")
public class SelectReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectReviewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		
		ArrayList<Review> reviewList = new MovieService().selectReviewInfo(movieNo);
		ArrayList<Approval> apprList = new MovieService().selectApproval(userNo);
		
		if(reviewList != null) {
			request.setAttribute("reviewList", reviewList);
		} else {
			System.out.println("reviewList가 null");
		}
		
		if(apprList != null) {
			request.setAttribute("apprList", apprList);
		} else {
			System.out.println("apprList가 null");
		}
		
		request.getRequestDispatcher("/views/search/moreReview.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
