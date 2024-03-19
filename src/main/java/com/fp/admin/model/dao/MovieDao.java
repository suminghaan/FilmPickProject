package com.fp.admin.model.dao;

import static com.fp.common.template.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fp.movie.model.vo.Movie;

public class MovieDao {
	
	private Properties prop = new Properties();

	// 메인페이지 영화 조회 구문 [용훈]
	
	public List<Movie> selectMainList(Connection conn) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMainList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("MV_NO")
									, rset.getString("MV_NAME")
									, rset.getString("MV_OPENDATE")
									, rset.getString("MV_STORY")
									, rset.getString("FPAGE_EXPOSED")
									, rset.getString("MPAGE_EXPOSED")
									, rset.getString("MV_POSTER")
									, rset.getString("MV_PREVIEW")
									, rset.getString("MV_STATUS")));			
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
