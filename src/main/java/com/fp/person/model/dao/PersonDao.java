package com.fp.person.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.fp.person.model.vo.Person;
import static com.fp.common.template.JDBCTemplate.*;

public class PersonDao {
	private Properties prop = new Properties();
	
	public PersonDao() {
		try {
			prop.loadFromXML(new FileInputStream(PersonDao.class.getResource("/db/mappers/person-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Person> selectPersonInfo(Connection conn, int movieNo) {
		String query = prop.getProperty("selectPersonInfo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Person> personList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				personList.add(new Person(
						rset.getInt("P_NO")
						, rset.getString("P_NAME")
						, rset.getString("P_JOB")
						, rset.getString("P_BD")
						, rset.getString("P_NATION")
						, rset.getString("P_FILE")
						, rset.getString("CASTING")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return personList;
	}

	public ArrayList<Person> selectPersonByKeyword(Connection conn, String searchKeyword) {
		String query = prop.getProperty("selectPersonByKeyword");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Person> personList = new ArrayList<>();
		searchKeyword = '%' + searchKeyword + '%';
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchKeyword);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				personList.add(new Person(
							rset.getInt("P_NO")
							, rset.getString("P_NAME")
							, rset.getString("P_JOB")
							, rset.getString("P_BD")
							, rset.getString("P_NATION")
							, rset.getString("P_FILE")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return personList;
	}
}
