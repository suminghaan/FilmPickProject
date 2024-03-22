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
 * Servlet implementation class BoardReplyReportController
 */
@WebServlet("/boReReport.bo")
public class BoardReplyReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Report re = new Report();
		
		int reportBoardNo = Integer.parseInt(request.getParameter("replyNo")); //신고받은댓글번호
		String reportMemNo = request.getParameter("replyReportNo"); // 신고한 회원번호 
		String reportedMemNo = request.getParameter("replyReportedNo"); // 신고받은 회원번호
		String type = request.getParameter("replyTypeNo"); // 신고타입 (게시글1 | 댓글2)
		String reportType = request.getParameter("notify"); // 신고분류 (1욕설 | 2도배 | 3선정 | 4기타)
		String reportContent = request.getParameter("content"); // 신고내용
		
		re.setReportBoardNo(reportBoardNo); // 신고받은 댓글번호
		re.setReportMemNo(reportMemNo); //신고한회원버놓
		re.setReportedMemNo(reportedMemNo); //신고받은회원번호
		re.setType(type); //신고타입 1게시글 2댓글인데 2일꺼임
		re.setReportType(reportType); // 신고분류 (1욕설 | 2도배 | 3선정 | 4기타)
		re.setReportContent(reportContent); // 신고내용
		
		System.out.println(reportBoardNo + " 신고받은 댓글번호");
		System.out.println(reportMemNo + " 신고한회원번호");
		System.out.println(reportedMemNo + " 신고받은회원번호");
		System.out.println(type + " 신고타입 1게시글 2댓글");
		System.out.println(reportType + " 신고분류 (1욕설 | 2도배 | 3선정 | 4기타)");
		System.out.println(reportContent + " 신고내용");
		
		int result = new BoardService().replyReportBoard(re);
		HttpSession session = request.getSession();
		if(result > 0) {
			session.setAttribute("alertMsg", "댓글을 신고하였습니다.");
			response.sendRedirect(request.getContextPath() + "/detail.bo?no=" + 3);
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
