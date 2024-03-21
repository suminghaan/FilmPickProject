package com.fp.admin.model.vo;

public class Notice {
	
	 private int noticeNo;
	 private String noticeCategory;
	 private String noticeTitle;
	 private String noticeContent;
	 private String noticeDate;
	 private int noticeReadCount;
	 private String noticeWriter; // 조회시 작성자아이디 | 작성하기시 회원번호
	 private String noticeStatus;
	 private String noticeFix;
	 private String nfileOriginName;
	 private String nfileChangeName;
	 private String nfilePath;
	 
	 public Notice() {}
	 
	 

	public Notice(int noticeNo, String noticeCategory, String noticeTitle, String noticeContent, String noticeDate,
			int noticeReadCount, String noticeWriter, String noticeStatus, String noticeFix, String nfileOriginName,
			String nfileChangeName, String nfilePath) {
		super();
		this.noticeNo = noticeNo;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeReadCount = noticeReadCount;
		this.noticeWriter = noticeWriter;
		this.noticeStatus = noticeStatus;
		this.noticeFix = noticeFix;
		this.nfileOriginName = nfileOriginName;
		this.nfileChangeName = nfileChangeName;
		this.nfilePath = nfilePath;
	}



	public Notice(int noticeNo, String noticeCategory, String noticeTitle, String noticeContent, String noticeDate,
			int noticeReadCount, String noticeWriter, String noticeStatus, String noticeFix) {
		super();
		this.noticeNo = noticeNo;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeReadCount = noticeReadCount;
		this.noticeWriter = noticeWriter;
		this.noticeStatus = noticeStatus;
		this.noticeFix = noticeFix;
	}
	
	

	public Notice(int noticeNo, String noticeDate, String noticeWriter, String noticeTitle,  String noticeFix) {
		super();
		this.noticeNo = noticeNo;
		this.noticeDate = noticeDate;
		this.noticeWriter = noticeWriter;
		this.noticeTitle = noticeTitle;				
		this.noticeFix = noticeFix;
	}

	


	public Notice(int noticeNo, String noticeCategory, String noticeTitle, String noticeContent, String noticeFix,
			String nfileOriginName, String nfileChangeName, String nfilePath) {
		super();
		this.noticeNo = noticeNo;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeFix = noticeFix;
		this.nfileOriginName = nfileOriginName;
		this.nfileChangeName = nfileChangeName;
		this.nfilePath = nfilePath;
	}



	public int getNoticeNo() {
		return noticeNo;
	}



	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}



	public String getNoticeCategory() {
		return noticeCategory;
	}



	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
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



	public String getNoticeFix() {
		return noticeFix;
	}



	public void setNoticeFix(String noticeFix) {
		this.noticeFix = noticeFix;
	}



	public String getNfileOriginName() {
		return nfileOriginName;
	}



	public void setNfileOriginName(String nfileOriginName) {
		this.nfileOriginName = nfileOriginName;
	}



	public String getNfileChangeName() {
		return nfileChangeName;
	}



	public void setNfileChangeName(String nfileChangeName) {
		this.nfileChangeName = nfileChangeName;
	}



	public String getNfilePath() {
		return nfilePath;
	}



	public void setNfilePath(String nfilePath) {
		this.nfilePath = nfilePath;
	}



	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeCategory=" + noticeCategory + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticeReadCount="
				+ noticeReadCount + ", noticeWriter=" + noticeWriter + ", noticeStatus=" + noticeStatus + ", noticeFix="
				+ noticeFix + ", nfileOriginName=" + nfileOriginName + ", nfileChangeName=" + nfileChangeName
				+ ", nfilePath=" + nfilePath + "]";
	}

	
	 
	 
	 
}



