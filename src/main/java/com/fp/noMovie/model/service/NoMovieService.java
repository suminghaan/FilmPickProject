package com.fp.noMovie.model.service;

import static com.fp.common.template.JDBCTemplate.commit;
import static com.fp.common.template.JDBCTemplate.getConnection;
import static com.fp.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.fp.noMovie.model.dao.NoMovieDao;
import com.fp.noMovie.model.vo.NoMovie;
import com.fp.person.model.vo.Person;

public class NoMovieService {
	
	private NoMovieDao nMDao = new NoMovieDao();

	public int insertNoMovie(NoMovie nm) {
		Connection conn = getConnection();
		int result = nMDao.insertNoMovie(conn, nm);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public int insertNoMoviePerson(List<Person> pList) {
		Connection conn = getConnection();
		int result = nMDao.insertNoMoviePerson(conn, pList);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
}
