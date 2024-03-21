package com.fp.admin.controller.ad_community;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.admin.model.service.CommunityService;
import com.fp.admin.model.vo.Notice;
import com.google.gson.Gson;

/**
 * Servlet implementation class ComuNoticeDetail
 */
@WebServlet("/noticeDetail.co")
public class AjaxComuNoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxComuNoticeDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String noticeNo = request.getParameter("notice");
		System.out.println(noticeNo);
		List<Notice> uplist = new CommunityService().updateNotice(noticeNo);
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
