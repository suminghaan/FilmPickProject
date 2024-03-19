package com.fp.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.fp.common.template.JDBCTemplate.close;
import com.fp.board.model.vo.Board;
import com.fp.movie.model.vo.Movie;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/db/mappers/board-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 커뮤니티 메인페이지 영화카테고리의 인기글들에 띄울 값들을 담기 위한 메소드
	 * @호용
	 */
	public List<Board> selectMainPublicList(Connection conn){
		List<Board> publicList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainPublicList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				publicList.add(new Board(rset.getInt("B_NO")
								 , rset.getString("B_TITLE")
								 , rset.getString("B_REGIST_DATE")
								 , rset.getInt("B_READ_COUNT")
								 , rset.getInt("B_RECOMMEND_COUNT")
								 , rset.getString("B_CATEGORY")
								 , rset.getString("NICKNAME")
								 , rset.getString("TITLEIMG_URL")
								 , rset.getInt("REPLY_COUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return publicList;
	}
	
	/**
	 * 커뮤니티 메인페이지 영화카테고리의 일반글에 띄울 값들을 담기 위한 메소드
	 * @호용
	 */
	public List<Board> selectMainList(Connection conn){
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Board(rset.getInt("B_NO")
								 , rset.getString("B_TITLE")
								 , rset.getString("B_REGIST_DATE")
								 , rset.getInt("B_READ_COUNT")
								 , rset.getInt("B_RECOMMEND_COUNT")
								 , rset.getString("B_CATEGORY")
								 , rset.getString("NICKNAME")
								 , rset.getString("TITLEIMG_URL")
								 , rset.getInt("REPLY_COUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	/**
	 * 커뮤니티 메인페이지 잡담카테고리의 일반글에 띄울 값들을 담기 위한 메소드
	 * @호용
	 */
	public List<Board> selectMainChatList(Connection conn){
		List<Board> chatList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainChatList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				chatList.add(new Board(rset.getInt("B_NO")
								 , rset.getString("B_TITLE")
								 , rset.getString("B_REGIST_DATE")
								 , rset.getInt("B_READ_COUNT")
								 , rset.getInt("B_RECOMMEND_COUNT")
								 , rset.getString("B_CATEGORY")
								 , rset.getString("NICKNAME")
								 , rset.getString("TITLEIMG_URL")
								 , rset.getInt("REPLY_COUNT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return chatList;
	}
	
	/**
	 * 커뮤니티 메인페이지의 우측에 인기영화란의 영화제목을 담기위한 메소드 호출구문
	 * @호용
	 */
	public List<Movie> selectPublicMovieName(Connection conn){
		List<Movie> mList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPublicMovieName");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Movie m = new Movie();
				m.setMvName(rset.getString("MV_NAME"));
				mList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mList;
	}
	
}


















