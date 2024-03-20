package com.fp.board.model.dao;

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

import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
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
	
	/**
	 * 커뮤니티 영화이름 클릭시 영화 상세페이지 이동을 위한 영화번호를 담기위한 메소드
	 * @author 호용
	 */
	public List<Movie> selectAllMovie(Connection conn){
		List<Movie> allMovie = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPublicMovieName");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Movie m = new Movie();
				m.setMvNo(rset.getInt("MV_NO"));
				m.setMvName(rset.getString("MV_NAME"));
				allMovie.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return allMovie;
	}
	
	/**
	 * 
	 * @param 호용
	 * @return 총 게시글 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery(); // 완성형 SELECT문이라서 바로 rset에 담을 수 있음
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT"); // 조회문은 변수.next()로 한행 밀어야됨
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;	
	}
	
	/**
	 * 커뮤니티 영화카테고리 인기게시글에 띄울 값들을 구하기위한 메소드
	 * @호용
	 */
	public List<Board> selectPublicList(Connection conn, PageInfo pi){
		List<Board> publicList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPublicList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
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
	 * 커뮤니티 영화카테고리 전체게시글에 띄울 값들을 구하기위한 메소드
	 * @호용
	 */
	public List<Board> selectList(Connection conn, PageInfo pi){
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
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
	 * 커뮤니티 잡담카테고리 전체게시글에 띄울 값들을 구하기위한 메소드
	 * @호용
	 */
	public List<Board> selectChatList(Connection conn, PageInfo pi){
		List<Board> chatList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectChatList");
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
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
	 * @호용
	 * 게시글 등록을 위한 메소드
	 */
	public int insertBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getbCategory());
			pstmt.setString(2, b.getbTitle());
			pstmt.setString(3, b.getbContent());
			pstmt.setString(4, b.getMemNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @호용
	 * 게시글 등록을 위한 메소드 (첨부파일이 있을경우 실행)
	 */
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 조회수 증가를 위한 메소드
	 * @호용
	 */
	public int increaseCount(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 클릭시 게시글 상세페이지에 띄울 값들을 담기위한 메소드
	 * @author 호용
	 */
	public Board selectBoard(Connection conn, int boardNo) {
		Board b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				b = new Board(rset.getInt("B_NO")
							, rset.getString("B_TITLE")
							, rset.getString("B_CONTENT")
							, rset.getString("B_REGIST_DATE")
						    , rset.getString("B_CATEGORY")
						    , rset.getString("MEM_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}
	
	/**
	 * 클릭시 게시글 상세페이지에 띄울 값들을 담기위한 메소드(첨부파일)
	 * @author 호용
	 */
	public Attachment selectAttachment(Connection conn, int boardNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}
	
	/**
	 * 게시글 수정을 위한 메소드
	 * @author 호용
	 */
	public int updateBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getbCategory());
			pstmt.setString(2, b.getbTitle());
			pstmt.setString(3, b.getbContent());
			pstmt.setInt(4, b.getbNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 게시글 수정시 첨부파일 수정을 위한 메소드
	 * @author 호용
	 */
	public int updateAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 게시글 수정시 첨부파일 업로드를 위한 메소드
	 * @author 호용
	 */
	public int insertNewAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}


















