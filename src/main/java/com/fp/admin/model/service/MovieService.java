package com.fp.admin.model.service;
import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.fp.admin.model.dao.MovieDao;
import com.fp.movie.model.vo.Movie;

public class MovieService {
	
	private MovieDao mDao = new MovieDao();
	
	// 메인페이지 영화 조회 구문 [용훈]
	/*
	public List<Movie> selectMainList() {
		
		Connection conn = getConnection();
		
		List<Movie> list = mDao.selectMainList(conn);
		
		close(conn);
		
		return list;
	}
	*/
}
