package com.fp.movie.model.dao;

import static com.fp.common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.vo.Movie;

public class MovieDao {
	
	private Properties prop = new Properties();
	
	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
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
	
	public List<Movie> selectList(Connection conn, PageInfo pi) {
		
		return null;
	}
	
	public List<Movie> selectExploList(Connection conn) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectExploList");
		
		
		
		
		return list;
	}


}
