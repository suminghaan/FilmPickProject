package com.fp.admin.controller.ad_movie;

import java.io.File;
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

import com.fp.admin.model.service.MovieService;
import com.fp.common.model.vo.Attachment;
import com.fp.common.template.MyFileRenamePolicy;
import com.fp.movie.model.vo.Category;
import com.fp.movie.model.vo.Movie;
import com.fp.person.model.vo.Person;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MovieInsertController
 */
@WebServlet("/insertMovie.admo")
public class MovieInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieInsertController() {
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

			// movie_enroll 데이터 기록
			Movie m = new Movie();
			String mTitle = multiRequest.getParameter("mTitle"); // 영화제목
			String mGrade = multiRequest.getParameter("mGrade"); // 영화관람등급
			String mContent = multiRequest.getParameter("mContent"); // 영화줄거리
			String openDate = multiRequest.getParameter("openDate"); // 영화개봉일
			String runTime = multiRequest.getParameter("runTime"); // 영화러닝타임
			String mNation = multiRequest.getParameter("nation"); // 국내(1)/해외(2)
			String currentScreening = multiRequest.getParameter("currentScreening"); // 현재상영여부(N/Y)
			
			m.setMvName(mTitle);
			m.setViewRating(mGrade);
			m.setMvStory(mContent);
			m.setMvOpenDate(openDate);
			m.setMvRTime(runTime);
			m.setMvNation(mNation);
			m.setCurrentScreening(currentScreening);
			
			// 영화 메인포스터 경로
			String changeName1 = multiRequest.getFilesystemName("mposter");
			String mPoster = "resources/upfiles/" + changeName1;
			m.setMvPoster(mPoster);
			
			// 영화 메인예고편 경로
			String changeName2 = multiRequest.getFilesystemName("mpreview");
			String mPreview = "resources/fupfiles/" + changeName2;
			m.setMvPreview(mPreview);
			
			HttpSession session = request.getSession();
			
			/*-----------------------------------------------------*/
			// 인물데이터 기록 
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
			/*-----------------------------------------------------*/
			// 카테고리 데이터 기록
			String[] categoryArr = multiRequest.getParameterValues("category");
			List<Category> cList = new ArrayList<>();
			for(int i=0; i<categoryArr.length; i++) {
				Category c = new Category();
				c.setCategoryNo(Integer.parseInt(categoryArr[i]));
				cList.add(c);
			}
			/*-----------------------------------------------------*/
			// ATTACHEMNT 테이블에 데이터 기록
			List<Attachment> atList = new ArrayList<>();

			
			if(multiRequest.getOriginalFileName("mPoster") != null) {
				Attachment at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("mPoster"));
				at.setChangeName(multiRequest.getFilesystemName("mPoster"));
				at.setFilePath("resources/upfiles/");
				at.setFileLevel(1);
				at.setFileType(1);
				at.setRefType("1");
			}
			
			if(multiRequest.getOriginalFileName("mpreview") != null) {
				Attachment at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("mpreview"));
				at.setChangeName(multiRequest.getFilesystemName("mpreview"));
				at.setFilePath("resources/upfiles/");
				at.setFileLevel(1);
				at.setFileType(2);
				at.setRefType("2");
			}
			
			
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				Attachment at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/upfiles/");
				at.setFileLevel(2);
								
				if(at.getChangeName().substring(at.getChangeName().lastIndexOf(".")).equals("mp4")) {
					at.setFileType(2);
					at.setRefType("2");
				}else {
					at.setFileType(1);
					at.setRefType("1");
				}
				atList.add(at);
			}
			/*-----------------------------------------------------*/
			int result = new MovieService().insertMovie(m, pList, cList, atList);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "영화가 성공적으로 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.admo?page=1");
			}else {
				if(atList != null) {
					for(int i=0; i<atList.size(); i++) {
						new File(savePath + atList.get(i).getChangeName()).delete();
					}
					session.setAttribute("alertMsg", "영화등록 실패. 다시 입력해주세요.");
					response.sendRedirect(request.getContextPath() + "/movieEnrollForm.admo");
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
