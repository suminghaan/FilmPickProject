package com.fp.person.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fp.person.model.dao.PersonDao;
import com.fp.person.model.vo.Person;

public class PersonService {

	private PersonDao pDao = new PersonDao();
	
	public ArrayList<Person> selectPersonInfo(int movieNo) {
		Connection conn = getConnection();
		ArrayList<Person> personList = pDao.selectPersonInfo(conn, movieNo);
		close(conn);
		return personList;
	}
	
}
