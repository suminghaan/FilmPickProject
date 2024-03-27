package com.fp.admin.controller.ad_customer_center;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.CustomerCenterService;
import com.fp.common.model.vo.Attachment;
import com.fp.movie.model.vo.Category;
import com.fp.movie.model.vo.Movie;
import com.fp.noMovie.model.service.NoMovieService;
import com.fp.noMovie.model.vo.NoMovie;
import com.fp.person.model.vo.Person;

/**
 * Servlet implementation class noMovieListDetailController
 */
@WebServlet("/movierequestlistdetail.nm")
public class NoMovieListDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoMovieListDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("없는영화 신청 상세 페이지 서블릿 실행");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		
		NoMovie nm = new NoMovieService().selectNoMovieAll(no);
		System.out.println(nm);
		nm = new NoMovieService().selectNoMovieAll(no);
		List<Person> pList = new NoMovieService().selectNoMoviePerson(no);
		List<Category> cList = new NoMovieService().selectNoMovieCategory(no);
		Attachment at = new NoMovieService().selectAttachment(no);
		
		request.setAttribute("nm", nm);
		request.setAttribute("pList", pList);
		request.setAttribute("cList", cList);
		request.setAttribute("at", at);
		request.getRequestDispatcher("/views/admin/ad_customer_center/noMovieRequestDetail.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
