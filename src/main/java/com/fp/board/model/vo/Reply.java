package com.fp.board.model.vo;

public class Reply {
	
	private int replyNo; // 댓글번호
	private String replyContent; // 댓글내용
	private String enrollDate; //작성일
	private String bStatus; // 신고여부(Y|N)
	private String dStatus; // 삭제여부(Y|N)
	private int reBoNo; // 게시글번호
	private String reMemNo; // insert시 회원번호 | select시 회원아이디 
	
	public Reply() {}

	public Reply(int replyNo, String replyContent, String enrollDate, String bStatus, String dStatus, int reBoNo,
			String reMemNo) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.enrollDate = enrollDate;
		this.bStatus = bStatus;
		this.dStatus = dStatus;
		this.reBoNo = reBoNo;
		this.reMemNo = reMemNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public String getdStatus() {
		return dStatus;
	}

	public void setdStatus(String dStatus) {
		this.dStatus = dStatus;
	}

	public int getReBoNo() {
		return reBoNo;
	}

	public void setReBoNo(int reBoNo) {
		this.reBoNo = reBoNo;
	}

	public String getReMemNo() {
		return reMemNo;
	}

	public void setReMemNo(String reMemNo) {
		this.reMemNo = reMemNo;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", enrollDate=" + enrollDate
				+ ", bStatus=" + bStatus + ", dStatus=" + dStatus + ", reBoNo=" + reBoNo + ", reMemNo=" + reMemNo + "]";
	}
	
}
