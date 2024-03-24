package com.fp.admin.controller.ad_movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.MovieService;
import com.fp.common.model.vo.Attachment;
import com.fp.movie.model.vo.Movie;
import com.fp.person.model.vo.Person;

/**
 * Servlet implementation class MovieListDetail
 */
@WebServlet("/movieListDetail.admo")
public class MovieListDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieListDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		System.out.println(request.getParameter("no"));
		int mvNo = Integer.parseInt(request.getParameter("no"));
		
		Movie m = new MovieService().MovieListDetail(mvNo);
		List<Person> plist = new MovieService().MovieListDetailPerson(mvNo);
		List<Attachment> alist = new com.fp.movie.model.service.MovieService().selectAddiMovie(mvNo);
		request.setAttribute("m", m);
		request.setAttribute("plist", plist);
		request.setAttribute("alist", alist);
		
		request.getRequestDispatcher("/views/admin/ad_movie/movieListDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
