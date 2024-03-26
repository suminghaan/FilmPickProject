package com.fp.admin.model.service;

import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.commit;
import static com.fp.common.template.JDBCTemplate.getConnection;
import static com.fp.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.fp.admin.model.dao.CancelMemberDao;
import com.fp.admin.model.dao.MemberDao;
import com.fp.admin.model.dao.ReportMemberDao;
import com.fp.admin.model.vo.CancelMember;
import com.fp.admin.model.vo.ReportedMember;
import com.fp.board.model.vo.Board;
import com.fp.board.model.vo.Report;
import com.fp.common.model.vo.PageInfo;
import com.fp.member.model.vo.Member;
import com.fp.movie.model.vo.Review;

public class MemberService {

	private MemberDao mDao = new MemberDao();
	private CancelMemberDao cDao = new CancelMemberDao();
	private ReportMemberDao rDao = new ReportMemberDao();

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

		if (result > 0) {
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
	 * @return listCount
	 */
	public List<Member> selectMemberList() {
		Connection conn = getConnection();
		List<Member> list = mDao.selectMemberList(conn);
		close(conn);
		return list;
	}

	/**
	 * 페이징 용도
	 *
	 * @author 김지우
	 * @return list
	 */
	public int selectListCount() {
		Connection conn = getConnection();

		int listCount = mDao.selectListCount(conn);
		close(conn);

		return listCount;
	}

	/**
	 * 페이징 용도
	 *
	 * @author 김지우
	 * @return list
	 */
	public List<Member> selectList(PageInfo pi) {
		Connection conn = getConnection();

		List<Member> list = mDao.selectListCount(conn, pi);
		close(conn);
		return list;
	}

	/**
	 * 휴면회원 필터
	 *
	 * @author 김지우
	 * @return list
	 */
	public List<Member> selectHumanFilterUser() {
		Connection conn = getConnection();
		List<Member> list = mDao.selectHumanFilterUser(conn);
		close(conn);
		return list;
	}

	/**
	 * 회원등급 필터
	 *
	 * @author 김지우
	 * @return list
	 */
	public List<Member> selectLevelFilter(int level) {
		Connection conn = getConnection();
		List<Member> list = mDao.selectLevelFilter(conn, level);
		close(conn);
		return list;
	}

	/**
	 * 게시글 페이징용
	 *
	 * @author 김지우
	 * @param memId 
	 * @return list
	 */
	public int selectBoardListCount(String memId) {
		Connection conn = getConnection();

		int listCount = mDao.selectBoardListCount(conn, memId);
		close(conn);

		return listCount;
	}

	/**
	 * 페이징 용도
	 *
	 * @author 김지우
	 * @param memId 
	 * @return list
	 */
	public List<Board> selectBoardList(String memId, PageInfo pi) {
		Connection conn = getConnection();

		List<Board> list = mDao.selectBoardListCount(conn, memId, pi);
		close(conn);
		return list;
	}

	/**
	 * 페이징, 게시글 조회 용도
	 *
	 * @author 김지우
	 * @param memId 
	 * @return list
	 */
	public List<Board> selectUserBoardList(String memNo) {
		Connection conn = getConnection();

		List<Board> list = mDao.selectUserBoardList(conn, memNo);
		close(conn);
		return list;
	}

	/**
	 * 회원등급 수정 용도
	 *
	 * @author 김지우
	 * @param userId 회원아이디
	 * @param userLevel 수정할 회원등급
	 * @return result
	 */
	public int updateUserLevel(String userId, int userLevel) {
		Connection conn = getConnection();
		
		int result = mDao.updateUserLevel(conn, userId, userLevel);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	/** 회원이 작성한 댓글의 페이징, 조회 용도
	 * 
	 * @author 김지우
	 * @param memNo 회원번호
	 * @return listCount 회원이 작성한 댓글의 게시글 수 count
	 */
	public int selectReplyListCount(String memNo) {
		Connection conn = getConnection();
		
		int listCount = mDao.selectReplyListCount(conn, memNo);
		close(conn);

		return listCount;
	}

	/** 회원이 작성한 댓글의 페이징, 조회 용도
	 * 
	 * @author 김지우
	 * @param memNo 회원번호
	 * @param pi 페이징 객체
	 * @return list
	 */
	public List<Board> selectReplyList(String memNo, PageInfo pi) {
		Connection conn = getConnection();

		List<Board> list = mDao.selectReplyList(conn, memNo, pi);
		close(conn);
		return list;
	}

	/** 회원이 작성한 리뷰의 페이징, 조회 용도
	 * 
	 * @author 김지우
	 * @param memNo
	 * @return listCount
	 */
	public int selectReviewListCount(String memNo) {
		Connection conn = getConnection();
		
		int listCount = mDao.selectReviewListCount(conn, memNo);
		close(conn);

		return listCount;
	}

	/** 회원이 작성한 리뷰의 페이징, 조회 용도
	 * 
	 * @author 김지우
	 * @param memNo
	 * @return listCount
	 */
	public List<Review> selectReviewList(String memNo, PageInfo pi) {
		Connection conn = getConnection();

		List<Review> list = mDao.selectReviewList(conn, memNo, pi);
		close(conn);
		return list;
	}

	/** 회원 아이디 검색 용도
	 * 
	 * @author 김지우
	 * @param memId 회원 아이디
	 * @param pi 
	 * @return 
	 */
	public List<Member> searchUserList(String memId, PageInfo pi) {
		Connection conn = getConnection();
		List<Member> list = mDao.searchUserList(conn, memId, pi);
		close(conn);
		return list;
	}

	/** 회원 아이디 페이징 용도
	 * 
	 * @author 김지우
	 * @param memId 회원 아이디
	 * @return 
	 */
	public int searchUserListCount(String memId) {
		Connection conn = getConnection();
		
		int listCount = mDao.searchUserListCount(conn, memId);
		close(conn);

		return listCount;
	}
	
	/** 탈퇴회원 조회, 페이징 용도
	 * 
	 * @author 김지우
	 * @return listCount
	 */
	public int selectCancelMemberListCount() {
		Connection conn = getConnection();

		int listCount = cDao.selectCancelMemberListCount(conn);
		close(conn);

		return listCount;
	}

	/** 탈퇴회원 조회, 페이징 용도
	 * 
	 * @author 김지우
	 * @param pi
	 * @return list
	 */
	public List<CancelMember> selectCancelMemberList(PageInfo pi) {
		Connection conn = getConnection();

		List<CancelMember> list = cDao.selectCancelMemberList(conn, pi);
		close(conn);
		return list;
	}

	/** 신고회원 조회, 페이징 용도
	 * 
	 * @author 김지우
	 * @return listCount
	 */
	public int selectReportMemberListCount() {
		Connection conn = getConnection();

		int listCount = rDao.selectReportMemberListCount(conn);
		close(conn);

		return listCount;
	}

	/** 신고회원 조회, 페이징 용도
	 * 
	 * @author 김지우
	 * @param pi
	 * @return list
	 */
	public List<Member> selectReportMemberList(PageInfo pi) {
		Connection conn = getConnection();

		List<Member> list = rDao.selectReportMemberList(conn, pi);
		close(conn);
		return list;
	}

	public int selectRestrictedMemberListCount() {
		Connection conn = getConnection();

		int listCount = rDao.selectRestrictedMemberListCount(conn);
		close(conn);

		return listCount;
	}

	public List<ReportedMember> selectRestrictedMemberList(PageInfo pi) {
		Connection conn = getConnection();

		List<ReportedMember> list = rDao.selectRestrictedMemberList(conn, pi);
		close(conn);
		return list;
	}

	// 탈퇴회원 필터 조회 구문 [용훈]
	public List<CancelMember> cancelMemList(String userId, String sDate, String eDate) {
		Connection conn = getConnection();
		
		List<CancelMember> cml = rDao.cancelMemberList(conn, userId, sDate, eDate);
		close(conn);
		return cml;
	}

	/** 활동중지
	 * 
	 * @author 김지우
	 * @param rp
	 * @return
	 */
	public int insertReportedMem(ReportedMember rp) {
		Connection conn = getConnection();

		int result = rDao.insertReportedMem(conn, rp);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	/** 신고내역 모달 조회
	 * @return
	 */
	public List<Member> selectReportListModal(String userId) {
		Connection conn = getConnection();
		List<Member> list = rDao.selectReportListModal(conn, userId);
		close(conn);
		return list;
	}



}
