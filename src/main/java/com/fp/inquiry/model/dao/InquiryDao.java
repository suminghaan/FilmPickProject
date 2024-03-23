package com.fp.inquiry.model.dao;
import static com.fp.common.template.JDBCTemplate.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.fp.common.model.vo.Attachment;
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
	
}
