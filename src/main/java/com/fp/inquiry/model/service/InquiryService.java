package com.fp.inquiry.model.service;

import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.commit;
import static com.fp.common.template.JDBCTemplate.getConnection;
import static com.fp.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
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
	
	/**
	 * @param 호용
	 * @return 총 문의사항 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int selectListCount(int memNo) {
		Connection conn = getConnection();
		int listCount = iDao.selectListCount(conn, memNo);
		close(conn);
		return listCount;
	}
	
	/**
	 * @param 호용
	 * @return 문의사항 메인페이지에 보여질 값을 담고, 페이징바 구현을 위한 메소드
	 */
	public List<Inquiry> selectList(PageInfo pi, int memNo){
		Connection conn = getConnection();
		List<Inquiry> list = iDao.selectList(conn, pi, memNo);
		close(conn);
		return list;
	}
	
	/**
	 * 클릭시 문의사항 상세페이지에 띄울 값들을 담기위한 메소드 [호용]
	 * @param inqryNo 문의사항번호
	 */
	public Inquiry selectInquiry(int inqryNo) {
		Connection conn = getConnection();
		Inquiry inqu = iDao.selectInquiry(conn, inqryNo);
		close(conn);
		return inqu;
	}
	
	/**
	 * 클릭시 문의사항 상세페이지에 띄울 값들을 담기위한 메소드(첨부파일)
	 * @author 호용
	 */
	public Attachment selectAttachment(int inqryNo) {
		Connection conn = getConnection();
		Attachment at = iDao.selectAttachment(conn, inqryNo);
		close(conn);
		return at;
	}
	
}
