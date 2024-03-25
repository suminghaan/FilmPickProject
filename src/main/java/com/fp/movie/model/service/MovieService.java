package com.fp.movie.model.service;

import static com.fp.common.template.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
import com.fp.member.model.vo.Member;
import com.fp.movie.model.dao.MovieDao;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.Review;
import com.fp.movie.model.vo.SearchFilter;

public class MovieService {
	
	private MovieDao mDao = new MovieDao();
	
	// 페이징 하기위해 리스트 갯수 조회 구문 [용훈]
	public int selectListCount(SearchFilter f) {
		Connection conn = getConnection();
		int listCount = mDao.selectListCount(conn, f);
		
		close(conn);
		return listCount;
	}
	
	
	
	// 탐색페이지 탐색,필터 활용 구문 [용훈]
	public List<Movie> selectExploList(SearchFilter f, PageInfo pi){
		
		Connection conn = getConnection();
		List<Movie> mlist = mDao.selectExploList(conn, f, pi);
		
		close(conn);
		return mlist;
	}

	// 검색페이지에서 검색 키워드에 따라 영화 정보와 평균 별점을 조회하는 메소드[기웅]
	public ArrayList<Movie> selectMovieList(String searchKeyword) {
		Connection conn = getConnection();
		ArrayList<Movie> movieList = mDao.selectMovieList(conn, searchKeyword);
		close(conn);
		return movieList;
	}
	
	// 검색페이지에서 검색 키워드에 따라 영화의 메인 포스터 첨부파일의 경로를 조회하는 메소드[기웅]
	public ArrayList<Attachment> selectPosterList(String searchKeyword) {
		Connection conn = getConnection();
		ArrayList<Attachment> posterList = mDao.selectPosterList(conn, searchKeyword);
		close(conn);
		return posterList;
	}

//	영화 상세보기에서 영화 정보를 불러오는 메소드 [기웅]
	public Movie selectMovieInfo(int movieNo) {
		Connection conn = getConnection();
		Movie m = mDao.selectMovieInfo(conn, movieNo);
		close(conn);
		return m;
	}

//	영화 상세보기에서 추가 사진을 불러오는 메소드 [기웅]
	public ArrayList<Attachment> selectAddiMovie(int movieNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> attList = mDao.selectAddiMovie(conn, movieNo);
		close(conn);
		return attList;
	}


//	영화 상세보기에서 리뷰 정보를 불러오는 메소드 [기웅]
	public ArrayList<Review> selectReviewInfo(int movieNo) {
		Connection conn = getConnection();
		ArrayList<Review> reviewList = mDao.selectReviewInfo(conn, movieNo);
		close(conn);
		return reviewList;
	}


//	영화 상세보기에서 관련 영화 정보를 가져오는 메소드 [기웅]
	public ArrayList<Movie> selectRelMovieList(int movieNo) {
		Connection conn = getConnection();
		ArrayList<Movie> movieList = mDao.selectRelMovieList(conn, movieNo);
		close(conn);
		return movieList;
	}


//	영화에 좋아요 표시하는 메소드 [기웅]
	public int updateMovieLike(int mvNo, int userNo, String isChecked) {
		Connection conn = getConnection();
		
		int result = 0;
		// 좋아요 표시
		if(isChecked.equals("false")) {
			result = mDao.insertMovieLike(conn, mvNo, userNo);
		} else { // 좋아요 표시 제거
			result = mDao.deleteMovieLike(conn, mvNo, userNo);
		}
		
		// 0이면 실패
		if (result != 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
// 첫페이지 영화 포스터 조회 메소드 [용훈]
	public List<Movie> firstselect() {
		Connection conn = getConnection();
		List<Movie> list = mDao.firstselect(conn);
		close(conn);
		return list;
	}


// 메인페이지 영화예고편 조회 메소드
	public List<Movie> selectMainListv() {
		Connection conn = getConnection();
		List<Movie> vlist = mDao.selectMainListv(conn);
		close(conn);
		return vlist;
	}
	
// 메인페이지 영화예고편 조회 메소드
	public List<Movie> selectMainListp(String no) {
		Connection conn = getConnection();
		List<Movie> plist = mDao.selectMainListp(conn, no);
		close(conn);
		return plist;
	}


//	영화 리뷰 추가하는 메소드 [기웅]
	public int insertReview(int movieNo, int userNo, String likePoint, String reviewContent) {
		Connection conn = getConnection();
		
		int result = mDao.insertReview(conn, movieNo, userNo, likePoint, reviewContent);
		
		close(conn);
		return result;
	}


//	다른 사용자의 정보를 불러오는 메소드 [기웅]
	public Member selectOtherUser(int otherUserNo) {
		Connection conn = getConnection();
		
		Member m = mDao.selectOtherUser(conn, otherUserNo);
		
		close(conn);
		return m;
	}


//	다른 사용자의 리뷰 정보를 불러오는 메소드 [기웅]
	public ArrayList<Review> selectOtherUserReview(int otherUserNo) {
		Connection conn = getConnection();
		
		ArrayList<Review> reviewList = mDao.selectOtherUserReview(conn, otherUserNo);
		
		close(conn);
		return reviewList;
	}


//	다른 사용자와 같이 재밌게 본 영화 정보 불러오는 메소드 [기웅]
	public ArrayList<Movie> bothInterestMovie(int userNo, int otherUserNo) {
		Connection conn = getConnection();
		ArrayList<Movie> movieList = mDao.bothInterestMovie(conn, userNo, otherUserNo);
		
		close(conn);
		return movieList;
	}
	
	
	public ArrayList<Review> selectMainReviewList() {
		Connection conn = getConnection();
		ArrayList<Review> reviewList = mDao.selectMainReviewList(conn);
		close(conn);
		return reviewList;
	}


//	다른 사용자와 평가가 엇갈린 영화를 알아내는 메소드 [기웅]
	public Movie conflictingMovie(int userNo, int otherUserNo) {
		Connection conn = getConnection();
		
		ArrayList<Movie> userMovieList = mDao.conflictingMovie(conn, userNo);
		ArrayList<Movie> otherUserMovieList = mDao.conflictingMovie(conn, otherUserNo);
		
		// 평가가 엇갈려야하므로 두 별점 간의 차이는 최소 2.5는 되어야함
		double max = 2.5;
		
		Movie conflictingMovie = null;
		
		// 사용자와 다른 유저가 리뷰 남긴 영화 중 별점 차이가 가장 큰 영화를 선택
		// 사용자와 다른 유저 모두 리뷰 남긴 영화가 있을 경우에만 실행
		if(!userMovieList.isEmpty() && !otherUserMovieList.isEmpty()) {
			for(int i = 0; i < userMovieList.size(); i++) {
				// 영화와 해당 영화의 별점
				Double userLikePoint = Double.parseDouble(userMovieList.get(i).getStarRating());
				int userMovie = userMovieList.get(i).getMvNo();
				
				for (int j = 0; j < otherUserMovieList.size(); j++) {
					// 영화와 해당 영화의 별점
					Double otherUserLikePoint = Double.parseDouble(otherUserMovieList.get(j).getStarRating());
					int otherUserMovie = otherUserMovieList.get(j).getMvNo();
					
					// 영화가 동일할 경우
					if (userMovie == otherUserMovie)	{
						//별점 간의 차이
						Double gap = Math.abs(userLikePoint - otherUserLikePoint);
						
						// 별점 간의 차이가 최대일 경우
						if(gap > max) {
							conflictingMovie = userMovieList.get(i);
							conflictingMovie.setOtherUserStarRating(String.valueOf(otherUserLikePoint));
						}
					}
					
				}
			}
		}
		
		close(conn);
		// null일 경우 2가지. 엇갈린 영화가 없는 경우, 리뷰 남긴 영화가 없는 경우
		return conflictingMovie;
	}


//  다른 유저의 별점 분석 [기웅]
	public HashMap<String, String> starRatingAnalysis(int otherUserNo) {
		Connection conn = getConnection();
		
		HashMap<String, String> starRatingAnaly = mDao.starRatingAnalysis(conn, otherUserNo);
		
		close(conn);
		
		return starRatingAnaly;
	}


//	사용자가 리뷰 버튼을 누르기 전 해당 영화에 대해 리뷰를 남겼는지 확인하기 위한 메소드 [기웅]
	public Review selectUserReview(int movieNo, int userNo) {
		Connection conn = getConnection();
		
		Review review = mDao.selectUserReview(conn, movieNo, userNo);
		
		close(conn);
		return review;
	}


//	기존 리뷰를 업데이트하기 위한 메소드
	public int updateReview(int movieNo, int userNo, String likePoint, String reviewContent) {
		Connection conn = getConnection();
		
		int result = mDao.updateReview(conn, movieNo, userNo, likePoint, reviewContent);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}


//	사용자가 해당 영화에 좋아요 표시를 했는지 확인하기 위한 메소드
	public int selectMovieLike(int movieNo, int userNo) {
		Connection conn = getConnection();
		
		int countMovieLike = mDao.selectMovieLike(conn, movieNo, userNo);
		close(conn);
		return countMovieLike;
	}




}
