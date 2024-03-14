package com.fp.notice.model.dao;

import static com.fp.common.template.JDBCTemplate.*;

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
import com.fp.common.model.vo.PageInfo;
import com.fp.notice.model.vo.Notice;

public class NoticeDao {

	private Properties prop = new Properties();
	
	public NoticeDao() {
		try {
			prop.loadFromXML(new FileInputStream(NoticeDao.class.getResource("/db/mappers/notice-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 공지사항 및 게시글 페이지의 게시글들을 보여주며, 페이징바에 필요한 메소드
	public int selectListCount(Connection conn) {
		// select문 (조회문) 무조건 한행이며 한개의 숫자 => int
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
			//close(rset); 주석은 나중에 db연동되면 풀 계획
			//close(pstmt); 주석은 나중에 db연동되면 풀 계획
		}
		
		return listCount;
		
	}
	
	// 페이징바 구현을 위한 메소드
	public List<Notice> selectList(Connection conn, PageInfo pi){
		// selcet => 여러행 => 리스트에 담기
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			/*
			 * boardLimit : 10일 경우
			 * currentPage : 1 => boardLimit에 보여질 게시글의 시작값 : 1  / 끝값 : 10
			 * cerrentPage : 2 => boardLimit에 보여질 게시글의 시작값 : 11 / 끝값 : 20
			 * 
			 * 시작값 : (currentPage-1) * boardLimit + 1
			 * 끝값 : 시작값 + boardLimit - 1
			 */
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			// rset에 담겨 있는 sql문 내용을 list 객체에 담아주는 구문
			while(rset.next()) {
//				list.add(new Notice(rset.getInt("BOARD_NO")		=> 나중에 객체만들고 필드 만들면 주석 풀기
//								 , rset.getString("CATEGORY_NAME")
//								 , rset.getString("BOARD_TITLE")
//								 , rset.getString("USER_ID")
//								 , rset.getInt("READ_COUNT")
//								 , rset.getString("REGIST_DATE")
//								 ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
}
