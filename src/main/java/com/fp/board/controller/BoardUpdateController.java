package com.fp.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fp.board.model.service.BoardService;
import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.Attachment;
import com.fp.common.template.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/update.bo")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(ServletFileUpload.isMultipartContent(request)) {
			// 1. 첨부파일 업로드 및 request => multiRequest로 변환
			// 1_1) 전송되는 파일의 용량 제한 (int maxSize)
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2) 파일을 저장시킬 물리적인 경로 (String savePath)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 2. DB에 데이터 갱신
			//	>> 공통적으로 수행 : Update Board (카테고리번호, 제목, 내용 수정)
			int boardNo = Integer.parseInt(multiRequest.getParameter("no"));
			String category = multiRequest.getParameter("category");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			 
			Board b = new Board();
			b.setbCategory(category);
			b.setbNo(boardNo);
			b.setbTitle(boardTitle);
			b.setbContent(boardContent);
			
			// 새로 넘어온 첨부파일이 잇을 경우 => 새로운 첨부파일에 대한 정보를 db에 기록
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				// 새로 넘어온 첨부파일이 있을 경우 => Attachment 객체 생성
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/upfiles/");
				
				if(multiRequest.getParameter("originFileNo") != null) {
				// 기존의 첨부파일이 있었을 경우 => Update Attachment (기존의 첨부파일 번호 필요)
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				}else {
				// 기존의 첨부파일이 없었을 경우 => Insert Attachment (현재 수정중인 게시글 번호 필요)
					at.setRefNo(boardNo);
				}	
			}
			
			int result = new BoardService().updateBoard(b, at);			
			// 새로운 첨부파일 x 				 => 		b, null	 	      => Board Update
			// 새로운 첨부파일 O, 기존의 첨부파일 O => 		 b, fileNo이 담긴 at    => Board Update, Attachment Update
			// 새로운 첨부파일 O, 기존의 첨부파일 X =>  	b, refBoardNo이 담김 at => Board Update, Attachment Insert
			if(result > 0) {
				// 성공 => 해당 게시글 상세페이지 + alert "성공적으로 수정"
				request.getSession().setAttribute("alertMsg", "게시글이 수정됐습니다.");
				response.sendRedirect(request.getContextPath() + "/detail.bo?no=" + boardNo);
			}else {
				// 실패
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
