package com.fp.admin.model.service;
import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.fp.admin.model.dao.CommunityDao;
import com.fp.admin.model.vo.Notice;
import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
import com.fp.common.template.JDBCTemplate;

public class CommunityService {
	
	private CommunityDao coDao = new CommunityDao();
	
	public List<Notice> selectComuNoticeList(PageInfo pi){
		Connection conn = getConnection();
		List<Notice> list = coDao.selectComuNoticeList(conn, pi);
		close(conn);
		return list;
	}
	
	public int selectNoticeListCount() {
		Connection conn = JDBCTemplate.getConnection();
		int listCount = coDao.selectNoticeListCount(conn);
		close(conn);
		return listCount;
	}
	
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

	public List<Notice> searchNotice(String keyword) {
		Connection conn = getConnection();
		List<Notice> list = coDao.searchNotice(conn, keyword);
		close(conn);
		return list;
		
	}

	public List<Notice> updateNoticeForm(String noticeNo) {
		Connection conn = getConnection();
		List<Notice> uplist = coDao.updateNoticeForm(conn, noticeNo);
		close(conn);
		return uplist;
	}

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

}
