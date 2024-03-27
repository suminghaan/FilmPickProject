package com.fp.movie.model.dao;

import static com.fp.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import com.fp.common.model.vo.Approval;
import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
import com.fp.member.model.vo.Member;
import com.fp.movie.model.vo.Category;
import com.fp.movie.model.vo.Movie;
import com.fp.movie.model.vo.Review;
import com.fp.movie.model.vo.SearchFilter;

public class MovieDao {
	
	private Properties prop = new Properties();
	
	public MovieDao() { // xml문서 불러오는 구문 [용훈]
		try {
			prop.loadFromXML(new FileInputStream(MovieDao.class.getResource("/db/mappers/movie-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 페이징 하기위해 리스트 갯수 조회 구문 [용훈]
	public int selectListCount(Connection conn, SearchFilter f) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		if(!f.getCurrentScreening().equals("mvAll")) {
			sql += " AND CURRENT_SCREENING = '" + f.getCurrentScreening() + "'";
		}
		if(!f.getCategoryName().equals("categoryAll")) {
			sql += " AND CATEGORY_NO = '" + f.getCategoryName() + "'";
		}
		if(!f.getViewRatiog().equals("viewRatingAll")) {
			sql += " AND VIEW_RATING = '" + f.getViewRatiog() + "'";
		}
		if(!f.getMvNation().equals("nationAll")) {
			sql += " AND MV_NATION = '" + f.getMvNation() + "'";
		}
		if(!f.getMvOpenDate().equals("yearsAll")) {
			sql += " AND MV_OPENDATE LIKE '" + f.getMvOpenDate() + "%'";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}
	
	// 탐색페이지 탐색, 필터 활용 구문 [용훈]
	public List<Movie> selectExploList(Connection conn, SearchFilter f, PageInfo pi) {
		List<Movie> mlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectExploList"); // 전체조회
		
		// CATEGORY 관련 IF문 [용훈]
		if(!f.getCurrentScreening().equals("mvAll")) {
			sql += " AND CURRENT_SCREENING = '" + f.getCurrentScreening() + "'";
		}
		if(!f.getCategoryName().equals("categoryAll")) {
			sql += " AND CATEGORY_NO = '" + f.getCategoryName() + "'";
		}
		if(!f.getViewRatiog().equals("viewRatingAll")) {
			sql += " AND VIEW_RATING = '" + f.getViewRatiog() + "'";
		}
		if(!f.getMvNation().equals("nationAll")) {
			sql += " AND MV_NATION = '" + f.getMvNation() + "'";
		}
		if(!f.getMvOpenDate().equals("yearsAll")) {
			if(f.getMvOpenDate().equals("newyear")) {
				sql += " AND MV_OPENDATE LIKE '2024%'";
			}else {				
				sql += " AND MV_OPENDATE LIKE '" + f.getMvOpenDate() + "%'";
			}
		}
		
		// ORDERBY 관련 IF문 [용훈]
		if(f.getOrderBy().equals("likeMovie")) {
			sql += " ORDER BY LIKECOUNT DESC";
		}else if(f.getOrderBy().equals("lately")) {
			sql += " ORDER BY MV_OPENDATE DESC";
		}else if(f.getOrderBy().equals("korean")) {
			sql += " ORDER BY MV_NAME";
		}else if(f.getOrderBy().equals("reviews")) {
			sql += " ORDER BY REVIEWS DESC";
		}
		
		sql = "SELECT * FROM(SELECT ROWNUM RNUM, A.* FROM (" + sql + ") A ) WHERE RNUM BETWEEN ? AND ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				mlist.add(new Movie(rset.getInt("mv_no"),
									rset.getString("mv_name"),
									rset.getString("mv_opendate"),
									rset.getString("mv_poster"),
									rset.getString("like_point")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return mlist;
	}

	// 영화 정보와 평균별점, 포스터 파일경로를 조회하는 메소드 [기웅]
	public ArrayList<Movie> selectMovieList(Connection conn, String searchKeyword) {
		String movieInfoStarRatingAvgQuery = prop.getProperty("selectMovieStarRatingAvg");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Movie> movieList = new ArrayList<>();
		
		searchKeyword = '%' + searchKeyword + '%';
		
		try {
			
			// 영화 정보와 평균 별점 조회
			pstmt = conn.prepareStatement(movieInfoStarRatingAvgQuery);
			pstmt.setString(1, searchKeyword);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Movie m = new Movie();
				m.setMvNo(rset.getInt("MV_NO"));
				m.setMvName(rset.getString("MV_NAME"));
				m.setMvOpenDate(rset.getString("MV_OPENDATE"));
				m.setStarRatingAvg(rset.getString("AVG_LIKE_POINT"));
				movieList.add(m);
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return movieList;
	}
	
	// 영화 포스터 경로 받아오는 메소드 [기웅]
	public ArrayList<Attachment> selectPosterList(Connection conn, String searchKeyword) {
		String query = prop.getProperty("selectMoviePosterPath");
		ArrayList<Attachment> posterList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		searchKeyword = "%" + searchKeyword + "%";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchKeyword);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Attachment a = new Attachment();
				a.setFilePath(rset.getString("MV_POSTER"));
				
				posterList.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return posterList;
	}

	// 영화 상세보기에서 영화 정보 받아오는 메소드 [기웅]
	public Movie selectMovieInfo(Connection conn, int movieNo) {
		String query = prop.getProperty("selectMovieInfo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Movie m = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				m = new Movie();
				m.setMvNo(rset.getInt("MV_NO"));
				m.setMvName(rset.getString("MV_NAME"));
				m.setMvOpenDate(rset.getString("MV_OPENDATE"));
				m.setMvRTime(rset.getString("MV_RTIME"));
				m.setMvStory(rset.getString("MV_STORY"));
				m.setMvPoster(rset.getString("MV_POSTER"));
				m.setMvPreview(rset.getString("MV_PREVIEW"));
				m.setStarRatingAvg(rset.getString("AVG_STAR_RATING"));
				m.setNumberOfStarRating(rset.getInt("NUMBER_OF_STAR_RATING"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	// 영화 상세보기 페이지에서 영화 추가사진 불러오는 메소드
	public ArrayList<Attachment> selectAddiMovie(Connection conn, int movieNo) {
		String query = prop.getProperty("selectAddiMovie");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> attList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Attachment a = new Attachment();
				a.setFileNo(rset.getInt("FILE_NO"));
				a.setFilePath(rset.getString("FILEPATH"));
				a.setRefType(rset.getString("REF_TYPE"));
				
				attList.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return attList;
	}
//	영화 상세보기에서 리뷰 정보를 불러오는 메소드 [기웅]
	public ArrayList<Review> selectReviewInfo(Connection conn, int movieNo) {
		String query = prop.getProperty("selectReviewInfo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> reviewList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				reviewList.add(new Review(
							rset.getInt("MV_REVIEW_NO")
							, rset.getString("REVIEW_CONTENT")
							, rset.getString("REVIEW_DATE")
							, rset.getString("LIKE_POINT")
							, rset.getString("NICKNAME")
							, rset.getInt("MEM_LEVEL")
							, rset.getInt("COUNT_AGREE")
							, rset.getInt("COUNT_DISAGREE")
							, rset.getString("MEM_IMGPATH")
							, rset.getString("MEM_COLOR")
							, rset.getInt("MEM_NO")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return reviewList;
	}
//	영화 상세보기에서 관련 영화 정보를 가져오는 메소드 [기웅]
	public ArrayList<Movie> selectRelMovieList(Connection conn, int movieNo) {
		String query = prop.getProperty("selectRelMovieList");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Movie> movieList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			pstmt.setInt(2, movieNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Movie m = new Movie();
				m.setMvNo(rset.getInt("MV_NO"));
				m.setMvName(rset.getString("MV_NAME"));
				m.setMvOpenDate(rset.getString("MV_OPENDATE"));
				m.setMvPoster(rset.getString("MV_POSTER"));
				m.setStarRatingAvg(rset.getString("AVG_STAR_RATING"));
				
				movieList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return movieList;
	}

//	좋아요 표시 메소드 [기웅]
	public int insertMovieLike(Connection conn, int mvNo, int userNo) {
		String query = prop.getProperty("insertMovieLike");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mvNo);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
//	좋아요 표시 제거 메소드 [기웅]
	public int deleteMovieLike(Connection conn, int mvNo, int userNo) {
		String query = prop.getProperty("deleteMovieLike");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, mvNo);
			pstmt.setInt(2, userNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 메인페이지 영화예고편 조회 [용훈]
	public List<Movie> selectMainListv(Connection conn) {
		List<Movie> vlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainListv");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Movie m = new Movie();
				m.setMvNo(rset.getInt("MV_NO"));
				m.setMvName(rset.getString("MV_NAME"));
				m.setMvOpenDate(rset.getString("MV_OPENDATE"));
				m.setMvStory(rset.getString("MV_STORY"));
				m.setMvPreview(rset.getString("MV_PREVIEW"));
				
				vlist.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return vlist;
	}
	// 메인페이지 영화포스터 조회 [용훈]
	public List<Movie> selectMainListp(Connection conn, String no) {
		List<Movie> plist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainListp");
		
		// ORDERBY 관련 IF문 [용훈]
				if(no.equals("1")) {
					sql += " ORDER BY MV_OPENDATE DESC";
				}else if(no.equals("2")) {
					sql += " ORDER BY LIKECOUNT DESC";
				}else if(no.equals("3")) {
					sql += " ORDER BY LIKE_POINT";
				}
				sql = "SELECT P.* FROM (" + sql + ") P WHERE ROWNUM <= 10";
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				plist.add(new Movie(rset.getInt("mv_no"),
									rset.getString("mv_name"),
									rset.getString("mv_opendate"),
									rset.getString("mv_poster"),
									rset.getString("like_point")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return plist;
	}

	// 첫페이지 영화 포스터 조회 메소드 [용훈]
	public List<Movie> firstselect(Connection conn) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("firstselect");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Movie m = new Movie();
				m.setMvNo(rset.getInt("MV_NO"));
				m.setMvPoster(rset.getString("MV_POSTER"));
				
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
//	리뷰 남기기를 위한 메소드 [기웅]
	public int insertReview(Connection conn, int movieNo, int userNo, String likePoint, String reviewContent) {
		String query = prop.getProperty("insertReview");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, reviewContent);
			pstmt.setString(2, likePoint);
			pstmt.setInt(3, userNo);
			pstmt.setInt(4, movieNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}

//	다른 사용자의 정보를 불러오는 메소드[기웅]
	public Member selectOtherUser(Connection conn, int otherUserNo) {
		String query = prop.getProperty("selectOtherUserInfo");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, otherUserNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				m.setMemLevel(rset.getInt("MEM_LEVEL"));
				m.setNickname(rset.getString("NICKNAME"));
				m.setMemImgPath(rset.getString("MEM_IMGPATH"));
				m.setMemColor(rset.getString("MEM_COLOR"));
				m.setReviewContentCnt(rset.getInt("COUNT_STAR_RATING"));
				m.setAvgLikePoint(rset.getDouble("AVG_STAR_RATING"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

//	다른 유저의 리뷰 정보를 불러오는 메소드 [기웅]
	public ArrayList<Review> selectOtherUserReview(Connection conn, int otherUserNo) {
		String query = prop.getProperty("selectReviewOtherUser");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> rList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, otherUserNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Review r = new Review();
				r.setMvReviewNo(rset.getInt("MV_REVIEW_NO"));
				r.setReviewContent(rset.getString("REVIEW_CONTENT"));
				r.setReviewDate(rset.getString("REVIEW_DATE"));
				r.setLikePoint(rset.getString("LIKE_POINT"));
				r.setAgreeCount(rset.getInt("AGREE_COUNT"));
				r.setDisagreeCount(rset.getInt("DISAGREE_COUNT"));
				r.setMvName(rset.getString("MV_NAME"));
				r.setMvPoster(rset.getString("MV_POSTER"));
				rList.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return rList;
	}

//	같이 재밌게 본 영화
	public ArrayList<Movie> bothInterestMovie(Connection conn, int userNo, int otherUserNo) {
		String query = prop.getProperty("bothInterestMovieList");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Movie> movieList = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, otherUserNo);
			pstmt.setInt(2, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				movieList.add(new Movie(
							rset.getInt("MV_NO")
							, rset.getString("MV_NAME")
							, rset.getString("MV_OPENDATE")
							, rset.getString("MV_POSTER")
							, rset.getString("AVG_STAR_RATING")
						));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return movieList;
	}
	public ArrayList<Review> selectMainReviewList(Connection conn) {
		ArrayList<Review> reviewList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMainReviewList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				reviewList.add(new Review(
						rset.getInt("MV_REVIEW_NO")
						, rset.getString("REVIEW_CONTENT")
						, rset.getString("REVIEW_DATE")
						, rset.getString("LIKE_POINT")
						, rset.getString("NICKNAME")
						, rset.getInt("MEM_LEVEL")
						, rset.getInt("COUNT_AGREE")
						, rset.getInt("COUNT_DISAGREE")
						, rset.getString("MEM_IMGPATH")
						, rset.getString("MEM_COLOR")
						, rset.getInt("MEM_NO")
					));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return reviewList;
	}

	// 사용자의 리뷰 정보를 가져오는 메소드[기웅]
	public ArrayList<Movie> conflictingMovie(Connection conn, int userNo) {
		ArrayList<Movie> movieList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("myStarRating");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Movie m = new Movie();
				m.setMvNo(rset.getInt("MV_NO"));
				m.setMvName(rset.getString("MV_NAME"));
				m.setMvPoster(rset.getString("MV_POSTER"));
				m.setMvOpenDate(rset.getString("MV_OPENDATE"));
				m.setStarRatingAvg(rset.getString("AVG_STAR_RATING"));
				m.setStarRating(rset.getString("LIKE_POINT"));
				
				movieList.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return movieList;
	}

	// 다른 사용자의 별점 분석 정보 가져오는 메소드 [기웅]
	public HashMap<String, String> starRatingAnalysis(Connection conn, int otherUserNo) {
		HashMap<String, String> starRatingAnaly = new HashMap<>();
		String query = prop.getProperty("starRatingAnalysis");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, otherUserNo);
			pstmt.setInt(2, otherUserNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				starRatingAnaly.put(rset.getString("LIKE_POINT"), rset.getString("COUNT_LIKE_POINT"));
				starRatingAnaly.put("TA_CONTENT", rset.getString("TA_CONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return starRatingAnaly;
	}

	// 리뷰 작성 시에 사용자의 리뷰 정보를 조회하는 메소드
	public Review selectUserReview(Connection conn, int movieNo, int userNo) {
		String query = prop.getProperty("selectUserReview");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Review review = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			pstmt.setInt(2, userNo);;
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				review = new Review(
							rset.getInt("MV_REVIEW_NO")
							, rset.getString("REVIEW_CONTENT")
							, rset.getString("REVIEW_DATE")
							, rset.getString("LIKE_POINT")
							, rset.getInt("COUNT_AGREE")
							, rset.getInt("COUNT_DISAGREE")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return review;
	}

	public int updateReview(Connection conn, int movieNo, int userNo, String likePoint, String reviewContent) {
		String query = prop.getProperty("updateReview");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, likePoint);
			pstmt.setString(2, reviewContent);
			pstmt.setInt(3, userNo);
			pstmt.setInt(4, movieNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 사용자가 해당 영화에 대해 좋아요 표시를 한지 확인하는 메소드
	public int selectMovieLike(Connection conn, int movieNo, int userNo) {
		String query = prop.getProperty("selectMovieLike");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			pstmt.setInt(2, userNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	// 리뷰에 대해 공감|비공감 표시 / 제거 메소드
	// 0일 경우 리뷰에 대해 공감 표시, 1일 경우 리뷰에 대해 공감 제거, 2일 경우 리뷰에 대해 비공감 표시, 3일 경우 리뷰에 대해 비공감 제거
	public int insertApproval(Connection conn, int reviewNo, int userNo, int type) {
		String query = prop.getProperty("insertApproval");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, (type == 0 ? 1 : 2));
			pstmt.setInt(2, userNo);
			pstmt.setInt(3, reviewNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteApproval(Connection conn, int reviewNo, int userNo, int type) {
		String query = prop.getProperty("deleteApproval");
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, reviewNo);
			pstmt.setInt(3, (type == 1 ? 1 : 2));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

//	사용자의 리뷰 공감|비공감 정보를 불러오는 메소드
	public ArrayList<Approval> selectApproval(Connection conn, int memNo) {
		String query = prop.getProperty("selectApproval");
		ArrayList<Approval> apprList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Approval a = new Approval();
				a.setApprovalType(rset.getInt("APPROVAL_TYPE"));
				a.setMvReviewNo(rset.getInt("MV_REVIEW_NO"));
				
				apprList.add(a);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return apprList;
	}

	public int selectReviewCount(Connection conn, int movieNo) {
		String query = prop.getProperty("selectReviewCount");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, movieNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public List<Category> mainCategoryList(Connection conn) {
		List<Category> ca = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("mainCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				ca.add(new Category(rset.getInt("CATEGORY_NO"),
									rset.getString("CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return ca;
	}
	

}
