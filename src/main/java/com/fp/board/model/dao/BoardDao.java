package com.fp.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.fp.board.model.dao.BoardDao;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		try {
			prop.loadFromXML(new FileInputStream(BoardDao.class.getResource("/db/mappers/board-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
