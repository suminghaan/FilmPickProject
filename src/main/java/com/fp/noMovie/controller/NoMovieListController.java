package com.fp.noMovie.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.noMovie.model.service.NoMovieService;
import com.fp.noMovie.model.vo.NoMovie;

/**
 * Servlet implementation class NoMovieListController
 */
@WebServlet("/list.noMv")
public class NoMovieListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoMovieListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		List<NoMovie> list = new NoMovieService().selectNoMovie(memNo);
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getNmApproval().equals("Y")) {
				list.get(i).setNmApproval("승인");
			}else if(list.get(i).getNmApproval().equals("N")) {
				list.get(i).setNmApproval("거절");
			}else {
				list.get(i).setNmApproval("보류");
			}
		}
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/serviceCenter/noMovieList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
