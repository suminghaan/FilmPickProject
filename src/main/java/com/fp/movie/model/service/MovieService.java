package com.fp.movie.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.dao.MovieDao;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.Review;
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

//	영화 상세보기에서 영화 정보를 불러오는 메소드 [기웅]
	public Movie selectMovieInfo(int movieNo) {
		Connection conn = getConnection();
		Movie m = mDao.selectMovieInfo(conn, movieNo);
		close(conn);
		return m;
	}

//	영화 상세보기에서 추가 사진을 불러오는 메소드 [기웅]
	public ArrayList<Attachment> selectAddiMovie(int movieNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> attList = mDao.selectAddiMovie(conn, movieNo);
		close(conn);
		return attList;
	}


//	영화 상세보기에서 리뷰 정보를 불러오는 메소드 [기웅]
	public ArrayList<Review> selectReviewInfo(int movieNo) {
		Connection conn = getConnection();
		ArrayList<Review> reviewList = mDao.selectReviewInfo(conn, movieNo);
		close(conn);
		return reviewList;
	}


//	영화 상세보기에서 관련 영화 정보를 가져오는 메소드 [기웅]
	public ArrayList<Movie> selectRelMovieList(int movieNo) {
		Connection conn = getConnection();
		ArrayList<Movie> movieList = mDao.selectRelMovieList(conn, movieNo);
		close(conn);
		return movieList;
	}


//	영화에 좋아요 표시하는 메소드 [기웅]
	public int updateMovieLike(int mvNo, int userNo, String isChecked) {
		Connection conn = getConnection();
		
		int result = 0;
		// 좋아요 표시
		if(isChecked.equals("false")) {
			result = mDao.insertMovieLike(conn, mvNo, userNo);
		} else { // 좋아요 표시 제거
			result = mDao.deleteMovieLike(conn, mvNo, userNo);
		}
		
		// 0이면 실패
		if (result != 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
// 첫페이지 영화 포스터 조회 메소드 [용훈]
	public List<Movie> firstselect() {
		Connection conn = getConnection();
		List<Movie> list = mDao.firstselect(conn);
		close(conn);
		return list;
	}


// 메인페이지 영화예고편 조회 메소드
	public List<Movie> selectMainListv() {
		return null;
	}
	
// 메인페이지 영화예고편 조회 메소드
	public List<Movie> selectMainListp() {
		return null;
	}


}
