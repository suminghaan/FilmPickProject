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
 * Servlet implementation class MovieUpdateController
 */
@WebServlet("/updateMovie.admo")
public class MovieUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 100 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			HttpSession session = request.getSession();
			// movie 
			int mNo = Integer.parseInt(multiRequest.getParameter("mNo"));
			String mTitle = multiRequest.getParameter("mTitle");
			String viewRating = multiRequest.getParameter("mGrade");
			String mStory = multiRequest.getParameter("mContent");
			String mvOpenDate = multiRequest.getParameter("dateIn");
			String runTime = multiRequest.getParameter("runningTime");
			String currentScreening = multiRequest.getParameter("currentScreening");			
			String mNation = multiRequest.getParameter("nation");
			
			String originPoster = multiRequest.getParameter("originPoster");
			String originPreview = multiRequest.getParameter("originPreview");
			
			String changeNameposter = multiRequest.getFilesystemName("mposter");
			String changeNamepreview = multiRequest.getFilesystemName("mpreview");
			
			String mPoster = null;
			// null이면 원래 포스터가 등록되도록
			if (multiRequest.getFilesystemName("mposter") == null) {
				mPoster = originPoster;
			// null이 아니면 새로운 포스터가 등록되도록
			} else {
				mPoster = "resources/upfiles/" + changeNameposter;
			}
			
			String mpreview = null;
			// null이면 원래 미리보기가 등록되도록
			if (multiRequest.getFilesystemName("pmreivew") == null) {
				mpreview = originPreview;
				// null이 아니면 새로운 미리보기가 등록되도록
			} else {
				mpreview = "resources/upfiles/" + changeNamepreview;
			}
			

			
			
			Movie m = new Movie();
			m.setMvNo(mNo);
			m.setMvName(mTitle);
			m.setViewRating(viewRating);
			m.setMvStory(mStory);
			m.setMvOpenDate(mvOpenDate);
			m.setMvRTime(runTime);
			m.setCurrentScreening(currentScreening);
			m.setMvNation(mNation);
			m.setMvPoster(mPoster);
			m.setMvPreview(mpreview);
			//--------------------
			// 인물데이터 기록 
						
			
			List<Person> pList = new ArrayList<>();
			
			String[] personNos = multiRequest.getParameterValues("personNo");
			String[] movieJobs =  multiRequest.getParameterValues("movieJob");
			System.out.print(personNos);
			System.out.print(movieJobs);
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

				if(multiRequest.getOriginalFileName("mposter") != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName("mposter"));
					at.setChangeName(multiRequest.getFilesystemName("mposter"));
					at.setFilePath("resources/upfiles/");
					at.setFileLevel(1);
					at.setFileType(1);
					at.setRefType("1");
					at.setRefNo(mNo);
					atList.add(at);
				}
				
				if(multiRequest.getOriginalFileName("mpreview") != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName("mpreview"));
					at.setChangeName(multiRequest.getFilesystemName("mpreview"));
					at.setFilePath("resources/upfiles/");
					at.setFileLevel(1);
					at.setFileType(2);
					at.setRefType("2");
					at.setRefNo(mNo);
					atList.add(at);
				}
				
				
				
				if(multiRequest.getOriginalFileName("upfile") != null) {
					Attachment at = new Attachment();
					at.setOriginName(multiRequest.getOriginalFileName("upfile"));
					at.setChangeName(multiRequest.getFilesystemName("upfile"));
					at.setFilePath("resources/upfiles/");
					at.setFileLevel(2);
					at.setRefNo(mNo);
									
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
			System.out.print(m);
			System.out.print(pList);
			System.out.print(cList);
			System.out.print(atList);
			int result = new MovieService().updateMovie(m, pList, cList, atList);
			
			if(result > 0) {
				session.setAttribute("alertMsg", "영화가 성공적으로 수정되었습니다.");
				response.sendRedirect(request.getContextPath() + "/list.admo?page=1");
			}else {
				if(atList != null) {
					for(int i=0; i<atList.size(); i++) {
						new File(savePath + atList.get(i).getChangeName()).delete();
					}
					session.setAttribute("alertMsg", "영화수정 실패. 다시 입력해주세요.");
					response.sendRedirect(request.getContextPath() + "/list.admo?page=1");
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
