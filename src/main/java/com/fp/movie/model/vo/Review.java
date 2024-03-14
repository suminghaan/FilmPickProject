package com.fp.movie.model.vo;

public class Review {
	
	private int mvReviewNo;
	private String reviewContent;
	private String reviewDate;
	private int likePoint;
	private int agreement;
	private int disagreed;
	private int memNo;
	private int mvNo;
	
	public Review() {
	}

	public Review(int mvReviewNo, String reviewContent, String reviewDate, int likePoint, int agreement, int disagreed,
			int memNo, int mvNo) {
		super();
		this.mvReviewNo = mvReviewNo;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.likePoint = likePoint;
		this.agreement = agreement;
		this.disagreed = disagreed;
		this.memNo = memNo;
		this.mvNo = mvNo;
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

	public int getLikePoint() {
		return likePoint;
	}

	public void setLikePoint(int likePoint) {
		this.likePoint = likePoint;
	}

	public int getAgreement() {
		return agreement;
	}

	public void setAgreement(int agreement) {
		this.agreement = agreement;
	}

	public int getDisagreed() {
		return disagreed;
	}

	public void setDisagreed(int disagreed) {
		this.disagreed = disagreed;
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

	@Override
	public String toString() {
		return "Review [mvReviewNo=" + mvReviewNo + ", reviewContent=" + reviewContent + ", reviewDate=" + reviewDate
				+ ", likePoint=" + likePoint + ", agreement=" + agreement + ", disagreed=" + disagreed + ", memNo="
				+ memNo + ", mvNo=" + mvNo + "]";
	}
	
	
}
