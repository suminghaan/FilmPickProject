package com.fp.member.model.dao;

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
import com.fp.board.model.vo.Reply;
import com.fp.common.model.vo.PageInfo;
import com.fp.member.model.vo.Member;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.MovieLike;

import static com.fp.common.template.JDBCTemplate.*;

public class MemberDao {

	private Properties prop = new Properties();
	
	public MemberDao() {
		try {
			prop.loadFromXML(new FileInputStream(MemberDao.class.getResource("/db/mappers/member-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 로그인
	public Member loginMember(Connection conn, String memId, String memPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			rset = pstmt.executeQuery();
		
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no")
						     , rset.getString("mem_id")
						     , rset.getString("mem_pwd")
						     , rset.getString("mem_name")
						     , rset.getString("mem_bd")
						     , rset.getString("mem_gender")
						     , rset.getString("mem_email")
						     , rset.getString("mem_phone")
						     , rset.getString("pref_genre")
						     , rset.getString("nickname")
						     , rset.getString("mem_status")
						     , rset.getString("signin_date")
						     , rset.getInt("mem_level")
						     , rset.getString("mem_color")
						     , rset.getString("mem_imgpath")
						     , rset.getInt("mem_file")
						     , rset.getString("dormant_status")
						     );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
		
	}
	
	// 회원가입
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemId());
			pstmt.setString(2, m.getMemPwd());
			pstmt.setString(3, m.getMemEmail());
			pstmt.setString(4, m.getNickname());
			pstmt.setString(5, m.getMemName());
			pstmt.setString(6, m.getMemBirth());
			pstmt.setString(7, m.getMemGender());
			pstmt.setString(8, m.getMemPhone());
			pstmt.setString(9, m.getPrefGenre());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 회원정보
	public Member selectMember(Connection conn, String memId) {
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("mem_no")
							 , rset.getString("mem_id")
							 , rset.getString("mem_name")
							 , rset.getString("nickname")
							 , rset.getString("mem_pwd")
							 , rset.getString("mem_phone")
							 , rset.getString("mem_email")
							 , rset.getString("pref_genre")
							 , rset.getString("signin_date")
							 , rset.getString("mem_status")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return m;	
	}
	
	// 아이디 중복확인
	public int idCheck(Connection conn, String idCheck) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,idCheck);
			rset=pstmt.executeQuery();
			
				if(rset.next()) {
					count =rset.getInt("count");
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return count;	
	}
	
	// 닉네임 중복확인
	public int nicknameCheck(Connection conn, String nicknameCheck) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("nicknameCheck");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,nicknameCheck);
			rset=pstmt.executeQuery();
			
				if(rset.next()) {
					count =rset.getInt("count");
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return count;	
	}
	
	// 회원탈퇴
	public int deleteMember(Connection conn, String memId, String memPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMember");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, memPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteMemberInsert(Connection conn, int memNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMemberInsert");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	// 회원정보 변경
	public int updateMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,m.getMemName());
			pstmt.setString(2,m.getNickname());
			pstmt.setString(3,m.getMemPwd());
			pstmt.setString(4,m.getMemPhone());
			pstmt.setString(5,m.getMemEmail());
			pstmt.setString(6,m.getPrefGenre());
			pstmt.setString(7,m.getMemId());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 비밀번호 변경
	public int updatePwdMember(Connection conn, String memId, String memPwd, String newPwd) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwdMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, memId);
			pstmt.setString(3, memPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	
	// 작성글조회
	public int selectMyPostListCount(Connection conn, int memNo) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyPostListCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	

	public List<Board> selectMyPostList(Connection conn,int memNo, PageInfo pi){
		
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyPostList");
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+ 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("b_no")
								 , rset.getString("b_category")
								 , rset.getString("b_title")
								 , rset.getString("regist_date")
								 , rset.getInt("b_read_count")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	
	
	// 작성댓글조회
	
	public int selectMyCommentListCount(Connection conn, int memNo) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyCommentListCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public List<Reply> selectMyCommentList(Connection conn, int memNo, PageInfo pi){
		
		List<Reply> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMyCommentList");
		try {
			pstmt=conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+ 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, memNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(rset.getInt("reply_no")
								 , rset.getString("reply_content")
								 , rset.getString("enroll_date")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 좋아요 누른 영화 목록
	public int selectMovieLikeListCount(Connection conn, int memNo) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieLikeListCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public List<Movie> selectMovieList(Connection conn, int memNo, PageInfo pi){
		
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieList");
		try {
			pstmt=conn.prepareStatement(sql);
			
			/*
			 * int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+ 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			 * */
			
			pstmt.setInt(1, memNo);
			/*
			 * pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			 */
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(
								 rset.getInt("mv_no")
								 , rset.getString("mv_name")
								 , rset.getString("mv_opendate")
								 , rset.getString("mv_poster")
								 , rset.getString("star_rating_avg")
								 )); 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 별점 남긴 영화 목록
	public int selectMovieStarRatingListCount(Connection conn, int memNo) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieStarRatingListCount");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, memNo);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}
	
	public List<Movie> selectMovieStarRatingList(Connection conn, int memNo, PageInfo pi){
		
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieStarRatingList");
		try {
			pstmt=conn.prepareStatement(sql);
			
			/*
			* int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+ 1;
			* int endRow = startRow + pi.getBoardLimit() - 1;
			*/
			
			pstmt.setInt(1, memNo);
			/*
			* pstmt.setInt(2, startRow);
			* pstmt.setInt(3, endRow);
			 */
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Movie m = new Movie();
				m.setMvNo(rset.getInt("mv_no"));
				m.setMvName(rset.getString("mv_name"));
				m.setMvOpenDate(rset.getString("mv_opendate"));
				m.setMvPoster(rset.getString("mv_poster"));
				m.setStarRatingAvg(rset.getString("star_rating_avg"));
				m.setStarRating(rset.getString("star_rating"));
					
				list.add(m);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	// 선호장르
	public ArrayList<String> selectPrefGenre(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> prefGenre = new ArrayList<>();
		String sql = prop.getProperty("selectPrefGenre");
		try {
			pstmt=conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				prefGenre.add(rset.getString("category_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return prefGenre;
	}

}