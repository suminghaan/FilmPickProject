package com.fp.admin.model.vo;

public class ReportedMember { // reported_mem 테이블
	private int memNo; // 회원 번호
	private int adminNo; // 관리자 번호
	private String limitReason; // 활동제한 사유
	private String startDate; // 활동제한 시작일
	private String endDate; // 활동제한 종료일 
	private String activityStatus; // 활동상태
	private String memId; // 회원 아이디
	private String suspendDate; // 이용제한 회원 조회 페이지에서 표시할 활동중지 기간
	private int endDateNum; // 신고회원관리 활동중지에 사용할 필드
	private String memNickName; // 신고당한 회원 닉네임[호용]
	
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
	
	public ReportedMember(int memNo, String memId, String limitReason, String activityStatus, String suspendDate, String memNickName, int adminNo) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.limitReason = limitReason;
		this.activityStatus = activityStatus;
		this.suspendDate = suspendDate;
		this.memNickName = memNickName;
		this.adminNo = adminNo;
	}

	public ReportedMember(int memNo, int adminNo, String limitReason, String startDate, String endDate,
			String activityStatus, String memId, String suspendDate, int endDateNum) {
		super();
		this.memNo = memNo;
		this.adminNo = adminNo;
		this.limitReason = limitReason;
		this.startDate = startDate;
		this.endDate = endDate;
		this.activityStatus = activityStatus;
		this.memId = memId;
		this.suspendDate = suspendDate;
		this.endDateNum = endDateNum;
	}

	public String getMemNickName() {
		return memNickName;
	}
	
	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
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

	public int getadminNo() {
		return adminNo;
	}

	public void setadminNo(int adminNo) {
		this.adminNo = adminNo;
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

	public int getEndDateNum() {
		return endDateNum;
	}

	public void setEndDateNum(int endDateNum) {
		this.endDateNum = endDateNum;
	}

	@Override
	public String toString() {
		return "ReportedMember [memNo=" + memNo + ", adminNo=" + adminNo + ", limitReason=" + limitReason
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", activityStatus=" + activityStatus
				+ ", memId=" + memId + ", suspendDate=" + suspendDate + ", endDateNum=" + endDateNum + "]";
	}

	
	
}
