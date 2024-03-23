package com.fp.movie.model.vo;

public class Review {
		
	private int mvReviewNo;
	private String reviewContent;
	private String reviewDate;
	private String likePoint;
	private int memNo;
	private int mvNo;
	
	
	// 리뷰 정보를 볼 때 필수적인 요소 추가
	private String mvPoster;
	private String nickname;
	private int memLevel;
	private int agreeCount;
	private int disagreeCount;
	private String memImgPath;
	private String memColor;
	
	// ** 2024.03.20 (관리자 : 김지우) 회원 리뷰 조회 페이지에서 사용할 필드 추가
	private String mvName; // 영화제목
	
	public Review() {
	}
	
	
	public Review(int mvReviewNo, String mvName, String reviewContent, String likePoint, String nickname,
			String reviewDate) { // 회원 리뷰 조회 페이지에서 사용할 매개변수 생성자 
		super();
		this.mvReviewNo = mvReviewNo;
		this.mvName = mvName;
		this.reviewContent = reviewContent;
		this.likePoint = likePoint;
		this.nickname = nickname;
		this.reviewDate = reviewDate;
	}

	public Review(int mvReviewNo, String reviewContent, String reviewDate, String likePoint, int memNo, int mvNo,
			String nickname, int memLevel, int agreeCount, int disagreeCount, String memImgPath, String memColor) {
		super();
		this.mvReviewNo = mvReviewNo;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.likePoint = likePoint;
		this.memNo = memNo;
		this.mvNo = mvNo;
		this.nickname = nickname;
		this.memLevel = memLevel;
		this.agreeCount = agreeCount;
		this.disagreeCount = disagreeCount;
		this.memImgPath = memImgPath;
		this.memColor = memColor;
	}

	public Review(int mvReviewNo, String reviewContent, String reviewDate, String likePoint, String nickname, int memLevel,
			int agreeCount, int disagreeCount, String memImgPath, String memColor, int memNo) {
		super();
		this.mvReviewNo = mvReviewNo;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.likePoint = likePoint;
		this.nickname = nickname;
		this.memLevel = memLevel;
		this.agreeCount = agreeCount;
		this.disagreeCount = disagreeCount;
		this.memImgPath = memImgPath;
		this.memColor = memColor;
		this.memNo = memNo;
	}

	public Review(int mvReviewNo, String reviewContent, String reviewDate, String likePoint, int memNo, int mvNo,
			String mvPoster, String nickname, int memLevel, int agreeCount, int disagreeCount, String memImgPath, String memColor,
			String mvName) {
		super();
		this.mvReviewNo = mvReviewNo;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.likePoint = likePoint;
		this.memNo = memNo;
		this.mvNo = mvNo;
		this.mvPoster = mvPoster;
		this.nickname = nickname;
		this.memLevel = memLevel;
		this.agreeCount = agreeCount;
		this.disagreeCount = disagreeCount;
		this.memImgPath = memImgPath;
		this.memColor = memColor;
		this.mvName = mvName;
	}

	public String getMvPoster() {
		return mvPoster;
	}


	public void setMvPoster(String mvPoster) {
		this.mvPoster = mvPoster;
	}


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}

	public int getAgreeCount() {
		return agreeCount;
	}

	public void setAgreeCount(int agreeCount) {
		this.agreeCount = agreeCount;
	}

	public int getDisagreeCount() {
		return disagreeCount;
	}

	public void setDisagreeCount(int disagreeCount) {
		this.disagreeCount = disagreeCount;
	}

	public String getMemImgPath() {
		return memImgPath;
	}

	public void setMemImgPath(String memImgPath) {
		this.memImgPath = memImgPath;
	}

	public String getMemColor() {
		return memColor;
	}

	public void setMemColor(String memColor) {
		this.memColor = memColor;
	}

	public int getMvReviewNo() {
		return mvReviewNo;
	}

	public void setMvReviewNo(int mvReviewNo) {
		this.mvReviewNo = mvReviewNo;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getLikePoint() {
		return likePoint;
	}

	public void setLikePoint(String likePoint) {
		this.likePoint = likePoint;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
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


	@Override
	public String toString() {
		return "Review [mvReviewNo=" + mvReviewNo + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate
				+ ", likePoint=" + likePoint + ", memNo=" + memNo + ", mvNo=" + mvNo + ", mvPoster=" + mvPoster
				+ ", nickname=" + nickname + ", memLevel=" + memLevel + ", agreeCount=" + agreeCount
				+ ", disagreeCount=" + disagreeCount + ", memImgPath=" + memImgPath + ", memColor=" + memColor
				+ ", mvName=" + mvName + "]";
	}


}
