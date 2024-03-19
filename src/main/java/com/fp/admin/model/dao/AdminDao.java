package com.fp.admin.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.fp.admin.model.vo.Admin;
import static com.fp.common.template.JDBCTemplate.close;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdminDao.class.getResource("/db/mappers/admin-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Admin loginAdmin(Connection conn, String adminId, String adminPwd) {
		Admin a = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, adminId);
			pstmt.setString(2, adminPwd);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				a = new Admin(rset.getInt("admin_no")
							, rset.getString("admin_id")
							, rset.getString("admin_pwd")
							, rset.getString("admin_name")
							, rset.getString("admin_phone")
							, rset.getString("admin_status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return a;
		
	}
	
	public int insertAdmin(Connection conn, Admin a) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAdmin");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a.getAdminId());
			pstmt.setString(2, a.getAdminPwd());
			pstmt.setString(3, a.getAdminName());
			pstmt.setString(4, a.getAdminPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	public int idCheck(Connection conn, String checkId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idCheck");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, checkId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}

}
