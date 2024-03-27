package com.fp.admin.controller.ad_movie;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fp.admin.model.service.CommunityService;
import com.fp.admin.model.service.MovieService;
import com.fp.common.model.vo.Attachment;
import com.fp.common.template.MyFileRenamePolicy;
import com.fp.person.model.vo.Person;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MovieCastingEnrollController
 */
@WebServlet("/insertCasting.admo")
public class MovieCastingEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieCastingEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String pName = multiRequest.getParameter("pName");
			String birth = multiRequest.getParameter("birth");
			String pNation = multiRequest.getParameter("pNation");
			String pJob = multiRequest.getParameter("pJob");
			String ChangeName = multiRequest.getFilesystemName("pFile");
			String pImg = "resources/upfiles/" + ChangeName;
			
			
			Person p = new Person();
			p.setpName(pName);
			p.setpBD(birth);
			p.setpNation(pNation);
			p.setpJob(pJob);
			p.setpFile(pImg);
			
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("pFile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("pFile"));
				at.setChangeName(multiRequest.getFilesystemName("pFile"));
				at.setFilePath("resources/upfiles/");
			}
			
			int result = new MovieService().insertPerson(p, at);
			
			HttpSession session = request.getSession();
			if(result > 0) {
				session.setAttribute("alertMsg", "인물이 성공적으로 등록되었습니다.");
				response.sendRedirect(request.getContextPath() + "/movieCastingList.admo?page=1");
			}else {
				if(at != null) {
					new File(savePath + at.getChangeName()).delete();
				}
				session.setAttribute("alertMsg", "인물 등록 실패. \n다시 입력해주세요.");
				response.sendRedirect(request.getContextPath() + "/enrollCastingForm.admo");
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
