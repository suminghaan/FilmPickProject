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
	private String adminId; //답변한 관리자 아이디
	
	public Inquiry() {}

	
	/**
	 * @author 김지우
	 * @param inqryNo 문의사항번호
	 * @param inqryTitle 문의사항제목
	 * @param inqryStatus 답변여부
	 * @param inqryDate 작성일
	 * @param inqryAContent 답변내용
	 */
	public Inquiry(int inqryNo, String inqryTitle, String inqryContent, String inqryStatus, String inqryDate, String inqryAContent) {
		super();
		this.inqryNo = inqryNo;
		this.inqryTitle = inqryTitle;
		this.inqryContent = inqryContent;
		this.inqryStatus = inqryStatus;
		this.inqryDate = inqryDate;
		this.inqryAContent = inqryAContent;
	}



	public Inquiry(int inqryNo, String inqryTitle, String inqryContent, String inqryDate, String inqryStatus, int memNo,
			int adminNo, String inqryAContent, String inqryADate, String adminId) {
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
		this.adminId = adminId;
	}

	/**
	 * @author 호용 - 1대1문의현황 메인페이지에 보여질 값을 담을 매개변수생성자
	 * @param inqryNo 문의사항번호
	 * @param inqryTitle 문의사항제목
	 * @param inqryDate 문의날짜
 	 * @param inqryStatus 답변여부
	 */
	public Inquiry(int inqryNo, String inqryTitle, String inqryDate, String inqryStatus) {
		super();
		this.inqryNo = inqryNo;
		this.inqryTitle = inqryTitle;
		this.inqryDate = inqryDate;
		this.inqryStatus = inqryStatus;
	}

	/**
	 * 1대1문의 상세페이지에 띄울 값들을 담는 매개변수 생성자
	 * @author 호용
	 * @param inqryNo 글번호
	 * @param inqryTitle 제목
	 * @param inqryContent 질문내용
	 * @param inqryDate 질문일
	 * @param memNo 회원번호
	 * @param adminNo 관리자번호
	 * @param inqryAContent 답변
	 * @param inqryADate 답변일
	 * @param adminId 관리자아이디
	 */
	public Inquiry(int inqryNo, String inqryTitle, String inqryContent, String inqryDate, int memNo/*, int adminNo*/, String inqryAContent/*, String inqryADate, String adminId*/) {
		super();
		this.inqryNo = inqryNo;
		this.inqryTitle = inqryTitle;
		this.inqryContent = inqryContent;
		this.inqryDate = inqryDate;
		this.memNo = memNo;
//		this.adminNo = adminNo;
		this.inqryAContent = inqryAContent;
//		this.inqryADate = inqryADate;
//		this.adminId = adminId;
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
	
	public String getAdminId() {
		return adminId;
	}
	
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	@Override
	public String toString() {
		return "Inquiry [inqryNo=" + inqryNo + ", inqryTitle=" + inqryTitle + ", inqryContent=" + inqryContent
				+ ", inqryDate=" + inqryDate + ", inqryStatus=" + inqryStatus + ", memNo=" + memNo + ", adminNo="
				+ adminNo + ", inqryAContent=" + inqryAContent + ", inqryADate=" + inqryADate + "]";
	}
	
	
	
}
