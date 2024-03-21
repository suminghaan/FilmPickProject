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
import com.fp.common.model.vo.PageInfo;
import com.fp.member.model.vo.Member;
import com.fp.movie.model.vo.Review;

public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		try {
			prop.loadFromXML(
					new FileInputStream(MemberDao.class.getResource("/db/mappers/member-mapper.xml").getPath()));
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
	public List<Member> selectMemberList(Connection conn) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMemberList");

		try {
			pstmt = conn.prepareStatement(sql); // 애초에 완성된 형태
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO"), rset.getString("MEM_ID"), rset.getInt("MEM_LEVEL"),
						rset.getInt("REVIEW_CONTENT_COUNT"), rset.getDouble("AVG_LIKE_POINT"),
						rset.getString("PREF_GENRE"), rset.getString("DORMANT_STATUS")));
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
	 * 페이징 용도
	 *
	 * @author 김지우
	 * @return listCount
	 */
	public int selectListCount(Connection conn) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserListCount");

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

	/**
	 * 페이징 용도
	 *
	 * @author 김지우
	 * @return list
	 */
	public List<Member> selectListCount(Connection conn, PageInfo pi) {
		List<Member> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO"), rset.getString("MEM_ID"), rset.getInt("MEM_LEVEL"),
						rset.getInt("REVIEW_CONTENT_COUNT"), rset.getDouble("AVG_LIKE_POINT"),
						rset.getString("PREF_GENRE"), rset.getString("DORMANT_STATUS")));
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
	 * 휴면회원 필터
	 *
	 * @author 김지우
	 * @return list
	 */
	public List<Member> selectHumanFilterUser(Connection conn) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectHumanFilterUser");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO"), rset.getString("MEM_ID"), rset.getInt("MEM_LEVEL"),
						rset.getInt("REVIEW_CONTENT_COUNT"), rset.getDouble("AVG_LIKE_POINT"),
						rset.getString("PREF_GENRE"), rset.getString("DORMANT_STATUS")));
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
	 * 회원등급 필터
	 *
	 * @author 김지우
	 * @return list
	 */
	public List<Member> selectLevelFilter(Connection conn, int level) {
		List<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectLevelFilterUser");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getInt("MEM_NO"), rset.getString("MEM_ID"), rset.getInt("MEM_LEVEL"),
						rset.getInt("REVIEW_CONTENT_COUNT"), rset.getDouble("AVG_LIKE_POINT"),
						rset.getString("PREF_GENRE"), rset.getString("DORMANT_STATUS")));
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
	 * 회원 작성 게시글 페이징 용도
	 *
	 * @author 김지우
	 * @return listCount 
	 */
	public int selectBoardListCount(Connection conn, String memId) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
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

	/**
	 * 회원 작성 게시글 페이징, 조회 용도
	 *
	 * @author 김지우
	 * @return list 
	 */
	public List<Board> selectBoardListCount(Connection conn, String memId, PageInfo pi) {
		List<Board> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectBoardList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setString(1, memId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Board(rset.getInt("B_NO")
						, rset.getString("B_TITLE")
						, rset.getString("B_CONTENT")
						, rset.getString("NICKNAME")
						, rset.getString("SIGNIN_DATE")
						, rset.getInt("B_READ_COUNT")
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

	/**
	 * 회원 작성 게시글 개수 세고 닉네임, 레벨 조회하는 용도
	 *
	 * @author 김지우
	 * @return list 
	 */
	public List<Board> selectUserBoardList(Connection conn, String memId) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserBoardCount");

		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, memId);
			pstmt.setString(2, memId);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Board(rset.getString("MEM_NO")
								    , rset.getString("MEM_ID")
									, rset.getString("MEM_IMGPATH")
									, rset.getString("MEM_COLOR")
									, rset.getString("NICKNAME")
									, rset.getInt("MEM_LEVEL")
									, rset.getInt("BOARDCOUNT")));
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
	 * 회원등급 수정 용도
	 *
	 * @author 김지우
	 * @return list 
	 */
	public int updateUserLevel(Connection conn, String userId, int userLevel) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateUserLevel");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userLevel);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 회원이 작성한 댓글의 글 개수를 세는 용도
	 *
	 * @author 김지우
	 * @return listCount 
	 */
	public int selectReplyListCount(Connection conn, String memNo) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
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

	/**
	 * 회원이 작성한 댓글의 글 조회, 페이징에 쓸 용도
	 *
	 * @author 김지우
	 * @return list 
	 */
	public List<Board> selectReplyList(Connection conn, String memNo, PageInfo pi) {
		List<Board> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setString(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Board(rset.getInt("REPLY_NO")
						, rset.getString("B_NO")
						, rset.getString("B_TITLE")
						, rset.getString("NICKNAME")
						, rset.getString("SIGNIN_DATE")
						, rset.getInt("B_READ_COUNT")
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

	/**
	 * 회원이 작성한 리뷰 조회, 페이징에 쓸 용도
	 *
	 * @author 김지우
	 * @return listCount 
	 */
	public int selectReviewListCount(Connection conn, String memNo) {
		int listCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewListCount");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memNo);
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

	/**
	 * 회원이 작성한 리뷰 조회, 페이징에 쓸 용도
	 *
	 * @author 김지우
	 * @return list 
	 */
	public List<Review> selectReviewList(Connection conn, String memNo, PageInfo pi) {
		List<Review> list = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReviewList");

		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			pstmt.setString(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Review(rset.getInt("MV_REVIEW_NO")
						, rset.getString("MV_NAME")
						, rset.getString("REVIEW_CONTENT")
						, rset.getString("LIKE_POINT")
						, rset.getString("NICKNAME")
						, rset.getString("REVIEW_DATE")));
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
