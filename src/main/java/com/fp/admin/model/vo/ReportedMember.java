package com.fp.admin.model.vo;

public class ReportedMember { // reported_mem 테이블
	private int memNo; // 회원 번호
	private int adminMo; // 관리자 번호
	private String limitReason; // 활동제한 사유
	private String startDate; // 활동제한 시작일
	private String endDate; // 활동제한 종료일 
	private String activityStatus; // 활동상태
	private String memId; // 회원 아이디
	private String suspendDate; // 이용제한 회원 조회 페이지에서 표시할 활동중지 기간
	
	public ReportedMember() {}

	// 이용제한 회원 조회 페이지에서 사용할 매개변수 생성자
	public ReportedMember(int memNo, String memId, String limitReason, String activityStatus, String suspendDate) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.limitReason = limitReason;
		this.activityStatus = activityStatus;
		this.suspendDate = suspendDate;
	}
	
	public ReportedMember(int memNo, int adminMo, String limitReason, String startDate, String endDate,
			String activityStatus, String memId, String suspendDate) {
		super();
		this.memNo = memNo;
		this.adminMo = adminMo;
		this.limitReason = limitReason;
		this.startDate = startDate;
		this.endDate = endDate;
		this.activityStatus = activityStatus;
		this.memId = memId;
		this.suspendDate = suspendDate;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getAdminMo() {
		return adminMo;
	}

	public void setAdminMo(int adminMo) {
		this.adminMo = adminMo;
	}

	public String getLimitReason() {
		return limitReason;
	}

	public void setLimitReason(String limitReason) {
		this.limitReason = limitReason;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getActivityStatus() {
		return activityStatus;
	}

	public void setActivityStatus(String activityStatus) {
		this.activityStatus = activityStatus;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getSuspendDate() {
		return suspendDate;
	}

	public void setSuspendDate(String suspendDate) {
		this.suspendDate = suspendDate;
	}

	@Override
	public String toString() {
		return "ReportedMember [memNo=" + memNo + ", adminMo=" + adminMo + ", limitReason=" + limitReason
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", activityStatus=" + activityStatus
				+ ", memId=" + memId + ", suspendDate=" + suspendDate + "]";
	}

	
}
