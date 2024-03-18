package com.fp.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
	
}