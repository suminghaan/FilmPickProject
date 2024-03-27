package com.fp.admin.model.service;
import static com.fp.common.template.JDBCTemplate.commit;
import static com.fp.common.template.JDBCTemplate.rollback;
import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.fp.admin.model.dao.CustomerCenterDao;
import com.fp.board.model.vo.Board;
import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
import com.fp.inquiry.model.vo.Inquiry;
import com.fp.noMovie.model.vo.NoMovie;

public class CustomerCenterService {
	
	private CustomerCenterDao cDao = new CustomerCenterDao();

	/** 없는 영화 신청 목록 페이징, 조회 용도
	 * @author 김지우
	 * @return listCount
	 */
	public int selectnoMovieRequestListCount() {
		Connection conn = getConnection();
		
		int listCount = cDao.selectnoMovieRequestListCount(conn);
		close(conn);

		return listCount;
	}

	/** 없는 영화 신청 목록 페이징, 조회 용도
	 * 
	 * @author 김지우
	 * @param pi
	 * @return list
	 */
	public List<NoMovie> selectnoMovieRequestList(PageInfo pi) {
		Connection conn = getConnection();

		List<NoMovie> list = cDao.selectnoMovieRequestList(conn, pi);
		close(conn);
		return list;
	}

	/** 승인여부 필터 용도
	 * 
	 * @author 김지우
	 * @param approval 승인여부
	 * @return list 
	 */
	public List<NoMovie> selectApprovalFilter(String approval) {
		Connection conn = getConnection();
		List<NoMovie> list = cDao.selectApprovalFilter(conn, approval);
		close(conn);
		return list;
	}

	/** 1대1문의 조회, 페이징 용도
	 * 
	 * @author 김지우
	 * @return listCount
	 */
	public int selectInquiryListCount() {
		Connection conn = getConnection();
		
		int listCount = cDao.selectInquiryListCount(conn);
		close(conn);

		return listCount;
	}

	/** 1대1문의 조회, 페이징 용도
	 * 
	 * @author 김지우
	 * @param pi
	 * @return list
	 */
	public List<Inquiry> selectInquiryList(PageInfo pi) {
		Connection conn = getConnection();

		List<Inquiry> list = cDao.selectInquiryList(conn, pi);
		close(conn);
		return list;
	}

	public int updateInquiryAnswer(String inquiryAnswer, int adminNo, int inqryNo) {
		Connection conn = getConnection();
		
		int result = cDao.updateInquiryAnswer(conn, inquiryAnswer, adminNo, inqryNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteInquiryAnswer(int no) {
		Connection conn = getConnection();
		int result = cDao.deleteInquiryAnswer(conn, no);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	



}