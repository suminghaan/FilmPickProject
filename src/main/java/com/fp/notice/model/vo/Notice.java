package com.fp.notice.model.vo;

import java.sql.Date;

public class Notice {
	/**
	 *  author : 호용
	 *  공지사항 vo객체
	 */
	private int noticeNo; // 공지사항번호
	private String category; // 카테고리 1|2 (일반|이벤트)
	private String noticeTitle; // 제목
	private String noticeContent; // 내용
	private String noticeDate; // 작성일
	private int noticeReadCount; // 조회수
	private String adminNo; // 관리자아이디 | 관리자번호
	private String noticeStatus; // 공지사항상태 (Y|N)
	private int noticeAdminNo; // 관리자회원번호(안변함)
	
	public Notice() {}

	public Notice(int noticeNo, String category, String noticeTitle, String noticeContent, String noticeDate,
			int noticeReadCount, String adminNo, String noticeStatus) {
		super();
		this.noticeNo = noticeNo;
		this.category = category;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeReadCount = noticeReadCount;
		this.adminNo = adminNo;
		this.noticeStatus = noticeStatus;
	}
	
	/**
	 * 공지사항 상세페이지에 띄울 값
	 * @param noticeNo
	 * @param category
	 * @param noticeTitle
	 * @param noticeContent
	 * @param noticeDate
	 * @param noticeReadCount
	 * @param adminNo
	 * @param noticeAdminNo
	 */
	public Notice(int noticeNo, String category, String noticeTitle, String noticeContent, String noticeDate,
			int noticeReadCount, String adminNo, int noticeAdminNo) {
		super();
		this.noticeNo = noticeNo;
		this.category = category;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeReadCount = noticeReadCount;
		this.adminNo = adminNo; // 관리자 아이디
		this.noticeAdminNo = noticeAdminNo; // 관리자 회원번호
	}

	/**
	 * 호용
	 * @param 공지사항 메인페이지에 보여질 값을 담을 필드
	 */
	public Notice(int noticeNo, String category, String noticeTitle, int noticeReadCount, String noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.category = category;
		this.noticeTitle = noticeTitle;
		this.noticeReadCount = noticeReadCount;
		this.noticeDate = noticeDate;
	}

	public int getNoticeAdminNo() {
		return noticeAdminNo;
	}
	
	public void setNoticeAdminNo(int noticeAdminNo) {
		this.noticeAdminNo = noticeAdminNo;
	}
	
	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeReadCount() {
		return noticeReadCount;
	}

	public void setNoticeReadCount(int noticeReadCount) {
		this.noticeReadCount = noticeReadCount;
	}

	public String getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", category=" + category + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticeReadCount="
				+ noticeReadCount + ", adminNo=" + adminNo + ", noticeStatus=" + noticeStatus + "]";
	}

		
	
}
