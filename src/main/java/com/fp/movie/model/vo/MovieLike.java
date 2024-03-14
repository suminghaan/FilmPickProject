package com.fp.movie.model.vo;

public class MovieLike {
	
	private int likeMvNo;
	private String likeDate;
	private int mvNo;
	private int memNo;
	
	public MovieLike() {
	}

	public MovieLike(int likeMvNo, String likeDate, int mvNo, int memNo) {
		super();
		this.likeMvNo = likeMvNo;
		this.likeDate = likeDate;
		this.mvNo = mvNo;
		this.memNo = memNo;
	}

	public int getLikeMvNo() {
		return likeMvNo;
	}

	public void setLikeMvNo(int likeMvNo) {
		this.likeMvNo = likeMvNo;
	}

	public String getLikeDate() {
		return likeDate;
	}

	public void setLikeDate(String likeDate) {
		this.likeDate = likeDate;
	}

	public int getMvNo() {
		return mvNo;
	}

	public void setMvNo(int mvNo) {
		this.mvNo = mvNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return "MovieLike [likeMvNo=" + likeMvNo + ", likeDate=" + likeDate + ", mvNo=" + mvNo + ", memNo=" + memNo
				+ "]";
	}
	
	
}
