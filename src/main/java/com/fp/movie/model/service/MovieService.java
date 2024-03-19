package com.fp.movie.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.dao.MovieDao;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.SearchFilter;

public class MovieService {
	
	private MovieDao mDao = new MovieDao();
	
	// 페이징 하기위해 리스트 갯수 조회 구문 [용훈]
	public int selectListCount(SearchFilter f) {
		Connection conn = getConnection();
		int listCount = mDao.selectListCount(conn, f);
		
		close(conn);
		return listCount;
	}
	
	
	
	// 탐색페이지 탐색,필터 활용 구문 [용훈]
	public List<Movie> selectExploList(SearchFilter f, PageInfo pi){
		
		Connection conn = getConnection();
		List<Movie> mlist = mDao.selectExploList(conn, f, pi);
		
		close(conn);
		return mlist;
	}

	// 검색페이지에서 검색 키워드에 따라 영화 정보와 평균 별점을 조회하는 메소드[기웅]
	public ArrayList<Movie> selectMovieList(String searchKeyword) {
		Connection conn = getConnection();
		ArrayList<Movie> movieList = mDao.selectMovieList(conn, searchKeyword);
		close(conn);
		return movieList;
	}
	
	// 검색페이지에서 검색 키워드에 따라 영화의 메인 포스터 첨부파일의 경로를 조회하는 메소드[기웅]
	public ArrayList<Attachment> selectPosterList(String searchKeyword) {
		Connection conn = getConnection();
		ArrayList<Attachment> posterList = mDao.selectPosterList(conn, searchKeyword);
		close(conn);
		return posterList;
	}


}
