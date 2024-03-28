package com.fp.admin.controller.ad_customer_center;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fp.admin.model.service.CustomerCenterService;
import com.fp.common.template.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoMovieRequestDetailApproval
 */
@WebServlet("/approval.nm")
public class NoMovieRequestDetailApproval extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NoMovieRequestDetailApproval() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("승인여부 서블릿 실행");
		/*
		 * INSERT INTO MOVIE VALUES( SEQ_MOVIE_NO.NEXTVAL , 영화이름 o , 오픈데이트(개봉일) o ,
		 * 네이션(국가) o , 러닝타임 o , 줄거리 o , 1페이지노출여부 , 관람등급 o , 현재상영여부 , 메인페이지노출여부 o ,
		 * 영화메인포스터 파일경로 o , 영화메인예고편 o , 영화상태 , 등록일 )
		 */
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 100 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			String movieName = request.getParameter("movieName");
			String viewGrade = request.getParameter("viewGrade");
			String mContent = request.getParameter("mContent");
			String openDate = request.getParameter("dateIn");
			String runningTime = request.getParameter("runningTime");
			String nation = request.getParameter("nation");
			String upfile1 = request.getParameter("upfile1");
			String upfile2 = request.getParameter("upfile2");
			
			String noMovieNo = request.getParameter("noMovieNo");

			int result1 = new CustomerCenterService().approvalNoMovieRequest(movieName, viewGrade, mContent, openDate,
					runningTime, nation, upfile1, upfile2);

			int result2 = new CustomerCenterService().updateNoMovieApproval(noMovieNo);
			if (result1 * result2 > 0) {
				request.getSession().setAttribute("alertMsg", "등록이 완료되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.nm?page=1");
			}

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
