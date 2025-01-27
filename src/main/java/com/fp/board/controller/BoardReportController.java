package com.fp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fp.board.model.service.BoardService;
import com.fp.board.model.vo.Report;

/**
 * Servlet implementation class BoardReportController
 */
@WebServlet("/boReport.bo")
public class BoardReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Report re = new Report();
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo")); //신고받은게시글번호
		String reportNo = request.getParameter("boardReportNo"); // 신고한 회원번호 
		String reportedNo = request.getParameter("boardReportedNo"); // 신고받은 회원번호
		String type = request.getParameter("boardTypeNo"); // 신고타입 (게시글1 | 댓글2)
		String reportType = request.getParameter("notify"); // 신고분류 (1욕설 | 2도배 | 3선정 | 4기타)
		String reportContent = request.getParameter("content"); // 신고내용
		
		re.setReportBoardNo(boardNo);
		re.setReportMemNo(reportNo);
		re.setReportedMemNo(reportedNo);
		re.setType(type);
		re.setReportType(reportType);
		re.setReportContent(reportContent);
		
		int result = new BoardService().reportBoard(re);
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMsg", "게시글을 신고하였습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.bo?no=" + re.getReportBoardNo());
		}else {
			
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
