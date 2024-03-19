package com.fp.movie.model.dao;

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

import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.SearchFilter;

public class MovieDao {
	
	private Properties prop = new Properties();
	
	public MovieDao() { // xml문서 불러오는 구문 [용훈]
		try {
			prop.loadFromXML(new FileInputStream(MovieDao.class.getResource("/db/mappers/movie-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 페이징 하기위해 리스트 갯수 조회 구문 [용훈]
	public int selectListCount(Connection conn, SearchFilter f) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		if(!f.getCurrentScreening().equals("mvAll")) {
			sql += " AND CURRENT_SCREENING = '" + f.getCurrentScreening() + "'";
		}
		if(!f.getCategoryName().equals("categoryAll")) {
			sql += " AND CATEGORY_NO = '" + f.getCategoryName() + "'";
		}
		if(!f.getViewRatiog().equals("viewRatingAll")) {
			sql += " AND VIEW_RATING = '" + f.getViewRatiog() + "'";
		}
		if(!f.getMvNation().equals("nationAll")) {
			sql += " AND MV_NATION = '" + f.getMvNation() + "'";
		}
		if(!f.getMvOpenDate().equals("yearsAll")) {
			sql += " AND MV_OPENDATE LIKE '" + f.getMvOpenDate() + "%'";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 탐색페이지 탐색, 필터 활용 구문 [용훈]
	public List<Movie> selectExploList(Connection conn, SearchFilter f, PageInfo pi) {
		List<Movie> mlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectExploList"); // 전체조회
		
		// CATEGORY 관련 IF문 [용훈]
		if(!f.getCurrentScreening().equals("mvAll")) {
			sql += " AND CURRENT_SCREENING = '" + f.getCurrentScreening() + "'";
		}
		if(!f.getCategoryName().equals("categoryAll")) {
			sql += " AND CATEGORY_NO = '" + f.getCategoryName() + "'";
		}
		if(!f.getViewRatiog().equals("viewRatingAll")) {
			sql += " AND VIEW_RATING = '" + f.getViewRatiog() + "'";
		}
		if(!f.getMvNation().equals("nationAll")) {
			sql += " AND MV_NATION = '" + f.getMvNation() + "'";
		}
		if(!f.getMvOpenDate().equals("yearsAll")) {
			sql += " AND MV_OPENDATE LIKE '" + f.getMvOpenDate() + "%'";
		}
		
		// ORDERBY 관련 IF문 [용훈]
		if(f.getOrderBy().equals("likeMovie")) {
			sql += " ORDER BY LIKECOUNT DESC";
		}else if(f.getOrderBy().equals("lately")) {
			sql += " ORDER BY MV_OPENDATE DESC";
		}else if(f.getOrderBy().equals("korean")) {
			sql += " ORDER BY MV_NAME DESC";
		}else if(f.getOrderBy().equals("reviews")) {
			sql += " ORDER BY REVIEWS DESC";
		}
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				mlist.add(new Movie(rset.getInt("mv_no"),
									rset.getString("mv_name"),
									rset.getString("mv_opendate"),
									rset.getString("mv_poster"),
									rset.getString("like_point")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mlist;
	}

	// 영화 정보와 평균별점, 포스터 파일경로를 조회하는 메소드 [기웅]
	public ArrayList<Movie> selectMovieList(Connection conn, String searchKeyword) {
		String movieInfoStarRatingAvgQuery = prop.getProperty("selectMovieStarRatingAvg");
		String moviePosterPathQuery = prop.getProperty("selectMoviePosterPath");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Movie> movieList = new ArrayList<>();
		
		searchKeyword = '%' + searchKeyword + '%';
		
		try {
			
			// 영화 정보와 평균 별점 조회
			pstmt = conn.prepareStatement(movieInfoStarRatingAvgQuery);
			pstmt.setString(1, searchKeyword);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Movie m = new Movie();
				m.setMvNo(rset.getInt("MV_NO"));
				m.setMvName(rset.getString("MV_NAME"));
				m.setMvOpenDate(rset.getString("MV_OPENDATE"));
				m.setStarRatingAvg(rset.getString("AVG_LIKE_POINT"));
				movieList.add(m);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return movieList;
	}

	


}
