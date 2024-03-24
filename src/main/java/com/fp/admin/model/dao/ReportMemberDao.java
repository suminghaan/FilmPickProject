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
				list.add(new Member(rset.getString("MEM_ID")
									, rset.getString("NICKNAME")
									, rset.getInt("REPORTCOUNT")
									, rset.getString("SIGNIN_DATE")
									, rset.getInt("BOARDCOUNT")
									, rset.getInt("REPLYCOUNT")));
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
