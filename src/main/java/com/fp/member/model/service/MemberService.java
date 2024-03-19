package com.fp.member.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;

import com.fp.member.model.dao.MemberDao;
import com.fp.member.model.vo.Member;

public class MemberService {

	private MemberDao mDao = new MemberDao();
	
	public Member loginMember(String memId, String memPwd) {
		
		Connection conn = getConnection();
		Member loginUser = mDao.loginMember(conn, memId, memPwd);
		close(conn);
		
		return loginUser;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = mDao.insertMember(conn,m);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = mDao.idCheck(conn, checkId);
		
		close(conn);
		return count;
	}
}