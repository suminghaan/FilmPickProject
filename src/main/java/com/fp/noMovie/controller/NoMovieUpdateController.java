package com.fp.noMovie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fp.common.model.vo.Attachment;
import com.fp.common.template.MyFileRenamePolicy;
import com.fp.movie.model.vo.Category;
import com.fp.noMovie.model.service.NoMovieService;
import com.fp.noMovie.model.vo.NoMovie;
import com.fp.person.model.vo.Person;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoMovieUpdateController
 */
@WebServlet("/update.noMv")
public class NoMovieUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoMovieUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 100 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			/*-------------------------------------------------------------------------------------------------------*/
			// NO_MOVIE_ENROLL 테이블에 데이터 기록 
			NoMovie nm = new NoMovie();
			int nmEnrollNo = Integer.parseInt(multiRequest.getParameter("noMovieNo"));
			String nmTitle = multiRequest.getParameter("movieName"); // 없는영화 제목
			String nmViewGrade = multiRequest.getParameter("viewGrade"); // 관람등급
			String nmStory = multiRequest.getParameter("movieStory"); // 줄거리
			String nmReleaseDate = multiRequest.getParameter("releaseDate"); // 개봉일
			String nmRunTime = multiRequest.getParameter("runTime"); // 러닝타임
			String nmNation = multiRequest.getParameter("nation"); // 국가 (1국내 | 2해외)
			String nmUserRequest = multiRequest.getParameter("userRequest"); // 사용자 요청사항
			String nmNicknameStatus = multiRequest.getParameter("nicknameStatus"); // 닉네임 제공여부
			int memNo = Integer.parseInt(multiRequest.getParameter("memNo")); // 글 작성한 회원번호
			if(nmNicknameStatus == null) {
				nmNicknameStatus = "N";
			}
			nm.setNmEnrollNo(nmEnrollNo); // 신청한 없는영화 번호
			nm.setNmTitle(nmTitle); // 없는영화 제목
			nm.setNmViewGrade(nmViewGrade); // 관람등급
			nm.setNmStory(nmStory); // 줄거리
			nm.setNmReleaseDate(nmReleaseDate); // 개봉일
			nm.setNmRunTime(nmRunTime); // 러닝타임
			nm.setNmNation(nmNation); // 국가 (1국내 | 2해외)
			nm.setNmUserRequest(nmUserRequest); // 사용자 요청사항
			nm.setNmNicknameStatus(nmNicknameStatus);  // 닉네임 제공여부
			nm.setMemNo(memNo);  // 글 작성한 회원번호
			// 영화 메인포스터 경로
			String changeName1 = multiRequest.getFilesystemName("upfile1");
			String nmPoster = "resources/upfiles/" + changeName1;
			nm.setNmPoster(nmPoster);
			// 영화 메인예고편 경로
			String changeName2 = multiRequest.getFilesystemName("upfile2");
			String nmPreview = "resources/upfiles/" + changeName2;
			nm.setNmPreview(nmPreview);
			
			HttpSession session = request.getSession();
		
			/*-------------------------------------------------------------------------------------------------------*/
			// NO_MOVIE_CAST 테이블에 데이터 기록 (Person Vo 객체에 담아서)
			List<Person> pList = new ArrayList<>();
			
			String[] personNos = multiRequest.getParameterValues("personNo");
			String[] movieJobs =  multiRequest.getParameterValues("movieJob");
			for(int i=0; i<personNos.length; i++) {
				Person p = new Person();
				String personNo = personNos[i];
				String movieJob = movieJobs[i];
				p.setpNo(Integer.parseInt(personNo));
				p.setpJob(movieJob);
				pList.add(p);
				// pList[0] : [인물번호, 감독]
				// pList[1] : [인물번호, 배역명]
				// pList[2] : [인물번호, 배역명]
			}
			// pList[i]에는 출연인물번호 및 배역이 담겨있음
			/*-------------------------------------------------------------------------------------------------------*/
			// NO_MOVIE_GENRE 테이블에 데이터 기록 (Category vo 객체에 담아서)
			String[] categoryArr = multiRequest.getParameterValues("category");
			List<Category> cList = new ArrayList<>();
			for(int i=0; i<categoryArr.length; i++) {
				Category c = new Category();
				String category = categoryArr[i];
				c.setCategoryNo(Integer.parseInt(category));
				cList.add(c);
				// cList[0] : 액션
				// cList[1] : 로맨스
				// cList[2] : 느와르
			}
			/*-------------------------------------------------------------------------------------------------------*/
			// ATACHMENT 테이블에 데이터 기록 (Attachment Vo 객체에 담아서)
			Attachment at = null;
			int ext = 1;
			if(multiRequest.getOriginalFileName("upfile3") != null) {	
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile3"));
				at.setChangeName(multiRequest.getFilesystemName("upfile3"));
				at.setFilePath("resources/upfiles/");
				if(at.getChangeName().substring(at.getChangeName().lastIndexOf(".")).equals("mp4")) {
					ext = 2;
				}
			}
			/*-------------------------------------------------------------------------------------------------------*/
			int result = new NoMovieService().updateNoMovie(nm, pList, cList, at, ext);
		
			if(result > 0) {
				session.setAttribute("alertMsg", "신청하신 없는영화 내용을 수정하였습니다.");
				response.sendRedirect(request.getContextPath() + "/list.noMv?memNo=" + nm.getMemNo());
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
