package com.fp.admin.model.service;
import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.commit;
import static com.fp.common.template.JDBCTemplate.getConnection;
import static com.fp.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.fp.admin.model.dao.MovieDao;
import com.fp.admin.model.vo.Notice;
import com.fp.common.model.vo.PageInfo;
import com.fp.common.template.JDBCTemplate;
import com.fp.movie.model.vo.Category;
import com.fp.movie.model.vo.Movie;
import com.fp.person.model.vo.Person;


public class MovieService {
	
	private MovieDao mDao = new MovieDao();

	// 영화 조회 페이징
	public int selectMovieListCount() {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = mDao.selectMovieListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 영화 조회 
	public List<Movie> selectMovieList(PageInfo pi) {
		Connection conn = getConnection();
		List<Movie> list = mDao.selectMovieList(conn, pi);
		close(conn);
		return list;
	}

	// 영화 조회 시 검색 기능
	public List<Movie> searchMovie(String keyword) {
		Connection conn = getConnection();
		List<Movie> list = mDao.searchMovie(conn, keyword);
		close(conn);
		return list;
	}

	// 영화 삭제 
	public int deleteMovie(int mvNo) {
		Connection conn = getConnection();
		int result1 = mDao.deleteMovie(conn, mvNo);
		int result2 = mDao.deleteMovieAttachment(conn, mvNo);
		
		
		if(result1 > 0 && result2 >= 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		int result = result1 + result2;
		return result;
	}

	// 영화 관리버튼 => 영화 정보 상세보기_영화
	public Movie MovieListDetail(int mvNo) {
		Connection conn = getConnection();
		Movie m = mDao.MovieListDetail(conn, mvNo);
		close(conn);
		return m;
	}
	// 영화 관리버튼 => 영화 정보 상세보기_인물
	public List<Person> MovieListDetailPerson(int mvNo){
		Connection conn = getConnection();
		List<Person> plist = mDao.moiveListDetailPerson(conn, mvNo);
		close(conn);
		return plist;
	}

	// 영화카테고리관리 조회 
	public List<Category> movieCategoryList() {
		Connection conn = getConnection();
		List<Category> list = mDao.movieCategoryList(conn);		
		close(conn);
		return list;
	}

	// 영화 인물 관리 목록 조회 페이징
	public int selectCastingListCount() {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = mDao.selectCastingListCount(conn);
		close(conn);
		return listCount;
	}

	// 영화 카테고리 삭제
	public int deleteCategory(int cNo) {
		Connection conn = getConnection();
		int result = mDao.deleteCategory(conn, cNo);
		
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	
	
	
}
