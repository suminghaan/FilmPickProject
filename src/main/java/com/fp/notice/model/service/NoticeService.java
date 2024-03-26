package com.fp.notice.model.service;

import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.commit;
import static com.fp.common.template.JDBCTemplate.getConnection;
import static com.fp.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;


import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
import com.fp.notice.model.dao.NoticeDao;
import com.fp.notice.model.vo.Notice;

public class NoticeService {

	private NoticeDao nDao = new NoticeDao();


	/**
	 * @param 호용
	 * @return 총 공지사항 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = nDao.selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * @param 호용
	 * @return 공지사항 메인페이지에 보여질 값을 담고, 페이징바 구현을 위한 메소드
	 */
	public List<Notice> selectList(PageInfo pi){
		Connection conn = getConnection();
		List<Notice> list = nDao.selectList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * 클릭시 조회수 증가를 위한 메소드
	 * @호용
	 */
	public int increaseCount(int noticeNo) {
		Connection conn = getConnection();
		int result = nDao.increaseCount(conn, noticeNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 클릭시 공지사항 상세페이지에 띄울 값들을 담기위한 메소드
	 * @author 호용
	 */
	public Notice selectNotice(int noticeNo) {
		Connection conn = getConnection();
		Notice n = nDao.selectNotice(conn, noticeNo);
		close(conn);
		return n;
	}
	
	/**
	 * 클릭시 공지사항 상세페이지에 띄울 값들을 담기위한 메소드(첨부파일)
	 * @author 호용
	 */
	public Attachment selectAttachment(int noticeNo) {
		Connection conn = getConnection();
		Attachment at = nDao.selectAttachment(conn, noticeNo);
		close(conn);
		return at;
	}
	
	/**
	 * @param 호용
	 * @return 총 키워드에 맞는 공지사항 게시글 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int keywordSelectListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = nDao.keywordSelectListCount(conn, keyword);
		close(conn);
		return listCount;
	}
	
	/**
	 * @author 호용
	 * 키워드에 맞는 공지사항 페이지에 담을 값을 구하기위한 메소드
	 */
	public List<Notice> selectKeywordList(PageInfo pi, String keyword){
		Connection conn = getConnection();
		List<Notice> list = nDao.selectKeywordList(conn, pi, keyword);
		close(conn);
		return list;
	}
	
}
