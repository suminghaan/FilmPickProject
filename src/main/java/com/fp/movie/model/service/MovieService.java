package com.fp.movie.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.dao.MovieDao;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.SearchFilter;

public class MovieService {
	
	private MovieDao mDao = new MovieDao();
	
	// 페이징 하기위해 리스트 갯수 조회 구문 [용훈]
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = mDao.selectListCount(conn);
		
		close(conn);
		return listCount;
	}
	
	// 탐색페이지 페이징 구문 [용훈]
	public List<Movie> selectList(PageInfo pi) {
		Connection conn = getConnection();
		List<Movie> list = mDao.selectList(conn, pi);
		close(conn);
		return list;
	}
	
	// 탐색페이지 필터 활용 구문 [용훈]
	public List<Movie> selectExploList(SearchFilter f){
		
		Connection conn = getConnection();
		List<Movie> mlist = mDao.selectExploList(conn, f);
		
		close(conn);
		return mlist;
	}


}
