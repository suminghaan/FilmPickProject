package com.fp.noMovie.model.service;

import static com.fp.common.template.JDBCTemplate.commit;
import static com.fp.common.template.JDBCTemplate.getConnection;
import static com.fp.common.template.JDBCTemplate.rollback;
import static com.fp.common.template.JDBCTemplate.close;

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
	public int insertNoMovie(NoMovie nm, List<Person> pList, List<Category> cList, Attachment at, int ext) {
		Connection conn = getConnection();
		int result1 = nMDao.insertNoMovie(conn, nm);
		int result2 = nMDao.insertNoMoviePerson(conn, pList);
		int result3 = nMDao.insertNoMovieCategory(conn, cList);
		int result4 = 1;
		
		if(at != null) {
			result4 = nMDao.insertNoMovieAttachment(conn, at, ext);
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
	
}
