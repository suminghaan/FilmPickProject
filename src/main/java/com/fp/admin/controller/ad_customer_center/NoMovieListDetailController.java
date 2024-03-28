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
		int noMovieNo = Integer.parseInt(request.getParameter("no"));
		System.out.println(noMovieNo);
		
		List<Category> cMyList = new NoMovieService().selectNoMovieCategory(noMovieNo);
//		System.out.println("업데이트폼컨트롤러에서의 noMovieNo는 영화번호임 : " + noMovieNo);
		NoMovie nm = new NoMovie();
		// 없는영화 테이블에 값들 가져오는 구문
		nm = new NoMovieService().selectNoMovieAll(noMovieNo);
		// 없는영화에서 출연진 테이블에 값들 가져오는 구문
		List<Person> pList = new NoMovieService().selectNoMoviePerson(noMovieNo);
		// 없는영화에서 카테고리 테이블에 값들 가져오는 구문
		List<Category> cList = new NoMovieService().selectCategory();
		// 없는영화에서 추가적인 첨부파일 테이블에 값들 가져오는 구문
		Attachment at = new NoMovieService().selectAttachment(noMovieNo);
//		System.out.println("nm 값 : " + nm);
//		System.out.println("pList 값 : " + pList);
		System.out.println("cList 값 : " + cList);
//		System.out.println("at 값 : " + at);
		
		request.setAttribute("cMyList", cMyList);
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
