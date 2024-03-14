package com.fp.noMovie.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class NoMovieDao {
	
	private Properties prop = new Properties();
	
	public NoMovieDao() {
		try {
			prop.loadFromXML(new FileInputStream(NoMovieDao.class.getResource("/db/mappers/noMovie-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
