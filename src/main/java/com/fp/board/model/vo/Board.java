package com.fp.board.model.vo;

import oracle.sql.DATE;

public class Board {

	private int bNo; // 게시글번호
	private String bTitle; // 게시글 제목
	private String bConment; // 게시글내용
	private DATE bRegistDate; // 작성일
	private int bReadCount; // 조회수
	private int bRecommendCount; // 추천수
	private String bCategory; // 카테고리 1|2 (영화|잡담)
	private String bStatus; // 블라인드 여부 Y
	private String dSatus; // 글 삭제여부
	private String memNo; // 회원번호 | 작성자아이디
	private String titleImgUrl; // 대표이미지 경로 보관할 필드(게시글에 미리보는 이미지에 표시) 
	
	public Board() {}

	public Board(int bNo, String bTitle, String bConment, DATE bRegistDate, int bReadCount, int bRecommendCount,
			String bCategory, String bStatus, String dSatus, String memNo, String titleImgUrl) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bConment = bConment;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bRecommendCount = bRecommendCount;
		this.bCategory = bCategory;
		this.bStatus = bStatus;
		this.dSatus = dSatus;
		this.memNo = memNo;
		this.titleImgUrl = titleImgUrl;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbConment() {
		return bConment;
	}

	public void setbConment(String bConment) {
		this.bConment = bConment;
	}

	public DATE getbRegistDate() {
		return bRegistDate;
	}

	public void setbRegistDate(DATE bRegistDate) {
		this.bRegistDate = bRegistDate;
	}

	public int getbReadCount() {
		return bReadCount;
	}

	public void setbReadCount(int bReadCount) {
		this.bReadCount = bReadCount;
	}

	public int getbRecommendCount() {
		return bRecommendCount;
	}

	public void setbRecommendCount(int bRecommendCount) {
		this.bRecommendCount = bRecommendCount;
	}

	public String getbCategory() {
		return bCategory;
	}

	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public String getdSatus() {
		return dSatus;
	}

	public void setdSatus(String dSatus) {
		this.dSatus = dSatus;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getTitleImgUrl() {
		return titleImgUrl;
	}

	public void setTitleImgUrl(String titleImgUrl) {
		this.titleImgUrl = titleImgUrl;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bConment=" + bConment + ", bRegistDate=" + bRegistDate
				+ ", bReadCount=" + bReadCount + ", bRecommendCount=" + bRecommendCount + ", bCategory=" + bCategory
				+ ", bStatus=" + bStatus + ", dSatus=" + dSatus + ", memNo=" + memNo + ", titleImgUrl=" + titleImgUrl
				+ "]";
	}
	
	

}