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
import com.fp.person.model.service.PersonService;
import com.fp.person.model.vo.Person;

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
		
		Movie m = new MovieService().selectMovieInfo(movieNo);
		ArrayList<Attachment> attList = new MovieService().selectAddiMovie(movieNo);
		ArrayList<Person> personList = new PersonService().selectPersonInfo(movieNo);
		
		request.setAttribute("personList", personList);
		request.setAttribute("attList", attList);
		request.setAttribute("movie", m);
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
