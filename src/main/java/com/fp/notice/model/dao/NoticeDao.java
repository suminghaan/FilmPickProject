package com.fp.notice.model.dao;

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

import com.fp.common.model.vo.Attachment;
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
	
	/**
	 * 
	 * @param 호용
	 * @return 총 공지사항 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
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
			close(rset);
			close(pstmt);
		}
		
		return listCount;
		
	}
	

	/**
	 * 
	 * @param 호용
	 * @return 공지사항 메인페이지에 보여질 값을 담고, 페이징바 구현을 위한 메소드
	 */
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
				list.add(new Notice(rset.getInt("NOTICE_NO")
								 , rset.getString("NOTICE_CATEGORY")
								 , rset.getString("NOTICE_TITLE")
								 , rset.getInt("NOTICE_READ_COUNT")
								 , rset.getString("NOTICE_DATE")
								 ));
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
	 * 조회수 증가를 위한 메소드
	 * @호용
	 */
	public int increaseCount(Connection conn, int noticeNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * 클릭시 공지사항 상세페이지에 띄울 값들을 담기위한 메소드
	 * @author 호용
	 */
	public Notice selectNotice(Connection conn, int noticeNo) {
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				n = new Notice(rset.getInt("NOTICE_NO")
							 , rset.getString("NOTICE_CATEGORY")
							 , rset.getString("NOTICE_TITLE")
							 , rset.getString("NOTICE_CONTENT")
							 , rset.getString("NOTICE_DATE")
							 , rset.getInt("NOTICE_READ_COUNT")
							 , rset.getString("ADMIN_ID") // admin테이블 조인
							 , rset.getInt("ADMIN_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}
	
	public Attachment selectAttachment(Connection conn, int noticeNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeNo);
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
	
}
