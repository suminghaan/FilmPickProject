package com.fp.admin.controller.ad_movie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fp.admin.model.service.MovieService;

/**
 * Servlet implementation class MovieCategoryUpdateController
 */
@WebServlet("/updateCate.admo")
public class MovieCategoryUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieCategoryUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String categoryNo = request.getParameter("no");
		String genreChange = request.getParameter("genreChange");
		
		System.out.print(categoryNo);
		System.out.print(genreChange);
		
		int result = new MovieService().updateCategory(genreChange, categoryNo);
		
		HttpSession session = request.getSession();
		if(result >0) {
			session.setAttribute("alertMsg", "해당 장르가 수정되었습니다.");
			response.sendRedirect(request.getContextPath()+"/movieCategoryForm.admo");
		}else {
			session.setAttribute("alertMsg", "장르 수정 실패 ");
			response.sendRedirect(request.getContextPath()+"/movieCategoryForm.admo");
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
