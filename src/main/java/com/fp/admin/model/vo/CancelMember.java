package com.fp.admin.model.vo;

public class CancelMember { // 탈퇴회원 테이블
	private String memNo; // 회원번호
	private String adminNo; // 관리자번호
	private String cancelDate; // 탈퇴일
	private String memId; // 회원아이디
	
	public CancelMember() {}

	public CancelMember(String memNo, String adminNo, String cancelDate) {
		super();
		this.memNo = memNo;
		this.adminNo = adminNo;
		this.cancelDate = cancelDate;
	}

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getAdminNo() {
		return adminNo;
	}

	public void setAdminNo(String adminNo) {
		this.adminNo = adminNo;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	@Override
	public String toString() {
		return "CancelMember [memNo=" + memNo + ", adminNo=" + adminNo + ", cancelDate=" + cancelDate + ", memId="
				+ memId + "]";
	}

}
