package com.fp.movie.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.movie.model.service.MovieService;

/**
 * Servlet implementation class AjaxMovieUpdateHeartController
 */
@WebServlet("/updateheart.fp")
public class AjaxMovieUpdateHeartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxMovieUpdateHeartController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mvNo = Integer.parseInt(request.getParameter("movieNo"));
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		String isChecked = request.getParameter("isChecked");
		
		int result = new MovieService().updateMovieLike(mvNo, userNo, isChecked);
		response.setContentType("text/html; charset=utf-8");
		if (result > 0) {
			response.getWriter().print("좋아요 표시 성공");
		} else {
			response.getWriter().print("좋아요 표시 실패");
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
