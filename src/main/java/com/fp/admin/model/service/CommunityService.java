package com.fp.admin.model.service;
import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.fp.admin.model.dao.CommunityDao;
import com.fp.admin.model.vo.Notice;

public class CommunityService {
	
	private CommunityDao coDao = new CommunityDao();
	
	public List<Notice> selectComuNoticeList(){
		Connection conn = getConnection();
		List<Notice> list = coDao.selectComuNoticeList(conn);
		close(conn);
		return list;
	}

}
