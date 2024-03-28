package com.fp.admin.model.dao;

import static com.fp.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
import com.fp.inquiry.model.vo.Inquiry;
import com.fp.member.model.vo.Member;
import com.fp.noMovie.model.vo.NoMovie;

public class CustomerCenterDao {
	private Properties prop = new Properties();

	public CustomerCenterDao() {
		try {
			prop.loadFromXML(
					new FileInputStream(MemberDao.class.getResource("/db/mappers/admin-cusotmercenter-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	/** 없는영화 신청 목록 조회, 페이징 용도
	 * 
	 * @author 김지우
	 * @param conn
	 * @return listCount
	 */
	public int selectnoMovieRequestListCount(Connection conn) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectnoMovieRequestListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if (rset.next()) {
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

	/** 없는영화 신청 목록 조회, 페이징 용도
	 * 
	 * @author 김지우
	 * @param conn
	 * @param pi 
	 * @return list
	 */
	public List<NoMovie> selectnoMovieRequestList(Connection conn, PageInfo pi) {
		List<NoMovie> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectnoMovieRequestList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new NoMovie(rset.getString("NM_TITLE")
									, rset.getString("NM_POSTER")
									, rset.getString("NM_ENROLL_DATE")
									, rset.getString("NM_APPROVAL")
									, rset.getString("NM_STORY")
									, rset.getInt("MEM_NO")
									, rset.getString("NICKNAME")
									, rset.getInt("NM_ENROLL_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;

	}


	/** 승인여부 필터 용도
	 * 
	 * @author 김지우
	 * @param conn
	 * @param approval 
	 * @return list 
	 */
	public List<NoMovie> selectApprovalFilter(Connection conn, String approval) {
		List<NoMovie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectApprovalFilter");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, approval);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new NoMovie(rset.getString("NM_TITLE")
						, rset.getString("NM_POSTER")
						, rset.getString("NM_ENROLL_DATE")
						, rset.getString("NM_APPROVAL")
						, rset.getString("NM_STORY")
						, rset.getInt("MEM_NO")
						, rset.getString("NICKNAME")
						, rset.getInt("NM_ENROLL_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	/** 1대1문의 조회, 페이징 용도
	 * 
	 * @param conn
	 * @return listCount
	 */
	public int selectInquiryListCount(Connection conn) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInquiryListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			if (rset.next()) {
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


	/** 1대1문의 조회, 페이징 용도
	 * @param conn
	 * @param pi
	 * @return list
	 */
	public List<Inquiry> selectInquiryList(Connection conn, PageInfo pi) {
		List<Inquiry> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectInquiryList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Inquiry(rset.getInt("INQRY_NO")
									, rset.getString("INQRY_TITLE")
									, rset.getString("INQRY_CONTENT")
									, rset.getString("INQRY_STATUS")
									, rset.getString("INQRY_A_CONTENT")
									, rset.getString("INQRY_DATE")
									, rset.getString("ORIGIN_NAME")
									, rset.getString("AT_URL")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public int updateInquiryAnswer(Connection conn, String inquiryAnswer, int adminNo, int inqryNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateInquiryAnswer");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inquiryAnswer);
			pstmt.setInt(2, adminNo);
			pstmt.setInt(3, inqryNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int deleteInquiryAnswer(Connection conn, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteInquiryAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int approvalNoMovieRequest(Connection conn, String movieName, String viewGrade, String mContent,
			String openDate, String runningTime, String nation, String upfile1, String upfile2) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("approvalNoMovieRequest");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieName);
			pstmt.setString(2, openDate);
			pstmt.setString(3, nation);
			pstmt.setString(4, runningTime);
			pstmt.setString(5, mContent);
			pstmt.setString(6, viewGrade);
			pstmt.setString(7, upfile1);
			pstmt.setString(8, upfile2);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int approvalNoMovieRequest(Connection conn, String noMovieNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("approvalNoMovieRequest");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, noMovieNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	


}
