package com.fp.admin.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fp.admin.model.vo.Notice;
import static com.fp.common.template.JDBCTemplate.close;

public class CommunityDao {
	
	private Properties prop = new Properties();
	
	public List<Notice> selectComuNoticeList(Connection conn){
		List<Notice> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectComuNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Notice(rset.getInt("notice_no"),
									rset.getString("notice_date"),
									rset.getString("admin_id"),
									rset.getString("notice_title"),
									rset.getString("notice_fix")));
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
