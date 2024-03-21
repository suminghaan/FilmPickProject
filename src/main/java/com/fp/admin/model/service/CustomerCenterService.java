package com.fp.admin.model.service;
import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.fp.admin.model.dao.CustomerCenterDao;
import com.fp.common.model.vo.PageInfo;
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

}
