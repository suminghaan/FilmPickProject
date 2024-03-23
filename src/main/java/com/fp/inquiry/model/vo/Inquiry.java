package com.fp.inquiry.model.vo;

public class Inquiry {
	
	private int inqryNo; //문의사항번호
	private String inqryTitle; // 문의사항제목
	private String inqryContent; //문의사항내용
	private String inqryDate; //작성일
	private String inqryStatus; //답변여부(N | Y)
	private int memNo; // 문의사항작성한 회원번호
	private int adminNo; // 답변한 관리자번호
	private String inqryAContent; //답변내용
	private String inqryADate; // 답변 작성일
	
	public Inquiry() {}
	
	public Inquiry(int inqryNo, String inqryTitle, String inqryContent, String inqryDate, String inqryStatus, int memNo,
			int adminNo, String inqryAContent, String inqryADate) {
		super();
		this.inqryNo = inqryNo;
		this.inqryTitle = inqryTitle;
		this.inqryContent = inqryContent;
		this.inqryDate = inqryDate;
		this.inqryStatus = inqryStatus;
		this.memNo = memNo;
		this.adminNo = adminNo;
		this.inqryAContent = inqryAContent;
		this.inqryADate = inqryADate;
	}

	public int getInqryNo() {
		return inqryNo;
	}

	public void setInqryNo(int inqryNo) {
		this.inqryNo = inqryNo;
	}

	public String getInqryTitle() {
		return inqryTitle;
	}

	public void setInqryTitle(String inqryTitle) {
		this.inqryTitle = inqryTitle;
	}

	public String getInqryContent() {
		return inqryContent;
	}

	public void setInqryContent(String inqryContent) {
		this.inqryContent = inqryContent;
	}

	public String getInqryDate() {
		return inqryDate;
	}

	public void setInqryDate(String inqryDate) {
		this.inqryDate = inqryDate;
	}

	public String getInqryStatus() {
		return inqryStatus;
	}

	public void setInqryStatus(String inqryStatus) {
		this.inqryStatus = inqryStatus;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}

	public String getInqryAContent() {
		return inqryAContent;
	}

	public void setInqryAContent(String inqryAContent) {
		this.inqryAContent = inqryAContent;
	}

	public String getInqryADate() {
		return inqryADate;
	}

	public void setInqryADate(String inqryADate) {
		this.inqryADate = inqryADate;
	}

	@Override
	public String toString() {
		return "Inquiry [inqryNo=" + inqryNo + ", inqryTitle=" + inqryTitle + ", inqryContent=" + inqryContent
				+ ", inqryDate=" + inqryDate + ", inqryStatus=" + inqryStatus + ", memNo=" + memNo + ", adminNo="
				+ adminNo + ", inqryAContent=" + inqryAContent + ", inqryADate=" + inqryADate + "]";
	}
	
	
	
}
