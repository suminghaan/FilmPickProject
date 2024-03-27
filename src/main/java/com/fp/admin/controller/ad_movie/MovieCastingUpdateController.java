package com.fp.admin.controller.ad_movie;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fp.admin.model.service.MovieService;
import com.fp.common.model.vo.Attachment;
import com.fp.common.template.MyFileRenamePolicy;
import com.fp.person.model.vo.Person;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class MovieCastingUpdateController
 */
@WebServlet("/updateCasting.admo")
public class MovieCastingUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieCastingUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10 *1024 *1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			int pno = Integer.parseInt(multiRequest.getParameter("pno"));
			String pName = multiRequest.getParameter("pName");
			String pDate = multiRequest.getParameter("pDate");
			String pNation = multiRequest.getParameter("pNation");
			String pJob = multiRequest.getParameter("pJob");
			
			String originPimg = multiRequest.getParameter("originPimg");
			String changeNamePimg = multiRequest.getParameter("upfile");
			
			String pImg = null;
			if(multiRequest.getFilesystemName("pImg") == null) {
				pImg = originPimg;
			} else {
				pImg = "resources/upfiles/" + changeNamePimg;
			}
			
			System.out.print(pImg);
			
			Person p = new Person();
			p.setpNo(pno);
			p.setpName(pName);
			p.setpBD(pDate);
			p.setpNation(pNation);
			p.setpJob(pJob);
			p.setpFile(pImg);
			Attachment at = null;
			
			if(multiRequest.getOriginalFileName("upfile") != null) {
				at = new Attachment();
				at.setOriginName(multiRequest.getOriginalFileName("upfile"));
				at.setChangeName(multiRequest.getFilesystemName("upfile"));
				at.setFilePath("resources/upfiles/");
				
				if(multiRequest.getParameter("originFileNo") != null) {
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
				}else {
					at.setRefNo(pno);
				}
			}
			int result = new MovieService().updatePerson(p, at);
			
			if(result > 0) {
				request.getSession().setAttribute("alertMsg", "인물이 수정 완료 되었습니다.");
				response.sendRedirect(request.getContextPath() + "/movieCastingList.admo?page=1");
			}else {
				request.getSession().setAttribute("alertMsg", "인물 수정 실패");
				response.sendRedirect(request.getContextPath() + "/movieCastingList.admo?page=1");
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
