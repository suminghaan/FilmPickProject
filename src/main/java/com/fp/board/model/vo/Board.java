package com.fp.board.model.vo;

public class Board {

	private int bNo; // 게시글번호
	private String bTitle; // 게시글 제목
	private String bContent; // 게시글내용
	private String bRegistDate; // 작성일
	private int bReadCount; // 조회수
	private int bRecommendCount; // 추천수
	private String bCategory; // 카테고리 1|2 (영화|잡담)
	private String bStatus; // 블라인드 여부 Y
	private String dSatus; // 글 삭제여부
	private String memNo; // 회원번호 | 작성자아이디
	private String titleImgUrl; // 대표이미지 경로 보관할 필드(게시글에 미리보는 이미지에 표시) 
	private int replyCount; // 댓글갯수
	
	
	public Board() {}

	
	/** 관리자) 회원 작성 게시글 페이징, 게시글 조회 용도로 사용할 생성자
	 * 
	 * @param bNo 글번호
	 * @param bTitle 게시글 제목
	 * @param memNo 작성자 닉네임
	 * @param bRegistDate 작성일
	 * @param replyCount 조회수
	 * 
	 * @author 김지우
	 */
	public Board(int bNo, String bTitle, String bConment, String memNo, String bRegistDate,  int replyCount) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bConment = bConment;
		this.memNo = memNo;
		this.bRegistDate = bRegistDate;
		this.replyCount = replyCount;
	}


	/**
	 * 커뮤니티 메인페이지의 띄울 값들을 보관하기 위한 매개변수 생성자
	 * @호용
	 */
	public Board(int bNo, String bTitle, String bRegistDate, int bReadCount, int bRecommendCount, String bCategory,
			String memNo, String titleImgUrl, int replyCount) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bRecommendCount = bRecommendCount;
		this.bCategory = bCategory;
		this.memNo = memNo;
		this.titleImgUrl = titleImgUrl;
		this.replyCount = replyCount;
	}



	public Board(int bNo, String bTitle, String bContent, String bRegistDate, int bReadCount, int bRecommendCount,
			String bCategory, String bStatus, String dSatus, String memNo, String titleImgUrl, int replyCount) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bRecommendCount = bRecommendCount;
		this.bCategory = bCategory;
		this.bStatus = bStatus;
		this.dSatus = dSatus;
		this.memNo = memNo;
		this.titleImgUrl = titleImgUrl;
		this.replyCount = replyCount;
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


	public String getbRegistDate() {
		return bRegistDate;
	}


	public void setbRegistDate(String bRegistDate) {
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


	public int getReplyCount() {
		return replyCount;
	}


	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}


	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bRegistDate=" + bRegistDate
				+ ", bReadCount=" + bReadCount + ", bRecommendCount=" + bRecommendCount + ", bCategory=" + bCategory
				+ ", bStatus=" + bStatus + ", dSatus=" + dSatus + ", memNo=" + memNo + ", titleImgUrl=" + titleImgUrl
				+ ", replyCount=" + replyCount + "]";
	}


	



}