package com.fp.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fp.board.model.service.BoardService;
import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.Attachment;
import com.fp.common.template.MyFileRenamePolicy;
import com.fp.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardPostWriteController
 */
@WebServlet("/post.bo")
public class BoardPostWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardPostWriteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1. 업로드
			// 1_1) 전달되는 파일의 용량 제한 (int maxSize => byte단위)
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2) 전달된 파일을 저장시킬 폴더의 경로 알아내기 (String save)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles");
			
			// 1_3) 전달된 파일의 파일명을 수정 작업해주는 객체 세팅
			// MyFileRenamePolicy 만듬
			
			// 1_4) 파일 업로드 및 HttpServletRequest 객체를  MultipartRequest객체로 변환
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			/*-------------------------------------------------------------------------------------------------------*/
			// 2. DB에 데이터 기록
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			String category = multiRequest.getParameter("category"); // 영화, 잡담
			
			HttpSession session = request.getSession();
			int userNo = ((Member)session.getAttribute("loginUser")).getMemNo();
			
			Board b = new Board();
			b.setbTitle(boardTitle);
			b.setbContent(boardContent);
			b.setbCategory(category);
			b.setMemNo(String.valueOf(userNo));
			
			Attachment at = null; // 처음에는 null로 초기화, 넘어온 첨부파일이 있을 경우 => 생성
			// multiRequest.getOriginalFileName("키값") : 넘어온 첨부파일이 있을 경우 "원본명" | 없을 경우 null
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/upfiles/");
			}
			
			// 서비스 요청(DB에 데이터 기록)
			int result = new BoardService().insertBoard(b, at);
			
			// 응답뷰 지정
			if(result > 0) {
				session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
				if(category.equals("영화")) {
					response.sendRedirect(request.getContextPath() + "/movie.bo?page=1");
				}else {
					response.sendRedirect(request.getContextPath() + "/chat.bo?page=1");
				}
			}else {			
				if(at != null) { // 첨부파일이 있었을 경우 업로드된 파일 제거
					new File(savePath + at.getChangeName()).delete();
				}
				session.setAttribute("alertMsg", "게시글 등록이 실패되었습니다.");
				if(category.equals("영화")) {
					response.sendRedirect(request.getContextPath() + "/movie.bo?page=1");
				}else {
					response.sendRedirect(request.getContextPath() + "/chat.bo?page=1");
				}
			}
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














