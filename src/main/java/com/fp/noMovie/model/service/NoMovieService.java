package com.fp.noMovie.model.service;

import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.commit;
import static com.fp.common.template.JDBCTemplate.getConnection;
import static com.fp.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.fp.common.model.vo.Attachment;
import com.fp.movie.model.vo.Category;
import com.fp.noMovie.model.dao.NoMovieDao;
import com.fp.noMovie.model.vo.NoMovie;
import com.fp.person.model.vo.Person;

public class NoMovieService {
	
	private NoMovieDao nMDao = new NoMovieDao();

	/**
	 * @author 호용
	 * 없는영화신청을 위한 메소드
	 */
	public int insertNoMovie(NoMovie nm, List<Person> pList, List<Category> cList, Attachment at, int ext, Attachment at1, Attachment at2) {
		Connection conn = getConnection();
		int result1 = nMDao.insertNoMovie(conn, nm); 
		int result2 = nMDao.insertNoMoviePerson(conn, pList);
		int result3 = nMDao.insertNoMovieCategory(conn, cList);
		int result4 = 1; 
		int result5 = nMDao.insertAttachment(conn, at1, at2); // 메인포스터, 메인예고편영상을 Attachment 테이블에 인설트
		if(at != null) {
			result4 = nMDao.insertNoMovieAttachment(conn, at, ext); // 추가첨부파일을 Attachment 테이블에 인설트
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0 && result5 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result1 * result2 * result3 * result4 * result5;
	}
	
	/**
	 * @author 호용
	 * 신청한 영화 수정을 위한 메소드
	 */
	public int updateNoMovie(NoMovie nm, List<Person> pList, List<Category> cList, Attachment at, int ext) {
		Connection conn = getConnection();
		int result1 = nMDao.updateNoMovie(conn, nm);
		int result2 = nMDao.updateNoMoviePerson(conn, pList, nm);
		int result3 = nMDao.updateNoMovieCategory(conn, cList, nm);
		int result4 = 1;
		
		if(at != null) {
			result4 = nMDao.updateNoMovieAttachment(conn, at, ext, nm);
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result1 * result2 * result3 * result4;
	}
	
	/**
	 * 없는영화신청 현황에 띄울 값들을 담기위한 메소드
	 * @param memNo 회원번호
	 * @author 호용 
	 */
	public List<NoMovie> selectNoMovie(int memNo){
		Connection conn = getConnection();
		List<NoMovie> list = nMDao.selectNoMovie(conn, memNo);
		close(conn);
		return list;
	}
	
	/**
	 * 없는영화 수정페이지에서 띄울 값들을 담기위한 메소드
	 * @author 호용
	 */
	public NoMovie selectNoMovieAll(int noMovieNo){
		Connection conn = getConnection();
		NoMovie nm = nMDao.selectNoMovieAll(conn, noMovieNo);
		close(conn);
//		System.out.println("서비스단에서의 nm : " + nm);
		return nm;
	}
	
	/**
	 * 없는영화 수정페이지에서 띄울 인물 값들을 담기위한 메소드
	 * @author 호용
	 */
	public List<Person> selectNoMoviePerson(int noMovieNo){
		Connection conn = getConnection();
		List<Person> pList = nMDao.selectNoMoviePerson(conn, noMovieNo);
		close(conn);
		return pList;
	}
	
	/**
	 * 없는영화 수정페이지에서 띄울 카테고리 값들을 담기위한 메소드
	 * @author 호용
	 */
	public List<Category> selectNoMovieCategory(int noMovieNo){
		Connection conn = getConnection();
		List<Category> cMyList = nMDao.selectNoMovieCategory(conn, noMovieNo);
		close(conn);
		return cMyList;
	}
	
	/**
	 * 없는영화 수정페이지에서 띄울 추가 첨부파일 값들을 담기위한 메소드
	 * @author 호용
	 */
	public Attachment selectAttachment(int noMovieNo) {
		Connection conn = getConnection();
		Attachment at = nMDao.selectAttachment(conn, noMovieNo);
		close(conn);
		return at;
	}
	
	/**
	 * 없는영화신청페이지에 들어갈 때 카테고리에 띄울 카테고리명들을 담기위한 메소드
	 * @return
	 */
	public List<Category> selectCategory(){
		Connection conn = getConnection();
		List<Category> cList = nMDao.selectCategory(conn);
		close(conn);
		return cList;
	}
	
}
