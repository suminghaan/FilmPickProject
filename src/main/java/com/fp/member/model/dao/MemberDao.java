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
import com.fp.common.model.vo.PageInfo;
import com.fp.member.model.vo.Member;
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
	
	public int selectListCount(Connection conn, int memNo) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
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
	
	public List<Board> selectList(Connection conn,int memNo, PageInfo pi){
		
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
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
}