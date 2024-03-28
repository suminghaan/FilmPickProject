package com.fp.admin.controller.ad_movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.MovieService;
import com.fp.common.model.vo.PageInfo;
import com.fp.person.model.vo.Person;

/**
 * Servlet implementation class MovieCastingListController
 */
@WebServlet("/movieCastingList.admo")
public class MovieCastingListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieCastingListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// --------- 페이징 처리 -------------
		int listCount;
		int currentPage;
		int pageLimit;
		int noticeLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		String keyword = null;
		if(request.getParameter("keyword") == null) {
			listCount = new MovieService().selectCastingListCount();
		} else {
			keyword = request.getParameter("keyword");
			listCount = new MovieService().searchCastingListCount(keyword);
		}
		
		currentPage = Integer.parseInt(request.getParameter("page"));
		pageLimit = 5;
		noticeLimit = 10;
		maxPage = (int)Math.ceil((double)listCount/noticeLimit);
		startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, noticeLimit, maxPage, startPage, endPage);
		
		
		if(request.getParameter("keyword") == null) {
			List<Person> list = new MovieService().selectPersonList(pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/admin/ad_movie/movieCasting.jsp").forward(request, response);
		} else {
			List<Person> list = new MovieService().searchCasting(keyword, pi);
			request.setAttribute("pi", pi);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/admin/ad_movie/movieCasting.jsp").forward(request, response);
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
