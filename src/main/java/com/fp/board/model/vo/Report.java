package com.fp.board.model.vo;

public class Report {

	private int reportNo; //신고번호
	private int reportType; //신고분류(1욕설 | 2도배 | 3선정 | 4기타)
	private String reportContent; //신고내용
	private String reportDate; // 신고날짜
	private int reportBoardNo; // 신고받은게시글 | 댓글 번호
	private String reportMemNo; //신고한 회원번호
	private String reportedMemNo; //신고받은 회원번호
	
	public Report(int reportNo, int reportType, String reportContent, String reportDate, int reportBoardNo,
			String reportMemNo, String reportedMemNo) {
		super();
		this.reportNo = reportNo;
		this.reportType = reportType;
		this.reportContent = reportContent;
		this.reportDate = reportDate;
		this.reportBoardNo = reportBoardNo;
		this.reportMemNo = reportMemNo;
		this.reportedMemNo = reportedMemNo;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getReportType() {
		return reportType;
	}

	public void setReportType(int reportType) {
		this.reportType = reportType;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public int getReportBoardNo() {
		return reportBoardNo;
	}

	public void setReportBoardNo(int reportBoardNo) {
		this.reportBoardNo = reportBoardNo;
	}

	public String getReportMemNo() {
		return reportMemNo;
	}

	public void setReportMemNo(String reportMemNo) {
		this.reportMemNo = reportMemNo;
	}

	public String getReportedMemNo() {
		return reportedMemNo;
	}

	public void setReportedMemNo(String reportedMemNo) {
		this.reportedMemNo = reportedMemNo;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportType=" + reportType + ", reportContent=" + reportContent
				+ ", reportDate=" + reportDate + ", reportBoardNo=" + reportBoardNo + ", reportMemNo=" + reportMemNo
				+ ", reportedMemNo=" + reportedMemNo + "]";
	}
	
}
