package com.fp.member.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.fp.board.model.vo.Board;
import com.fp.board.model.vo.Reply;
import com.fp.common.model.vo.PageInfo;
import com.fp.member.model.dao.MemberDao;
import com.fp.member.model.vo.Member;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.MovieLike;

public class MemberService {

	private MemberDao mDao = new MemberDao();
	
	// 로그인
	public Member loginMember(String memId, String memPwd) {
		
		Connection conn = getConnection();
		Member loginUser = mDao.loginMember(conn, memId, memPwd);
		close(conn);
		
		return loginUser;
	}
	
	// 회원가입
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
	
	// 아이디 중복확인
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		int count = mDao.idCheck(conn, checkId);
		
		close(conn);
		return count;
	}
	
	// 비밀번호 중복확인
	public int nicknameCheck(String checkNickname) {
		Connection conn = getConnection();
		int count = mDao.nicknameCheck(conn, checkNickname);
		
		close(conn);
		return count;
	}
	
	// 회원탈퇴
	public int deleteMember(String memId, String memPwd, int memNo) {
		Connection conn = getConnection();
		int result1 = mDao.deleteMember(conn, memId, memPwd);
		int result2 = mDao.deleteMemberInsert(conn, memNo);
		
		if(result1*result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1*result2;
	}

	// 회원정보 변경
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		int result = mDao.updateMember(conn, m);
		
		Member updateMem = null;
		if(result > 0) {
			commit(conn);
			// 최신 데이터를 다시 조회해서 session에 변경
			updateMem = mDao.selectMember(conn,m.getMemId());
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
	}
	
	// 비밀번호 수정
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
	
	// 작성글목록
	public int selectMyPostListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = mDao.selectMyPostListCount(conn, memNo);
		close(conn);
		return listCount;
	}
	
	public List<Board> selectMyPostList(int memNo, PageInfo pi){
		Connection conn =getConnection();
		List<Board> list = mDao.selectMyPostList(conn,memNo,pi);
		close(conn);
		return list;
	}
	
	// 작성댓글목록
	public int selectMyCommentListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = mDao.selectMyCommentListCount(conn, memNo);
		close(conn);
		return listCount;
	}
	
	public List<Reply> selectMyCommentList(int memNo, PageInfo pi){
		Connection conn =getConnection();
		List<Reply> list = mDao.selectMyCommentList(conn, memNo,pi);
		close(conn);
		return list;
	}
	
	// 좋아요 누른 영화 목록
	public int MovieLikeListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = mDao.selectMovieLikeListCount(conn, memNo);
		close(conn);
		return listCount;
	}
	
	public List<Movie> selectMovieList(int memNo, PageInfo pi){
		Connection conn =getConnection();
		List<Movie> list = mDao.selectMovieList(conn, memNo,pi);
		close(conn);
		return list;
	}
	
	// 별점 남긴 영화 목록
	public int MovieStarRatingListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = mDao.selectMovieLikeListCount(conn, memNo);
		close(conn);
		return listCount;
	}
		
	public List<Movie> selectMovieStarRatingList(int memNo, PageInfo pi){
		Connection conn = getConnection();
		List<Movie> list = mDao.selectMovieStarRatingList(conn, memNo,pi);
		close(conn);
		return list;
	}
	
	// 선호장르
	public ArrayList<String> selectPrefGenre(){
		Connection conn = getConnection();
		ArrayList<String> prefGenre = mDao.selectPrefGenre(conn);
		close(conn);
		return prefGenre;
	}
	
	// 아이디찾기
	public Member selectFindId(String memName, String memPhone) {
		Connection conn = getConnection();
		Member m = mDao.selectFindId(conn, memName, memPhone);
		close(conn);
		return m;
	}
	
	// 비밀번호찾기
	public Member selectFindPwd(String memId,String memName, String memPhone) {
		Connection conn = getConnection();
		Member m = mDao.selectFindPwd(conn, memId, memName, memPhone);
		close(conn);
		return m;
	}	

}