package com.fp.movie.model.vo;

public class Movie {
	private int mvNo;
	private String mvName;
	private String mvOpenDate;
	private String mvNation;
	private String mvRTime;
	private String mvStory;
	private String fPageExposed;
	private String viewRating;
	private String currentScreening;
	private String mPageExposed;
	private String mvPoster;
	private String mvPreview;
	private String mvStatus;
	
//	평균별점 추가
	private String starRatingAvg;
	
//	별점 매긴 사람 수 추가
	private int numberOfStarRating;
	
	// ** 2024.03.23 (관리자 : 한수민) 전체 영화조회시 필요한 필드(영화등록일, 영화에대한 카테고리) 추가
	private String mvRegistDate;
	private String categoryNames;	
	// ** 2024.03.23 (관리자 : 한수민) 영화상세조회시 필요한 필드(배역, 등록요청한사용자, 등록요청자요청사항, 관리자번호 카테고리) 추가
	private String casting;
	private String nmUserRequest;
	private String memNo;
	private String adminNo;
	
	
	
	
	public Movie() {
	}

	
	/**
	 * (관리자) 전체 영화 조회
	 * @param mvNo
	 * @param mvName
	 * @param mvOpenDate
	 * @param viewRating
	 * @param mvRegistDate
	 * @param categoryNames
	 * 
	 * @author 수밍
	 */
	public Movie(int mvNo, String mvName, String mvOpenDate, String viewRating, String mvRegistDate,
			String categoryNames) {
		super();
		this.mvNo = mvNo;
		this.mvName = mvName;
		this.mvOpenDate = mvOpenDate;
		this.viewRating = viewRating;
		this.mvRegistDate = mvRegistDate;
		this.categoryNames = categoryNames;
	}

	/**
	 * (관리자) 영화 상세 조회 
	 * @param mvNo
	 * @param mvName
	 * @param mvOpenDate
	 * @param mvNation
	 * @param mvRTime
	 * @param mvStory
	 * @param fPageExposed
	 * @param viewRating
	 * @param currentScreening
	 * @param mvPoster
	 * @param mvPreview
	 * @param starRatingAvg
	 * @param numberOfStarRating
	 * @param categoryNames
	 * @param casting
	 * @param nmUserRequest
	 * @param memNo
	 * @param adminNo
	 * 
	 * @author 수민
	 */
	public Movie(int mvNo, String mvName, String mvOpenDate, String mvNation, String mvRTime, String mvStory,
			String fPageExposed, String viewRating, String currentScreening, String mvPoster,
			String mvPreview, String categoryNames, String casting, String nmUserRequest, String memNo,
			String adminNo) {
		super();
		this.mvNo = mvNo;
		this.mvName = mvName;
		this.mvOpenDate = mvOpenDate;
		this.mvNation = mvNation;
		this.mvRTime = mvRTime;
		this.mvStory = mvStory;
		this.fPageExposed = fPageExposed;
		this.viewRating = viewRating;
		this.currentScreening = currentScreening;
		this.mvPoster = mvPoster;
		this.mvPreview = mvPreview;
		this.categoryNames = categoryNames;
		this.casting = casting;
		this.nmUserRequest = nmUserRequest;
		this.memNo = memNo;
		this.adminNo = adminNo;
	}


	public Movie(int mvNo, String mvName, String mvOpenDate, String mvNation, String mvRTime, String mvStory,
			String fPageExposed, String viewRating, String currentScreening, String mPageExposed, String mvPoster,
			String mvPreview, String mvStatus, String starRatingAvg, int numberOfStarRating) {
		super();
		this.mvNo = mvNo;
		this.mvName = mvName;
		this.mvOpenDate = mvOpenDate;
		this.mvNation = mvNation;
		this.mvRTime = mvRTime;
		this.mvStory = mvStory;
		this.fPageExposed = fPageExposed;
		this.viewRating = viewRating;
		this.currentScreening = currentScreening;
		this.mPageExposed = mPageExposed;
		this.mvPoster = mvPoster;
		this.mvPreview = mvPreview;
		this.mvStatus = mvStatus;
		this.starRatingAvg = starRatingAvg;
		this.numberOfStarRating = numberOfStarRating;
	}
	
	

	

	public Movie(int mvNo, String mvName, String mvOpenDate, String mvStory, String fPageExposed, String mPageExposed,
			String mvPoster, String mvPreview, String mvStatus) {
		super();
		this.mvNo = mvNo;
		this.mvName = mvName;
		this.mvOpenDate = mvOpenDate;
		this.mvStory = mvStory;
		this.fPageExposed = fPageExposed;
		this.mPageExposed = mPageExposed;
		this.mvPoster = mvPoster;
		this.mvPreview = mvPreview;
		this.mvStatus = mvStatus;
	}

	public Movie(int mvNo, String mvName, String mvOpenDate, String mvPoster, String starRatingAvg) {
		super();
		this.mvNo = mvNo;
		this.mvName = mvName;
		this.mvOpenDate = mvOpenDate;
		this.mvPoster = mvPoster;
		this.starRatingAvg = starRatingAvg;
	}
	
	public int getNumberOfStarRating() {
		return numberOfStarRating;
	}

	public void setNumberOfStarRating(int numberOfStarRating) {
		this.numberOfStarRating = numberOfStarRating;
	}

	
	public int getMvNo() {
		return mvNo;
	}


	public void setMvNo(int mvNo) {
		this.mvNo = mvNo;
	}


	public String getMvName() {
		return mvName;
	}


	public void setMvName(String mvName) {
		this.mvName = mvName;
	}


	public String getMvOpenDate() {
		return mvOpenDate;
	}


	public void setMvOpenDate(String mvOpenDate) {
		this.mvOpenDate = mvOpenDate;
	}


	public String getMvNation() {
		return mvNation;
	}


	public void setMvNation(String mvNation) {
		this.mvNation = mvNation;
	}


	public String getMvRTime() {
		return mvRTime;
	}


	public void setMvRTime(String mvRTime) {
		this.mvRTime = mvRTime;
	}


	public String getMvStory() {
		return mvStory;
	}


	public void setMvStory(String mvStory) {
		this.mvStory = mvStory;
	}


	public String getfPageExposed() {
		return fPageExposed;
	}


	public void setfPageExposed(String fPageExposed) {
		this.fPageExposed = fPageExposed;
	}


	public String getViewRating() {
		return viewRating;
	}


	public void setViewRating(String viewRating) {
		this.viewRating = viewRating;
	}


	public String getCurrentScreening() {
		return currentScreening;
	}


	public void setCurrentScreening(String currentScreening) {
		this.currentScreening = currentScreening;
	}


	public String getmPageExposed() {
		return mPageExposed;
	}


	public void setmPageExposed(String mPageExposed) {
		this.mPageExposed = mPageExposed;
	}


	public String getMvPoster() {
		return mvPoster;
	}


	public void setMvPoster(String mvPoster) {
		this.mvPoster = mvPoster;
	}


	public String getMvPreview() {
		return mvPreview;
	}


	public void setMvPreview(String mvPreview) {
		this.mvPreview = mvPreview;
	}


	public String getMvStatus() {
		return mvStatus;
	}


	public void setMvStatus(String mvStatus) {
		this.mvStatus = mvStatus;
	}


	public String getStarRatingAvg() {
		return starRatingAvg;
	}


	public void setStarRatingAvg(String starRatingAvg) {
		this.starRatingAvg = starRatingAvg;
	}

	
	public String getMvRegistDate() {
		return mvRegistDate;
	}

	public void setMvRegistDate(String mvRegistDate) {
		this.mvRegistDate = mvRegistDate;
	}

	public String getCategoryNames() {
		return categoryNames;
	}

	public void setCategoryNames(String categoryNames) {
		this.categoryNames = categoryNames;
	}
	
	

	public String getCasting() {
		return casting;
	}


	public void setCasting(String casting) {
		this.casting = casting;
	}


	public String getNmUserRequest() {
		return nmUserRequest;
	}


	public void setNmUserRequest(String nmUserRequest) {
		this.nmUserRequest = nmUserRequest;
	}


	public String getMemNo() {
		return memNo;
	}


	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}


	public String getAdminNo() {
		return adminNo;
	}


	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}


	@Override
	public String toString() {
		return "Movie [mvNo=" + mvNo + ", mvName=" + mvName + ", mvOpenDate=" + mvOpenDate + ", mvNation=" + mvNation
				+ ", mvRTime=" + mvRTime + ", mvStory=" + mvStory + ", fPageExposed=" + fPageExposed + ", viewRating="
				+ viewRating + ", currentScreening=" + currentScreening + ", mPageExposed=" + mPageExposed
				+ ", mvPoster=" + mvPoster + ", mvPreview=" + mvPreview + ", mvStatus=" + mvStatus + ", starRatingAvg="
				+ starRatingAvg + ", numberOfStarRating=" + numberOfStarRating + "]";
	}
	
}


