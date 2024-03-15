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
	
}
