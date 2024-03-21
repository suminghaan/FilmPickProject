package com.fp.person.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.fp.person.model.dao.PersonDao;
import com.fp.person.model.vo.Person;

public class PersonService {

	private PersonDao pDao = new PersonDao();
	
	// 영화 상세보기에서 영화에 등장하는 인물의 정보와 배역을 불러오는 쿼리 [기웅]
	public ArrayList<Person> selectPersonInfo(int movieNo) {
		Connection conn = getConnection();
		ArrayList<Person> personList = pDao.selectPersonInfo(conn, movieNo);
		close(conn);
		return personList;
	}
	// 영화&인물 검색에서 인물 키워드로 검색하는 쿼리 [기웅]
	public ArrayList<Person> selectPersonByKeyword(String searchKeyword) {
		Connection conn = getConnection();
		ArrayList<Person> personList = pDao.selectPersonByKeyword(conn, searchKeyword);
		close(conn);
		return personList;
	}
	
}
