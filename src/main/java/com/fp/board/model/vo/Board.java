package com.fp.board.model.vo;

import java.sql.Date;

public class Board {

	private int bNo; // 게시글번호
	private String bTitle; // 게시글제목
	private String bContent; // 게시글내용
	private Date bRegistDate; // 작성일
	private int bReadCount; // 조회수
	private int bRecommendCount; // 추천수
	private String bCategory; // 카테고리 1|2 (영화|잡담)
	private String bPublicStatus; // 인기글여부 Y|N 필드 추가했음
	private String bBanStatus; // 블라인드 여부 Y|N
	private String bDeleteStatus; // 글삭제여부 Y|N
	private String boardWriter; // 작성자회원번호 | 작성자아이디
	private String titleImgURL; // 대표이미지 경로 보관할 필드(게시판 리스트에 조회될사진??)
	
	public Board() {}

	public Board(int bNo, String bTitle, String bContent, Date bRegistDate, int bReadCount, int bRecommendCount,
			String bCategory, String bPublicStatus, String bBanStatus, String bDeleteStatus, String boardWriter,
			String titleImgURL) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bRecommendCount = bRecommendCount;
		this.bCategory = bCategory;
		this.bPublicStatus = bPublicStatus;
		this.bBanStatus = bBanStatus;
		this.bDeleteStatus = bDeleteStatus;
		this.boardWriter = boardWriter;
		this.titleImgURL = titleImgURL;
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

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbRegistDate() {
		return bRegistDate;
	}

	public void setbRegistDate(Date bRegistDate) {
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

	public String getbPublicStatus() {
		return bPublicStatus;
	}

	public void setbPublicStatus(String bPublicStatus) {
		this.bPublicStatus = bPublicStatus;
	}

	public String getbBanStatus() {
		return bBanStatus;
	}

	public void setbBanStatus(String bBanStatus) {
		this.bBanStatus = bBanStatus;
	}

	public String getbDeleteStatus() {
		return bDeleteStatus;
	}

	public void setbDeleteStatus(String bDeleteStatus) {
		this.bDeleteStatus = bDeleteStatus;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getTitleImgURL() {
		return titleImgURL;
	}

	public void setTitleImgURL(String titleImgURL) {
		this.titleImgURL = titleImgURL;
	}

	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bRegistDate=" + bRegistDate
				+ ", bReadCount=" + bReadCount + ", bRecommendCount=" + bRecommendCount + ", bCategory=" + bCategory
				+ ", bPublicStatus=" + bPublicStatus + ", bBanStatus=" + bBanStatus + ", bDeleteStatus=" + bDeleteStatus
				+ ", boardWriter=" + boardWriter + ", titleImgURL=" + titleImgURL + "]";
	}
	
	
	
}
