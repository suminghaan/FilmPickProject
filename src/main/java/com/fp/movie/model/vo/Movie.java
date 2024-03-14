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
	
	public Movie() {
	}

	public Movie(int mvNo, String mvName, String mvOpenDate, String mvNation, String mvRTime, String mvStory,
			String fPageExposed, String viewRating, String currentScreening, String mPageExposed, String mvPoster,
			String mvPreview, String mvStatus) {
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

	@Override
	public String toString() {
		return "Movie [mvNo=" + mvNo + ", mvName=" + mvName + ", mvOpenDate=" + mvOpenDate + ", mvNation=" + mvNation
				+ ", mvRTime=" + mvRTime + ", mvStory=" + mvStory + ", fPageExposed=" + fPageExposed + ", viewRating="
				+ viewRating + ", currentScreening=" + currentScreening + ", mPageExposed=" + mPageExposed
				+ ", mvPoster=" + mvPoster + ", mvPreview=" + mvPreview + ", mvStatus=" + mvStatus + "]";
	}

	
	
	
}


