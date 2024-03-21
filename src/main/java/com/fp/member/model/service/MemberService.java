package com.fp.member.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.PageInfo;
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
	
	public int deleteMember(String memId, String memPwd) {
		Connection conn = getConnection();
		int result = mDao.deleteMember(conn, memId, memPwd);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	public Member updatePwdMember(String memId, String memPwd, String newPwd) {
		Connection conn = getConnection();
		int result = mDao.updatePwdMember(conn, memId, memPwd, newPwd);
		
		Member updateMem= null;
		if(result > 0) {
			commit(conn);
			updateMem = mDao.selectMember(conn, memId);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}
	
	public int selectListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = mDao.selectListCount(conn, memNo);
		close(conn);
		return listCount;
	}
	
	public List<Board> selectList(int memNo, PageInfo pi){
		Connection conn =getConnection();
		List<Board> list = mDao.selectList(conn,memNo,pi);
		close(conn);
		return list;
	}
}