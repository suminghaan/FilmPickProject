package com.fp.inquiry.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;

import com.fp.common.model.vo.Attachment;
import com.fp.inquiry.model.dao.InquiryDao;
import com.fp.inquiry.model.vo.Inquiry;

public class InquiryService {

	private InquiryDao iDao = new InquiryDao();
	
	/**
	 * @호용
	 * 1대1문의 신청을 위한 메소드
	 */
	public int insertInquiry(Inquiry in, Attachment at) {
		Connection conn = getConnection();
		int result1 = iDao.insertInquiry(conn, in);
		int result2 = 1;
		if(at != null) {
			result2 = iDao.insertAttachment(conn, at);
		}
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result1 * result2;
	}
	
}
