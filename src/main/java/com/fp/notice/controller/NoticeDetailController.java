package com.fp.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fp.common.model.vo.Attachment;
import com.fp.notice.model.service.NoticeService;
import com.fp.notice.model.vo.Notice;


/**
 * Servlet implementation class NoticeDetailController
 */
@WebServlet("/detail.no")
public class NoticeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int p = Integer.parseInt(request.getParameter("p"));
		int noticeNo = Integer.parseInt(request.getParameter("no"));
		NoticeService nService = new NoticeService();
		// 1) 조회수 증가 (update)
		int result = nService.increaseCount(noticeNo);
		
		if(result > 0) {
		// 조회수 증가 성공
			Notice n = nService.selectNotice(noticeNo);

			if(n.getCategory().equals("1")) {
				n.setCategory("일반");
			}else {
				n.setCategory("이벤트");
			}
			Attachment at = nService.selectAttachment(noticeNo);
			request.setAttribute("n", n);
			request.setAttribute("at", at);
			request.setAttribute("p", p);
			request.getRequestDispatcher("/views/notice/noticeContent.jsp").forward(request, response);
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
