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

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/mappers/member-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 
	 * '회원조회' 페이지에서 회원의 등급을 수정 (Update)
	 *
	 * @author 김지우
	 * @param m : 회원등급을 수정할 회원의 정보가 담겨있는 객체
	 * @return result : 쿼리가 실행됐을 경우 1 반환, 아닐 경우 0 반환
	 */
	public int updateUserLevel(Connection conn, Member m) {  
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUserLevel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getMemLevel());
			pstmt.setString(2, m.getMemId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/** 
	 * '회원조회' 페이지에서 전체회원을 조회 (Select)
	 *
	 * @author 김지우
	 * @return list 
	 */
	public List<Member> selectNoticeList(Connection conn) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");
		
		try {
			pstmt = conn.prepareStatement(sql); // 애초에 완성된 형태
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO")
								    , rset.getString("MEM_ID")
								    , rset.getInt("MEM_LEVEL")
								    , rset.getInt("REVIEW_CONTENT_COUNT")
								    , rset.getDouble("AVG_LIKE_POINT")
								    , rset.getString("PREF_GENRE")
								    , rset.getString("DORMANT_STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int selectListCount(Connection conn) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");

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

	public List<Member> selectListCount(Connection conn, PageInfo pi) {
		// select => 여러행 => List
				List<Member> list = new ArrayList<>();

				PreparedStatement pstmt = null;
				ResultSet rset = null;
				String sql = prop.getProperty("selectList");

				try {
					pstmt = conn.prepareStatement(sql);

					/*
					 * boardLimit : 10일 경우 currentPage : 1 => 시작값 : 1 / 끝값 : 10 currentPage : 2 =>
					 * 시작값 : 11 / 끝값 : 20
					 * 
					 * 시작값 : (currentPage - 1) * boardLimit + 1 끝값 : 시작값 + boardLimit - 1
					 */

					int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
					int endRow = startRow + pi.getBoardLimit() - 1;
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
					rset = pstmt.executeQuery();

					while (rset.next()) {
						list.add(new Member(rset.getInt("MEM_NO")
							    , rset.getString("MEM_ID")
							    , rset.getInt("MEM_LEVEL")
							    , rset.getInt("REVIEW_CONTENT_COUNT")
							    , rset.getDouble("AVG_LIKE_POINT")
							    , rset.getString("PREF_GENRE")
							    , rset.getString("DORMANT_STATUS")));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				return list;
	}

	public List<Member> selectHumanFilterUser(Connection conn) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHumanFilterUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO")
					    , rset.getString("MEM_ID")
					    , rset.getInt("MEM_LEVEL")
					    , rset.getInt("REVIEW_CONTENT_COUNT")
					    , rset.getDouble("AVG_LIKE_POINT")
					    , rset.getString("PREF_GENRE")
					    , rset.getString("DORMANT_STATUS")));
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
