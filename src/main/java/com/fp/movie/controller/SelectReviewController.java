package com.fp.movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.common.model.vo.Approval;
import com.fp.common.model.vo.PageInfo;
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
		int userNo = 0;
		if(request.getSession().getAttribute("loginUser") != null) {
			userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemNo();
		}
		
		/*
		 * 
		 *int reviewCount = new MovieService().selectReviewCount(movieNo);
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int pageLimit = 5;
		int reviewLimit = 12;
		
		int maxPage; // 총 페이지 수 (마지막 페이지)
		int startPage;
		int endPage;
		
		maxPage = reviewCount / reviewLimit + 1;
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage= maxPage;
		}
		
		PageInfo pi = new PageInfo(reviewCount, currentPage, pageLimit, reviewLimit, maxPage, startPage, endPage); 
		 * 
		 * 
		*/
		ArrayList<Review> reviewList = new MovieService().selectReviewInfo(movieNo);
		
		if(userNo != 0) {
			ArrayList<Approval> apprList = new MovieService().selectApproval(userNo);
			if(apprList != null) {
				request.setAttribute("apprList", apprList);
			} else {
				System.out.println("apprList가 null");
			}
		}
		
		if(reviewList != null) {
			request.setAttribute("reviewList", reviewList);
		} else {
			System.out.println("reviewList가 null");
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
