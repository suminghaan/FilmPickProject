package com.fp.inquiry.model.dao;
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
import com.fp.inquiry.model.vo.Inquiry;


public class InquiryDao {
	
	private Properties prop = new Properties();
	
	public InquiryDao() {
		try {
			prop.loadFromXML(new FileInputStream(InquiryDao.class.getResource("/db/mappers/inquiry-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @호용
	 * 1대1문의 신청을 위한 메소드
	 */
	public int insertInquiry(Connection conn, Inquiry in) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInquiry");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, in.getInqryTitle());
			pstmt.setString(2, in.getInqryContent());
			pstmt.setInt(3, in.getMemNo());
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
	 * 1대1문의 신청을 위한 메소드(첨부파일이 있을경우 실행)
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
	 * 
	 * @param 호용
	 * @return 총 문의사항 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int selectListCount(Connection conn, int memNo) {
		// select문 (조회문) 무조건 한행이며 한개의 숫자 => int
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
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
	
	/**
	 * 
	 * @param 호용
	 * @return 고객센터 메인페이지에 보여질 값을 담고, 페이징바 구현을 위한 메소드
	 */
	public List<Inquiry> selectList(Connection conn, PageInfo pi, int memNo){
		List<Inquiry> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(sql);
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Inquiry(rset.getInt("INQRY_NO")
								   , rset.getString("INQRY_TITLE")
								   , rset.getString("INQRY_DATE")
								   , rset.getString("INQRY_STATUS")));
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
	 * 클릭시 문의사항 상세페이지에 띄울 값들을 담기위한 메소드
	 * @param inqryNo 문의사항번호
	 */
	public Inquiry selectInquiry(Connection conn, int inqryNo) {
		Inquiry in = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInquiry");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inqryNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				in = new Inquiry(rset.getInt("INQRY_NO")
						 	   , rset.getString("INQRY_TITLE")
						 	   , rset.getString("INQRY_CONTENT")
						 	   , rset.getString("INQRY_DATE")
						 	   , rset.getInt("I.MEM_NO") 
						 	   , rset.getInt("I.ADMIN_NO")
						 	   , rset.getString("INQRY_A_CONTENT")
						 	   , rset.getString("INQRY_A_DATE")
						 	   , rset.getString("ADMIN_ID")); // admin 테이블과조인
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("dao에서 db와 연결해서 가지고 온 문의사항값 : " + in);
		return in;
	}
	
	/**
	 * 클릭시 문의사항 상세페이지에 띄울 값들을 담기위한 메소드(첨부파일활용)
	 * @param inqryNo 문의사항번호
	 */
	public Attachment selectAttachment(Connection conn, int inqryNo) {
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInquiryAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inqryNo);
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
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("dao에서 db와 연결해서 가지고 온 첨부파일 : " + at);
		return at;
	}
	
}
