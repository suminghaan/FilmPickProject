package com.fp.admin.model.service;
import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.fp.admin.model.dao.MemberDao;
import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.PageInfo;
import com.fp.member.model.vo.Member;

public class MemberService {
	
	private MemberDao mDao = new MemberDao();

	/** 
	 * '회원조회' 페이지에서 회원의 등급을 수정 (Update)
	 *
	 * @author 김지우
	 * @param m : 회원등급을 수정할 회원의 정보가 담겨있는 객체
	 * @return result : 쿼리가 실행됐을 경우 1 반환, 아닐 경우 0 반환
	 */
	public int updateUserLevel(Member m) { 
		Connection conn = getConnection();
		
		int result = mDao.updateUserLevel(conn, m);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	/** 
	 * '회원조회' 페이지에서 전체회원을 조회 (Select)
	 *
	 * @author 김지우
	 * @return list 
	 */
	public List<Member> selectMemberList() {
		Connection conn = getConnection();
		List<Member> list = mDao.selectNoticeList(conn);
		close(conn);
		return list;
	}

	public int selectListCount() {
		Connection conn = getConnection();

		int listCount = mDao.selectListCount(conn);
		close(conn);

		return listCount;
	}

	public List<Member> selectList(PageInfo pi) {
		Connection conn = getConnection();

		List<Member> list = mDao.selectListCount(conn, pi);
		close(conn);
		return list;
	}
	
}
