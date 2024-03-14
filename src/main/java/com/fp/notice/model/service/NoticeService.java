package com.fp.notice.model.service;

import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.fp.common.model.vo.PageInfo;
import com.fp.notice.model.dao.NoticeDao;
import com.fp.notice.model.vo.Notice;

public class NoticeService {

	private NoticeDao nDao = new NoticeDao();

	// 공지사항 및 게시글 페이지의 게시글들을 보여주며, 페이징바에 필요한 메소드
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = nDao.selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	// 페이징바 구현을 위한 메소드
	public List<Notice> selectList(PageInfo pi){
		Connection conn = getConnection();
		List<Notice> list = nDao.selectList(conn, pi);
		close(conn);
		return list;
	}
	
}
