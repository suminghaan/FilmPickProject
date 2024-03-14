package com.fp.movie.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.dao.MovieDao;
import com.fp.movie.model.vo.Movie;

public class MovieService {
	
	private MovieDao mDao = new MovieDao();
	
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = mDao.selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	public List<Movie> selectList(PageInfo pi) {
		Connection conn = getConnection();
		List<Movie> list = mDao.selectList(conn, pi);
		close(conn);
		return list;
	}
	
	public List<Movie> selectExploList(){
		
		Connection conn = getConnection();
		List<Movie> list = mDao.selectExploList(conn);
		
		close(conn);
		return list;
	}


}
