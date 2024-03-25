package com.fp.noMovie.model.dao;

import static com.fp.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

import com.fp.common.model.vo.Attachment;
import com.fp.movie.model.vo.Category;
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
	
	/**
	 * @author 호용
	 * 없는영화 신청을 위한 메소드 NO_MOVIE_ENROLL 인설트
	 */
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
	
	/**
	 * @author 호용
	 * 없는영화 신청을 위한 메소드 NO_MOVIE_CAST 인설트
	 */
	public int insertNoMoviePerson(Connection conn, List<Person> pList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNoMoviePerson");
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<pList.size(); i++) {
				pstmt.setInt(1, pList.get(i).getpNo());
				pstmt.setString(2, pList.get(i).getpJob());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	/**
	 * @author 호용
	 * 없는영화 신청을 위한 메소드 NO_MOVIE_GENRE 인설트
	 */
	public int insertNoMovieCategory(Connection conn, List<Category> cList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNoMovieCategory");
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<cList.size(); i++) {
				pstmt.setInt(1, cList.get(i).getCategoryNo());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}
	
	/**
	 * @author 호용
	 * 없는영화 신청을 위한 메소드 ATTACHMENT 인설트(추가적인 파일이 있을 경우)
	 */
	public int insertNoMovieAttachment(Connection conn, Attachment at, int ext) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNoMovieAttachment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ext);
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
}
