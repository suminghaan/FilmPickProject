package com.fp.common.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.movie.model.service.MovieService;
import com.fp.movie.model.vo.Movie;

/**
 * Servlet implementation class mainPageController
 */
@WebServlet("/mainpage.fp")
public class mainPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainPageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String no1 = "1";
		String no2 = "2";
		String no3 = "3";
		
		List<Movie> vlist = new MovieService().selectMainListv();
		List<Movie> plist1 = new MovieService().selectMainListp(no1);
		List<Movie> plist2 = new MovieService().selectMainListp(no2);
		List<Movie> plist3 = new MovieService().selectMainListp(no3);
		
		request.setAttribute("vlist", vlist);
		request.setAttribute("plist1", plist1);
		request.setAttribute("plist2", plist2);
		request.setAttribute("plist3", plist3);
		
		request.getRequestDispatcher("/views/common/mainPage.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
