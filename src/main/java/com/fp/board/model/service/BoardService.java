package com.fp.board.model.service;
import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.fp.board.model.dao.BoardDao;
import com.fp.board.model.vo.Board;
import com.fp.movie.model.vo.Movie;

public class BoardService {
	
	private BoardDao bDao = new BoardDao();
	
	/**
	 * 커뮤니티 메인페이지 영화카테고리의 인기글들에 띄울 값들을 담기 위한 메소드
	 * @호용
	 */
	public List<Board> selectMainPublicList(){
		Connection conn = getConnection();
		List<Board> publicList = bDao.selectMainPublicList(conn);
		close(conn);
		return publicList;
	}
	
	/**
	 * 커뮤니티 메인페이지 영화카테고리의 일반글에 띄울 값들을 담기 위한 메소드
	 * @호용
	 */
	public List<Board> selectMainList(){
		Connection conn = getConnection();
		List<Board> list = bDao.selectMainList(conn);
		close(conn);
		return list;
	}
	
	/**
	 * 커뮤니티 메인페이지 잡담카테고리의 일반글에 띄울 값들을 담기 위한 메소드
	 * @호용
	 */
	public List<Board> selectMainChatList(){
		Connection conn = getConnection();
		List<Board> chatList = bDao.selectMainChatList(conn);
		close(conn);
		return chatList;
	}
	
	/**
	 * 커뮤니티 메인페이지의 우측에 인기영화란의 영화제목을 담기위한 메소드 호출구문
	 * @호용
	 */
	public List<Movie> selectPublicMovieName(){
		Connection conn = getConnection();
		List<Movie> mList = bDao.selectPublicMovieName(conn);
		close(conn);
		return mList;
	}

}
