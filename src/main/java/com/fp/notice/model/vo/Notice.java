package com.fp.notice.model.vo;

import java.sql.Date;

public class Notice {
	// 공지사항
	private int noticeNo; // 공지사항번호
	private String category; // 카테고리 1|2 (일반|이벤트)
	private String noticeTitle; // 제목
	private String noticeContent; // 내용
	private Date noticeDate; // 작성일
	private int noticeReadCount; // 조회수
	private String noticeWriter; // 관리자아이디 | 관리자번호
	private String noticeStatus; // 공지사항상태 (Y|N)
	
	public Notice() {}

	public Notice(int noticeNo, String category, String noticeTitle, String noticeContent, Date noticeDate,
			int noticeReadCount, String noticeWriter, String noticeStatus) {
		super();
		this.noticeNo = noticeNo;
		this.category = category;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeReadCount = noticeReadCount;
		this.noticeWriter = noticeWriter;
		this.noticeStatus = noticeStatus;
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

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeReadCount() {
		return noticeReadCount;
	}

	public void setNoticeReadCount(int noticeReadCount) {
		this.noticeReadCount = noticeReadCount;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
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
				+ noticeReadCount + ", noticeWriter=" + noticeWriter + ", noticeStatus=" + noticeStatus + "]";
	}
	
	
	
	
	
}
