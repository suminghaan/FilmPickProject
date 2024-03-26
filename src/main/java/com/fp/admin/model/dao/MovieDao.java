package com.fp.admin.model.dao;

import static com.fp.common.template.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.fp.admin.model.vo.Notice;
import com.fp.common.model.vo.Attachment;
import com.fp.common.model.vo.PageInfo;
import com.fp.movie.model.vo.Category;
import com.fp.movie.model.vo.Movie;
import com.fp.notice.model.dao.NoticeDao;
import com.fp.person.model.vo.Person;

public class MovieDao {
	
	private Properties prop = new Properties();
	
	public MovieDao() {
		try {
			prop.loadFromXML(new FileInputStream(MovieDao.class.getResource("/db/mappers/admin_movie-mapper.xml").getPath()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 관리자 영화 조회 페이징
	public int selectMovieListCount(Connection conn) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return listCount;
	}

	// 관리자 영화 조회 
	public List<Movie> selectMovieList(Connection conn, PageInfo pi) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectMovieList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("mv_no"),
									rset.getString("mv_name"),
									rset.getString("mv_date"),
									rset.getString("view_rating"),
									rset.getString("mv_opendate"),
									rset.getString("category_names")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	// 영화 조회 시 검색 
	public List<Movie> searchMovie(Connection conn, String keyword) {
		List<Movie> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, keyword);

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Movie(rset.getInt("mv_no"),
									rset.getString("mv_name"),
									rset.getString("mv_date"),
									rset.getString("view_rating"),
									rset.getString("mv_opendate"),
									rset.getString("CATEGORY_NAMES")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 영화 삭제
	public int deleteMovie(Connection conn, int mvNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 영화 삭제 시 파일 삭제
	public int deleteMovieAttachment(Connection conn, int mvNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteMovieAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 영화 관리버튼 
	// => 영화 정보 상세보기_영화관련 내용 
	public Movie MovieListDetail(Connection conn, int mvNo) {
		Movie m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("MovieListDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				m = new Movie(rset.getInt("mv_no"),
									rset.getString("mv_name"),
									rset.getString("mv_opendate"),
									rset.getString("mv_nation"),
									rset.getString("mv_rtime"),
									rset.getString("mv_story"),
									rset.getString("fpage_exposed"),
									rset.getString("view_rating"),
									rset.getString("current_screening"),
									rset.getString("mv_poster"),
									rset.getString("mv_preview"),
									rset.getString("category_names"),
									rset.getString("nm_user_request"),
									rset.getString("mem_no"),
									rset.getString("admin_no"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}
	// => 영화 상세보기에서 등장하는 인물의 정보와 배역을 불러오기
	public List<Person> moiveListDetailPerson(Connection conn, int mvNo){
		List<Person> pList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("moiveListDetailPerson");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mvNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				pList.add(new Person(
						rset.getInt("P_NO")
						, rset.getString("P_NAME")
						, rset.getString("P_JOB")
						, rset.getString("P_BD")
						, rset.getString("P_NATION")
						, rset.getString("P_FILE")
						, rset.getString("CASTING")
						, rset.getString("MOVIE_NO")
						));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return pList;
	}
	

	// 영화 카테고리 조회
	public List<Category> movieCategoryList(Connection conn) {
		List<Category> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("movieCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(rset.getInt("category_no"),
									rset.getString("category_name"),
									rset.getString("category_status")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	

	// 영화 카테고리 삭제
	public int deleteCategory(Connection conn, String[] cateList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCategory");
		
		if(cateList.length != 1) {
			for (int i = 1; i < cateList.length; i++) {
				sql += " OR CATEGORY_NAME = ?";
			}
		} 
				
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i = 1; i <= cateList.length; i++) {
				pstmt.setString(i, cateList[i - 1]);
			}
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 카테고리 추가 
		public int addCategory(Connection conn, String genreAdd) {
			int result = 0;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("addCategory");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, genreAdd);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}
			return result;
		}

		
	// 카테고리 수정
	public int updateCategory(Connection conn, String genreChange, String categoryNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("updateCategory");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, genreChange);
			pstmt.setInt(2, Integer.parseInt(categoryNo));
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}
	
	// 인물 조회 리스트 페이징
		public int selectCastingListCount(Connection conn) {
			int listCount = 0;
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectCastingListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					listCount = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return listCount;
		}

	// 인물관리_조회
	public List<Person> selectPersonList(Connection conn, PageInfo pi) {
		List<Person> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectPersonList");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() -1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Person(rset.getInt("p_no"),
									rset.getString("p_name"),
									rset.getString("p_job"),
									rset.getString("p_bd"),
									rset.getString("p_nation"),
									rset.getString("p_file")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 인물관리_검색
	public List<Person> searchCasting(Connection conn, String keyword) {
		List<Person> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchCasting");
		
		try {
			pstmt = conn.prepareStatement(sql);	
			pstmt.setString(1, keyword);

			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Person(rset.getInt("p_no"),
									rset.getString("p_name"),
									rset.getString("p_job"),
									rset.getString("p_bd"),
									rset.getString("p_nation"),
									rset.getString("p_file")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 인물관리_등록
	public int insertPerson(Connection conn, Person p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPerson");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getpName());
			pstmt.setString(2, p.getpJob());
			pstmt.setString(3, p.getpBD());
			pstmt.setString(4, p.getpNation());
			pstmt.setString(5, p.getpFile());

			result = pstmt.executeUpdate();
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 인물등록 시 파일 첨부
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertPersonAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}

	// 인물조회시_배우 필터
	public List<Person> selectActorFilter(Connection conn) {
		List<Person> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectActorFilter");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Person(rset.getInt("p_no"),
							rset.getString("p_name"),
							rset.getString("p_job"),
							rset.getString("p_bd"),
							rset.getString("p_nation"),
							rset.getString("p_file")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 인물조회시_감독 필터
	public List<Person> selectDirectorFilter(Connection conn) {
		List<Person> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDirectorFilter");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Person(rset.getInt("p_no"),
							rset.getString("p_name"),
							rset.getString("p_job"),
							rset.getString("p_bd"),
							rset.getString("p_nation"),
							rset.getString("p_file")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 인물 삭제
	public int deletePerson(Connection conn, int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deletePerson");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 인물 삭제 시 등록된 파일 삭제
	public int deletePersonAttachment(Connection conn, int pno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deletePersonAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 인물 수정모달에서 정보 보기
	public List<Person> updateCastingForm(Connection conn, String pno) {
		List<Person> uplist = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("updateCastingForm");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				uplist.add(new Person(rset.getInt("p_no"),
										rset.getString("p_name"),
										rset.getString("p_job"),
										rset.getString("p_bd"),
										rset.getString("p_nation"),
										rset.getString("p_file")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return uplist;
	}

	// 인물 수정 
	public int updatePerson(Connection conn, Person p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePerson");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p.getpName());
			pstmt.setString(2, p.getpJob());
			pstmt.setString(3, p.getpBD());
			pstmt.setString(4, p.getpNation());
			pstmt.setInt(5, p.getpNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 인물 수정시 기존 파일 있을경우
	public int updatepAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatepAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 인물 수정시 기존 파일 없을 경우 
	public int insertpNewAttachment(Connection conn, Attachment at) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertpNewAttachment");
		System.out.print(at);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefNo());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 영화 신청 관련 3개의 dao
	// 영화신청_영화
	public int insertMovie(Connection conn, Movie m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMvName());
			pstmt.setString(2, m.getMvOpenDate());
			pstmt.setString(3, m.getMvNation());
			pstmt.setString(4, m.getMvRTime());
			pstmt.setString(5, m.getMvStory());
			pstmt.setString(6, m.getViewRating());
			pstmt.setString(7, m.getCurrentScreening());
			pstmt.setString(8, m.getMvPoster());
			pstmt.setString(9, m.getMvPreview());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 영화신청_인물
	public int insertMoivePerson(Connection conn, List<Person> pList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMoviePerson");
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=0; i<pList.size(); i++) {
				pstmt.setString(1, pList.get(i).getpJob());
				pstmt.setInt(2, pList.get(i).getpNo());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}

	// 영화신청_카테고리
	public int insertMovieCategory(Connection conn, List<Category> cList) {
		int result = 0; 
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMovieCategory");
		try {
			pstmt = conn.prepareStatement(sql);

			for(int i =0; i<cList.size(); i++) {
				pstmt.setInt(1, cList.get(i).getCategoryNo());
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// TYPE 매개변수를 하나 받을 것
	public int insertMovieAttachment(Connection conn, Attachment attachment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMovieAttachment");
		
		
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, attachment.getRefType());
			pstmt.setInt(2, attachment.getFileType());
			pstmt.setInt(3, attachment.getFileLevel());
			pstmt.setString(4, attachment.getOriginName());
			pstmt.setString(5, attachment.getChangeName());
			pstmt.setString(6, attachment.getFilePath());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 영화수정_영화
	public int updateMovie(Connection conn, Movie m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMovie");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getMvName());
			pstmt.setString(2, m.getMvOpenDate());
			pstmt.setString(3, m.getMvNation());
			pstmt.setString(4, m.getMvRTime());
			pstmt.setString(5, m.getMvStory());
			pstmt.setString(6, m.getViewRating());
			pstmt.setString(7, m.getCurrentScreening());
			pstmt.setString(8, m.getMvPoster());
			pstmt.setString(9, m.getMvPreview());
			pstmt.setInt(10, m.getMvNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 영화수정_인물
	public int updateMoivePerson(Connection conn, List<Person> pList, Movie m) {
		int result = 0;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		String sql1 = prop.getProperty("updateMoivePersonDelete");
		// 과정1. delete문 실행
		try {
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, m.getMvNo());
			pstmt1.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt1);
		}
		// 과정2. insert문 실행
		String sql2 = prop.getProperty("updateMoivePersonInsert");
		try {
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(2, m.getMvNo());
			for(int i=0; i<pList.size(); i++) {
				pstmt2.setInt(1, pList.get(i).getpNo());
				pstmt2.setString(3, pList.get(i).getpJob());
				result += pstmt2.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt2);
		}
		return result;
	}

	// 영화수정_카테고리
	public int updateMovieCategory(Connection conn, List<Category> cList, Movie m) {
		int result = 0;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		String sql1 = prop.getProperty("updateMovieCategoryDelete");
		try {
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, m.getMvNo());
			pstmt1.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt1);
		}
		String sql2 = prop.getProperty("updateMovieCategoryInsert");
		try {
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(2, m.getMvNo());
			for(int i=0; i<cList.size(); i++) {
				pstmt2.setInt(1, cList.get(i).getCategoryNo());
				result += pstmt2.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt2);
		}
		return result;
	}

	public int updateMovieAttachment(Connection conn, Attachment attachment) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMovieAttachment");		
		
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(6, attachment.getRefType());
			pstmt.setInt(1, attachment.getFileType());
			pstmt.setInt(2, attachment.getFileLevel());
			pstmt.setString(3, attachment.getOriginName());
			pstmt.setString(4, attachment.getChangeName());
			pstmt.setString(5, attachment.getFilePath());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	

	

	
	
}
