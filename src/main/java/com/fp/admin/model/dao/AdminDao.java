package com.fp.admin.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.fp.admin.model.vo.Admin;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		try {
			prop.loadFromXML(new FileInputStream(AdminDao.class.getResource("db/mappers/admin-mapper.xml").getPath()));
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertAdmin(Connection conn, Admin a) {
		
		return 1;
		
	}

}
