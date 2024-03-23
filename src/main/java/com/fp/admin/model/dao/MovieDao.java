package com.fp.admin.model.dao;

import static com.fp.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fp.admin.model.vo.Notice;
import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.vo.Category;
import com.fp.movie.model.vo.Movie;
import com.fp.notice.model.dao.NoticeDao;

public class MovieDao {
	
	private Properties prop = new Properties();
	
	public MovieDao() {
		try {
			prop.loadFromXML(new FileInputStream(MovieDao.class.getResource("/db/mappers/admin_movie-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 관리자 영화 조회 페이징
	public int selectMovieListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	// 관리자 영화 조회 
	public List<Movie> selectMovieList(Connection conn, PageInfo pi) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("mv_no"),
									rset.getString("mv_name"),
									rset.getString("mv_date"),
									rset.getString("view_rating"),
									rset.getString("mv_opendate"),
									rset.getString("category_names")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	// 영화 조회 시 검색 
	public List<Movie> searchMovie(Connection conn, String keyword) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, keyword);

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("mv_no"),
									rset.getString("mv_name"),
									rset.getString("mv_date"),
									rset.getString("view_rating"),
									rset.getString("mv_opendate"),
									rset.getString("CATEGORY_NAMES")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 영화 삭제
	public int deleteMovie(Connection conn, int mvNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 영화 삭제 시 파일 삭제
	public int deleteMovieAttachment(Connection conn, int mvNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMovieAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 영화 관리버튼 => 영화 정보 상세보기 
	public List<Movie> MovieListDetail(Connection conn, int mvNo) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("MovieListDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("mv_no"),
									rset.getString("mv_name"),
									rset.getString("mv_opendate"),
									rset.getString("mv_nation"),
									rset.getString("mv_rtime"),
									rset.getString("mv_story"),
									rset.getString("fpage_exposed"),
									rset.getString("view_rating"),
									rset.getString("current_screening"),
									rset.getString("mv_poster"),
									rset.getString("mv_preview"),
									rset.getString("category_name"),
									rset.getString("casting"),
									rset.getString("nm_user_request"),
									rset.getString("mem_no"),
									rset.getString("admin_no")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 영화 카테고리 조회
	public List<Category> movieCategoryList(Connection conn) {
		List<Category> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("movieCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getInt("category_no"),
									rset.getString("category_name"),
									rset.getString("category_status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 인물 조회 리스트 페이징
	public int selectCastingListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCastingListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	
}
