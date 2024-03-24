package com.fp.board.model.service;
import static com.fp.common.template.JDBCTemplate.close;
import static com.fp.common.template.JDBCTemplate.commit;
import static com.fp.common.template.JDBCTemplate.getConnection;
import static com.fp.common.template.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.fp.board.model.dao.BoardDao;
import com.fp.board.model.vo.Board;
import com.fp.board.model.vo.Reply;
import com.fp.board.model.vo.Report;
import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
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
	
	/**
	 * 커뮤니티 영화이름 클릭시 영화 상세페이지 이동을 위한 영화번호를 담기위한 메소드
	 * @author 호용
	 */
	public List<Movie> selectAllMovie(){
		Connection conn = getConnection();
		List<Movie> allMovie = bDao.selectAllMovie(conn);
		close(conn);
		return allMovie;
	}
	
	/**
	 * @param 호용
	 * @return 총 영화카테고리 게시글 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = bDao.selectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * @param 호용
	 * @return 총 잡담카테고리 게시글 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int chatSelectListCount() {
		Connection conn = getConnection();
		int listCount = bDao.chatSelectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * @param 호용
	 * @return 총 인기게시글 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int publicSelectListCount() {
		Connection conn = getConnection();
		int listCount = bDao.publicSelectListCount(conn);
		close(conn);
		return listCount;
	}
	
	/**
	 * @param 호용
	 * @return 총 키워드에 맞는 인기게시글 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int publicKeywordSelectListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = bDao.publicKeywordSelectListCount(conn, keyword);
		close(conn);
		return listCount;
	}
	
	/**
	 * @param 호용
	 * @return 총 키워드에 맞는 영화카테고리 전체게시글 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int keywordSelectListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = bDao.keywordSelectListCount(conn, keyword);
		close(conn);
		return listCount;
	}
	
	/**
	 * @param 호용
	 * @return 총 키워드에 맞는 잡담카테고리 전체게시글 갯수를 구하기 위한 메소드, 페이징바에 활용됨
	 */
	public int keywordSelectChatListCount(String keyword) {
		Connection conn = getConnection();
		int listCount = bDao.keywordSelectChatListCount(conn, keyword);
		close(conn);
		return listCount;
	}
	
	/**
	 * @param 호용
	 * 커뮤니티 영화카테고리의 인기게시글페이지에 담을 값을 구하기위한 메소드
	 */
	public List<Board> selectPublicList(PageInfo pi){
		Connection conn = getConnection();
		List<Board> publicList = bDao.selectPublicList(conn, pi);
		close(conn);
		return publicList;
	}
	
	/**
	 * @param 호용
	 * 커뮤니티 영화카테고리의 키워드에 맞는 인기게시글페이지에 담을 값을 구하기위한 메소드
	 */
	public List<Board> selectKeywordPublicList(PageInfo pi, String keyword){
		Connection conn = getConnection();
		List<Board> publicList = bDao.selectKeywordPublicList(conn, pi, keyword);
		close(conn);
		return publicList;
	}
	
	/**
	 * @param 호용
	 * 커뮤니티 영화카테고리의 키워드에 맞는 전체게시글페이지에 담을 값을 구하기위한 메소드
	 */
	public List<Board> selectKeywordList(PageInfo pi, String keyword){
		Connection conn = getConnection();
		List<Board> publicList = bDao.selectKeywordList(conn, pi, keyword);
		close(conn);
		return publicList;
	}
	
	/**
	 * @param 호용
	 * 커뮤니티 잡담카테고리의 키워드에 맞는 전체게시글페이지에 담을 값을 구하기위한 메소드
	 */
	public List<Board> selectKeywordChatList(PageInfo pi, String keyword){
		Connection conn = getConnection();
		List<Board> publicList = bDao.selectKeywordChatList(conn, pi, keyword);
		close(conn);
		return publicList;
	}
	
	/**
	 * @param 호용
	 * 커뮤니티 영화카테고리의 전체게시글페이지에 담을 값을 구하기위한 메소드
	 */
	public List<Board> selectList(PageInfo pi){
		Connection conn = getConnection();
		List<Board> list = bDao.selectList(conn, pi);
		close(conn);
		return list;
	}
	
	/**
	 * @param 호용
	 * 커뮤니티 잡담카테고리의 전체게시글페이지에 담을 값을 구하기위한 메소드
	 */
	public List<Board> selectChatList(PageInfo pi){
		Connection conn = getConnection();
		List<Board> chatList = bDao.selectChatList(conn, pi);
		close(conn);
		return chatList;
	}
	
	/**
	 * @호용
	 * 게시글 등록을 위한 메소드
	 */
	public int insertBoard(Board b, Attachment at) {
		Connection conn = getConnection();
		int result1 = bDao.insertBoard(conn, b);
		int result2 = 1; // 첨부파일테이블은 1로 초기화해둬야 첨부파일없이 insert할 때도 제대로 commit됨
		
		if(at != null) {
			result2 = bDao.insertAttachment(conn, at);	
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
	 * 클릭시 조회수 증가를 위한 메소드
	 * @호용
	 */
	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		int result = bDao.increaseCount(conn, boardNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 클릭시 게시글 상세페이지에 띄울 값들을 담기위한 메소드
	 * @author 호용
	 */
	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		Board b = bDao.selectBoard(conn, boardNo);
		close(conn);
		return b;
	}
	
	/**
	 * 클릭시 게시글 상세페이지에 띄울 값들을 담기위한 메소드(첨부파일)
	 * @author 호용
	 */
	public Attachment selectAttachment(int boardNo) {
		Connection conn = getConnection();
		Attachment at = bDao.selectAttachment(conn, boardNo);
		close(conn);
		return at;
	}
	
	/**
	 * 게시글 수정을 위한 메소드
	 * @author 호용
	 */
	public int updateBoard(Board b, Attachment at) {
		
		Connection conn = getConnection();
		int result1 = bDao.updateBoard(conn, b);
		
		int result2 = 1;
		if(at != null) { // 새로 넘어온 첨부파일이 있었을 경우
			if(at.getFileNo() != 0) { // 기존의 첨부파일이 있었을 경우 update Attachment
				result2 = bDao.updateAttachment(conn, at);
			}else { // 기존의 첨부파일이 없었을 경우 insert Attachment
				result2 = bDao.insertNewAttachment(conn, at);
			}
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
	 * 게시글 삭제를 위한 메소드
	 * @author 호용
	 */
	public int deleteBoard(int boardNo) {
		Connection conn = getConnection();
		int result = bDao.deleteBoard(conn, boardNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 게시글에 댓글을 띄우기위한 메소드
	 * @author 호용
	 */
	public List<Reply> selectReplyList(int boardNo){
		Connection conn = getConnection();
		List<Reply> list = bDao.selectReplyList(conn, boardNo);
		close(conn);
		return list;
	}
	/**
	 * 댓글 등록을 위한 메소드
	 * @author 호용
	 */
	public int insertReply(Reply r) {
		Connection conn = getConnection();
		int result = bDao.insertReply(conn, r);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 게시글 추천버튼 클릭시 추천수가 1회 늘어나는 메소드
	 * @author 호용
	 */
	public int good(int boardNo) {
		Connection conn = getConnection();
		int result = bDao.good(conn, boardNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 게시글 신고를 위한 메소드
	 * @author 호용
	 */
	public int reportBoard(Report re) {
		Connection conn = getConnection();
		int result = bDao.reportBoard(conn, re);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	/**
	 * 댓글 신고를 위한 메소드
	 * @author 호용
	 */
	public int replyReportBoard(Report re) {
		Connection conn = getConnection();
		int result = bDao.replyReportBoard(conn, re);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	// 메인페이지에 호출할 게시물 조회 [용훈]
	public List<Board> selectMainPageList() {
		Connection conn = getConnection();
		List<Board> b = bDao.selectMainPageList(conn);
		close(conn);
		return b;
	}
	
	// 댓글삭제를 위한 메소드[호용]
	public int deleteReply(int replyNo) {
		Connection conn = getConnection();
		int result = bDao.deleteReply(conn, replyNo);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

}



