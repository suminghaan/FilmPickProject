package com.fp.admin.controller.ad_movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.CommunityService;
import com.fp.admin.model.service.MovieService;
import com.fp.admin.model.vo.Notice;
import com.fp.person.model.vo.Person;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxCastingDetailController
 */
@WebServlet("/castingDetail.admo")
public class AjaxCastingDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxCastingDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String pno = request.getParameter("pno");
		System.out.println(pno);
		List<Person> uplist = new MovieService().updateCastingForm(pno);
		System.out.println(uplist);
		response.setContentType("apllication/json; charset=utf-8");
		new Gson().toJson(uplist, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
