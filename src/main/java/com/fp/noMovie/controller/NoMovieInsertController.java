package com.fp.noMovie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fp.common.template.MyFileRenamePolicy;
import com.fp.movie.model.vo.Category;
import com.fp.noMovie.model.vo.NoMovie;
import com.fp.person.model.vo.Person;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoMovieInsertController
 */
@WebServlet("/insertNoMovie.mv")
public class NoMovieInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoMovieInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			/*-------------------------------------------------------------------------------------------------------*/
			// NO_MOVIE_ENROLL 테이블에 데이터 기록 
			NoMovie nm = new NoMovie();
			String nmTitle = multiRequest.getParameter("movieName"); // 없는영화 제목
			String nmViewGrade = multiRequest.getParameter("viewGrade"); // 관람등급
			String nmStory = multiRequest.getParameter("movieStory"); // 줄거리
			String nmReleaseDate = multiRequest.getParameter("releaseDate"); // 개봉일
			String nmRunTime = multiRequest.getParameter("runTime"); // 러닝타임
			String nmNation = multiRequest.getParameter("nation"); // 국가 (1국내 | 2해외)
			String nmUserRequest = multiRequest.getParameter("userRequest"); // 사용자 요청사항
			String nmNicknameStatus = multiRequest.getParameter("nicknameStatus"); // 닉네임 제공여부
			int memNo = Integer.parseInt(multiRequest.getParameter("memNo")); // 글 작성한 회원번호
			nm.setNmTitle(nmTitle);
			nm.setNmViewGrade(nmViewGrade);
			nm.setNmStory(nmStory);
			nm.setNmReleaseDate(nmReleaseDate);
			nm.setNmRunTime(nmRunTime);
			nm.setNmNation(nmNation);
			nm.setNmUserRequest(nmUserRequest);
			nm.setNmNicknameStatus(nmNicknameStatus);
			nm.setMemNo(memNo);
			/*-------------------------------------------------------------------------------------------------------*/
			// NO_MOVIE_CAST 테이블에 데이터 기록
			List<Person> person = new ArrayList<>();
			Person p = new Person();
			String[] personNos = multiRequest.getParameterValues("personNo");
			String[] movieJobs =  multiRequest.getParameterValues("movieJob");
			/*-------------------------------------------------------------------------------------------------------*/
			// NO_MOVIE_GENRE 테이블에 데이터 기록
			String[] categoryArr = multiRequest.getParameterValues("category");
			Category category = new Category();
			
			List<Category> cate = new ArrayList<>();
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
