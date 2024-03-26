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
 * Servlet implementation class MovieCastingDeleteController
 */
@WebServlet("/deletePerson.admo")
public class MovieCastingDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieCastingDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int pno = Integer.parseInt(request.getParameter("pno"));
		
		int result = new MovieService().deletePerson(pno);
		
		HttpSession session = request.getSession();
		if(result >0) {
			session.setAttribute("alertMsg", "인물이 성공적으로 삭제되었습니다");
			response.sendRedirect(request.getContextPath()+"/movieCastingList.admo?page=1");
		}else {
			session.setAttribute("alertMsg", "인물 삭제 실패");
			response.sendRedirect(request.getContextPath()+"/movieCastingList.admo?page=1");
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
