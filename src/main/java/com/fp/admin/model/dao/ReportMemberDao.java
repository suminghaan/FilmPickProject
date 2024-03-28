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

import com.fp.admin.model.vo.CancelMember;
import com.fp.admin.model.vo.ReportedMember;
import com.fp.common.model.vo.PageInfo;
import com.fp.member.model.vo.Member;

public class ReportMemberDao {
	private Properties prop = new Properties();

	public ReportMemberDao() {
		try {
			prop.loadFromXML(
					new FileInputStream(MemberDao.class.getResource("/db/mappers/report-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/** 신고회원조회, 페이징
	 * 
	 * @author 김지우
	 * @param conn
	 * @return listCount
	 */
	public int selectReportMemberListCount(Connection conn) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportMemberListCount");

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

	/** 신고회원조회, 페이징
	 * 
	 * @author 김지우
	 * @param conn
	 * @param pi
	 * @return list
	 */
	public List<Member> selectReportMemberList(Connection conn, PageInfo pi) {
		List<Member> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReportMemberList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getString("MEM_ID"), rset.getString("NICKNAME"), rset.getInt("REPORTCOUNT"),
						rset.getString("SIGNIN_DATE"), rset.getInt("BOARDCOUNT"), rset.getInt("REPLYCOUNT"),
						rset.getString("REPORT_CONTENT"), rset.getInt("MEM_NO")));

				System.out.println(rset.getString("MEM_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	/**	이용제한회원 조회, 페이징 
	 * @param conn
	 * @return listCount
	 */
	public int selectRestrictedMemberListCount(Connection conn) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRestrictedMemberListCount");

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

	/** 이용제한회원 조회, 페이징 
	 * 
	 * @author 김지우
	 * @param conn
	 * @param pi
	 * @return list
	 */
	public List<ReportedMember> selectRestrictedMemberList(Connection conn, PageInfo pi) {
		List<ReportedMember> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRestrictedMemberList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new ReportedMember(rset.getInt("MEM_NO"), rset.getString("MEM_ID"),
						rset.getString("LIMIT_REASON"), rset.getString("ACTIVITY_STATUS"),
						rset.getString("SUSPEND_DATE"), rset.getString("NICKNAME"),
						rset.getInt("ADMIN_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 탈퇴회원 필터 조회 구문 [용훈]
	public List<CancelMember> cancelMemberList(Connection conn, String userId, String sDate, String eDate) {
		List<CancelMember> cml = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("cancelMemberList");
		System.out.println(userId);
		System.out.println(sDate);
		System.out.println(eDate);
		if (!userId.equals("") || !sDate.equals("") || !eDate.equals("")) {
			sql += " WHERE ";
			if (!userId.equals("")) {
				sql += "MEM_ID LIKE '%" + userId + "%'";
			}
			if (!sDate.equals("") || !eDate.equals("")) {
				if (!userId.equals("")) {
					sql += " AND ";
				}
				if (!sDate.equals("") && !eDate.equals("")) {
					sql += "CANCEL_DATE >= '" + sDate + "' AND CANCEL_DATE <= '" + eDate + "'";
				} else if (!eDate.equals("")) {
					sql += "CANCEL_DATE <= '" + eDate + "'";
				} else {
					sql += "CANCEL_DATE >= '" + sDate + "'";
				}
			}
		}
		sql = sql + " ORDER BY CANCEL_DATE DESC, MEM_ID DESC";

		System.out.println(sql);

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				cml.add(new CancelMember(rset.getString("MEM_ID"), rset.getString("ADMIN_NO"),
						rset.getString("CANCEL_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return cml;
	}

	public int insertReportedMem(Connection conn, ReportedMember rp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql1 = prop.getProperty("insertReportedMem");
		//String sql2 = prop.getProperty("updateReportMem");

		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, rp.getMemNo());
			pstmt.setInt(2, rp.getadminNo());
			pstmt.setString(3, rp.getLimitReason());
			pstmt.setInt(4, rp.getEndDateNum());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * 신고내역 확인 모달
	 * 
	 * @author 김지우
	 * @param conn
	 * @return list
	 */
	public List<Member> selectReportListModal(Connection conn, String userId) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectReportListModal");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				Member m = new Member();
				m.setMemId(rset.getString("NICKNAME"));
				m.setReportContent(rset.getString("REPORT_CONTENT"));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	/** 강제탈퇴 
	 * 
	 * @author 김지우
	 * @param conn
	 * @param userId
	 * @return result
	 */
	public int updateKickMember(Connection conn, ReportedMember rp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateKickMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rp.getMemNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int insertKickMem(Connection conn, ReportedMember rp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql1 = prop.getProperty("insertKickMem");
		//String sql2 = prop.getProperty("updateReportMem");

		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, rp.getMemNo());
			pstmt.setInt(2, rp.getadminNo());
			pstmt.setString(3, rp.getLimitReason());
			System.out.println(rp.getLimitReason());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int updateReportMem(Connection conn, ReportedMember rp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReportMem");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rp.getMemNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertCanceledMem(Connection conn, ReportedMember rp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCanceledMem");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rp.getMemNo());
			pstmt.setInt(2, rp.getadminNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	public int changeDate(Connection conn, int memNo, String changeDate) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changeDate");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, changeDate);
			pstmt.setInt(2, memNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("Dao단에서의 memNo : " + memNo);
		System.out.println("Dao단에서의 changeDate : " + changeDate);
		return result;
	}
	
	/**
	 * @author 호용
	 * 이용제한회원 이용제한 풀어주는 메소드
	 */
	public int changeMemStatus(Connection conn, int memNo) {
		int result = 0;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		String sql1 = prop.getProperty("changeMemStatus1");
		try {
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, memNo);
			pstmt1.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt1);
		}
		String sql2 = prop.getProperty("changeMemStatus2");
		try {
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, memNo);
			result = pstmt2.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt2);
		}
		return result;
	}
}
