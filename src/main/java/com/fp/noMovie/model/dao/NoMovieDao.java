package com.fp.noMovie.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import static com.fp.common.template.JDBCTemplate.close;
import com.fp.noMovie.model.vo.NoMovie;
import com.fp.person.model.vo.Person;

public class NoMovieDao {
	
	private Properties prop = new Properties();
	
	public NoMovieDao() {
		try {
			prop.loadFromXML(new FileInputStream(NoMovieDao.class.getResource("/db/mappers/noMovie-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertNoMovie(Connection conn, NoMovie nm) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNoMovie");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nm.getNmTitle());
			pstmt.setString(2, nm.getNmStory());
			pstmt.setString(3, nm.getNmReleaseDate());
			pstmt.setString(4, nm.getNmRunTime());
			pstmt.setString(5, nm.getNmUserRequest());
			pstmt.setString(6, nm.getNmNicknameStatus());
			pstmt.setString(7, nm.getNmNation());
			pstmt.setString(8, nm.getNmViewGrade());
			pstmt.setInt(9, nm.getMemNo());
			pstmt.setString(10, nm.getNmPoster());
			pstmt.setString(11, nm.getNmPreview());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertNoMoviePerson(Connection conn, List<Person> pList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNoMoviePerson");
		try {
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, for(int i=0; i<pList.size(); i++) {
//				pList.get(i).getpNo();
//				}
//			);
			for(int i=0; i<pList.size(); i++) {
				pstmt.setInt(1, pList.get(i).getpNo());
				pstmt.setString(2, pList.get(i).getpJob());
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}
