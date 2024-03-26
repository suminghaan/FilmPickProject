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
import com.fp.common.model.vo.Attachment;
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


	// 영화 카테고리 삭제
	public int deleteCategory(String[] cateList) {
		Connection conn = getConnection();
		int result = mDao.deleteCategory(conn, cateList);
		
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 카테고리 추가 
	public int addCategory(String genreAdd) {
		Connection conn = getConnection();
		int result = mDao.addCategory(conn, genreAdd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 카테고리 수정
	public int updateCategory(String genreChange, String categoryNo) {
		Connection conn = getConnection();
		int result = mDao.updateCategory(conn, genreChange, categoryNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 영화 인물 관리 목록 조회 페이징
		public int selectCastingListCount() {
			Connection conn = JDBCTemplate.getConnection();
			int listCount = mDao.selectCastingListCount(conn);
			close(conn);
			return listCount;
		}

	// 인물관리_조회
	public List<Person> selectPersonList(PageInfo pi) {
		Connection conn = getConnection();
		List<Person> list = mDao.selectPersonList(conn, pi);		
		close(conn);
		return list;
	}

	// 인물관리_검색
	public List<Person> searchCasting(String keyword) {
		Connection conn = getConnection();
		List<Person> list = mDao.searchCasting(conn, keyword);
		close(conn);
		return list;
	}

	// 인물관리_추가
	public int insertPerson(Person p, Attachment at) {
		Connection conn = getConnection();
		int result1 = mDao.insertPerson(conn, p);
		
		int result2 = 1;
		if(at != null) {
			result2 = mDao.insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

	// 인물조회시 _ 배우 필터
	public List<Person> selectActorFilter() {
		Connection conn = getConnection();
		List<Person> list = mDao.selectActorFilter(conn);
		close(conn);
		return list;
	}

	// 인물조회시_감독 필터
	public List<Person> selectDirectorFilter() {
		Connection conn = getConnection();
		List<Person> list = mDao.selectDirectorFilter(conn);
		close(conn);
		return list;
	}

	// 인물 삭제
	public int deletePerson(int pno) {
		Connection conn = getConnection();
		int result1 = mDao.deletePerson(conn, pno);
		int result2 = mDao.deletePersonAttachment(conn, pno);
		
		
		if(result1 > 0 && result2 >= 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		int result = result1 + result2;
		return result;
	}

	// 인물 수정모달에서 정보 보기
	public List<Person> updateCastingForm(String pno) {
		Connection conn = getConnection();
		List<Person> uplist = mDao.updateCastingForm(conn, pno);
		close(conn);
		return uplist;
	}

	// 인물 수정 
	public int updatePerson(Person p, Attachment at) {
		Connection conn = getConnection();
		int result1 = mDao.updatePerson(conn, p);
		
		int result2 = 1;
		if(at != null) {
			if(at.getFileNo() != 0) {
				result2 = mDao.updatepAttachment(conn,at);
			}else {
				result2 = mDao.insertpNewAttachment(conn, at);
			}
		}
		
		if(result1 > 0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

	// 영화 등록 
	public int insertMovie(Movie m, List<Person> pList, List<Category> cList, List<Attachment> atList) {
		Connection conn = getConnection();
		int result1 = mDao.insertMovie(conn, m);
		int result2 = mDao.insertMoivePerson(conn, pList);
		int result3 = mDao.insertMovieCategory(conn, cList);
		int result4 = 0;
		
		if(atList != null) {
			for(int i=0; i<atList.size(); i++) {
				result4 += mDao.insertMovieAttachment(conn, atList.get(i));				
			}			
		}
		
		if(result1 > 0 && result2 >0 && result3 >0 && result4 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}

		return result1 * result2 * result3 * result4;
	}

	
	
	
	
	
	
	
}
