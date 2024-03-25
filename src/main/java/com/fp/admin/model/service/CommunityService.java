package com.fp.admin.model.service;
import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;


import com.fp.admin.model.dao.CommunityDao;
import com.fp.admin.model.vo.Notice;
import com.fp.board.model.vo.Board;
import com.fp.board.model.vo.Reply;
import com.fp.board.model.vo.Report;
import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
import com.fp.common.template.JDBCTemplate;
import com.fp.person.model.vo.Person;

public class CommunityService {
	
	private CommunityDao coDao = new CommunityDao();
	
	// 공지사항 조회
	public List<Notice> selectComuNoticeList(PageInfo pi){
		Connection conn = getConnection();
		List<Notice> list = coDao.selectComuNoticeList(conn, pi);
		close(conn);
		return list;
	}
	
	// 공지사항 페이징
	public int selectNoticeListCount() {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = coDao.selectNoticeListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 공지사항 등록
	public int insertNotice(Notice n, Attachment at) {
		Connection conn = getConnection();
		
		int result1 = coDao.insertNotice(conn, n);
		
		int result2 = 1; // 첨부파일이 없을때를 고려해서 0이 아닌 1로 초기화
		if(at != null) {
			result2 = coDao.insertAttachment(conn, at);
		}
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
	// 공지사항 삭제
	public int deleteNotice(int noticeNo) {
		Connection conn = getConnection();
		int result1 = coDao.deleteNotice(conn, noticeNo);
		int result2 = coDao.deleteAttachment(conn, noticeNo);
		
		
		if(result1 > 0 && result2 >= 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		int result = result1 + result2;
		return result;
	}

	// 공지사항 검색
	public List<Notice> searchNotice(String keyword) {
		Connection conn = getConnection();
		List<Notice> list = coDao.searchNotice(conn, keyword);
		close(conn);
		return list;
		
	}

	// 공지사항 수정
	public List<Notice> updateNoticeForm(String noticeNo) {
		Connection conn = getConnection();
		List<Notice> uplist = coDao.updateNoticeForm(conn, noticeNo);
		close(conn);
		return uplist;
	}

	// 공지사항 수정 시 파일 
	public int updateNotice(Notice n, Attachment at) {
		Connection conn = getConnection();
		int result1 = coDao.updateNotice(conn, n);
		
		int result2 = 1;
		if(at != null) {
			if(at.getFileNo() != 0) {
				result2 = coDao.updateAttachment(conn,at);
			}else {
				result2 = coDao.insertNewAttachment(conn, at);
			}
		}
		
		if(result1 > 0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}

	// 블라인드처리 게시글 조회
	public List<Board> selectBlindBoardList(PageInfo pi) {
		Connection conn = getConnection();
		List<Board> list = coDao.selectBlindBoardList(conn, pi);
		close(conn);
		return list;
	}

	// 블라인드처리 게시글검색
	public List<Board> searchBlindBoard(String keyword) {
		Connection conn = getConnection();
		List<Board> list = coDao.searchBlindBoard(conn, keyword);
		close(conn);
		return list;
	}

	// 블라인드처리 페이징
	public int selectBlindBoardListCount() {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = coDao.selectBlindBoardListCount(conn);
		close(conn);
		return listCount;
	}

	// 블라인드 해제
	public int removeBlind(int boardNo) {
		Connection conn = getConnection();
		int result = coDao.removeBlind(conn, boardNo);

		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	//신고게시글 페이징
	public int reportBoardListCount() {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = coDao.reportBoardListCount(conn);
		close(conn);
		return listCount;
	}

	// 신고게시글 조회
	public List<Board> selectReportBoardList(PageInfo pi) {
		Connection conn = getConnection();
		List<Board> list = coDao.selectReportBoardList(conn, pi);
		close(conn);
		return list;
	}
	
	// 신고게시글 신고내용 상세 조회
		public List<Report> selectDetailReportBoardList(PageInfo pi) {
			Connection conn = getConnection();
			List<Report> rlist = coDao.selectDetailReportBoardList(conn, pi);
			close(conn);
			return rlist;
		}

	// 신고글 검색
	public List<Board> searchReportBoard(String keyword) {
		Connection conn = getConnection();
		List<Board> list = coDao.searchReportBoard(conn, keyword);
		close(conn);
		return list;
	}

	// 신고글 블라인드 처리
	public int reportBlind(int boardNo) {
		Connection conn = getConnection();
		int result1 = coDao.reportBlind(conn, boardNo);
		int result2 = coDao.reportBlindAttachment(conn, boardNo);
		
		
		if(result1 > 0 && result2 >= 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		int result = result1 + result2;
		return result;
	}

	// 신고된 댓글 페이징처리
	public int reportCommentListCount() {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = coDao.reportCommentListCount(conn);
		close(conn);
		return listCount;
	}

	// 신고된 댓글 조회
	public List<Reply> selectReportCommentList(PageInfo pi) {
		Connection conn = getConnection();
		List<Reply> list = coDao.selectReportCommentList(conn, pi);
		close(conn);
		return list;
	}

	// 신고된 댓글 신고내역 상세 조회
	public List<Report> selectDetailReportCommentList(PageInfo pi) {
		Connection conn = getConnection();
		List<Report> rlist = coDao.selectDetailReporCommentList(conn, pi);
		close(conn);
		return rlist;
	}

	// 신고된 댓글 블라인드 처리 
	public int reportCommentBlind(int replyNo) {
		Connection conn = getConnection();
		int result = coDao.reportCommentBlind(conn, replyNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	// 신고된 댓글 검색 기능 
	public List<Reply> searchReportComment(String keyword) {
		Connection conn = getConnection();
		List<Reply> list = coDao.searchReportComment(conn, keyword);
		close(conn);
		return list;
	}

	

}
