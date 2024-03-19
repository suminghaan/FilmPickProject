package com.fp.movie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.common.model.vo.Attachment;
import com.fp.movie.model.service.MovieService;
import com.fp.movie.model.vo.Movie;

/**
 * Servlet implementation class MoviePersonSearchController
 */
@WebServlet("/search.fp")
public class MoviePersonSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MoviePersonSearchController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchKeyword = request.getParameter("searchKeyword");
		
		ArrayList<Movie> movieList = new MovieService().selectMovieList(searchKeyword);
		ArrayList<Attachment> posterList = new MovieService().selectPosterList(searchKeyword);
		System.out.println(movieList);
		request.setAttribute("movieList", movieList);
		request.setAttribute("posterList", posterList);
		request.getRequestDispatcher("/views/search/search.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
