package com.fp.inquiry.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class InquiryDao {
	
	private Properties prop = new Properties();
	
	private InquiryDao() {
		try {
			prop.loadFromXML(new FileInputStream(InquiryDao.class.getResource("/db/mappers/inquiry-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
