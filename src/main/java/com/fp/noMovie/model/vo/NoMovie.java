package com.fp.noMovie.model.vo;

public class NoMovie {
	private int nmEnrollNo; // 없는영화 신청 번호
	private String nmTitle; // 영화 제목
	private String nmStory; // 영화 줄거리
	private String nmReleaseDate; //개봉일
	private String nmRunTime; // 러닝타임
	private String nmUserRequest; // 사용자 요청사항
	private String nmNicknameStatus; // 닉네임 제공여부
	private String nmApproval; // 승인여부
	private String nmNation; // 국가
	private String nmViewGrade; // 관람등급
	private String nmEnrollDate; // 작성일
	private String nmRefuseReason; // 거절 및 반려 사유
	private int memNo; // 글 작성한 회원번호
	private int adminNo; // 신청 처리한 관리자 번호
	private String nmPoster; // 영화 메인포스터 경로
	private String nmPreview; // 영화 메인예고편 경로
	private String memNickname;
	
	private String categoryNames; // 영화에대한 카테고리 추가
	
	public NoMovie() {
		
	}

	
	/**
	 * 없는영화 신청현황을 담은 매개변수 생성자 (검색기능시) 호용
	 * @param nmEnrollNo 없는영화번호
	 * @param nmTitle 제목
	 * @param nmApproval 승인여부
	 * @param nmEnrollDate 작성일(신청일)
	 */
	public NoMovie(int nmEnrollNo, String nmTitle, String nmApproval, String nmEnrollDate, String nmRefuseReason) {
		super();
		this.nmEnrollNo = nmEnrollNo;
		this.nmTitle = nmTitle;
		this.nmApproval = nmApproval;
		this.nmEnrollDate = nmEnrollDate;
		this.nmRefuseReason = nmRefuseReason;
	}



	public NoMovie(String nmTitle, String nmPoster, String nmEnrollDate, String nmApproval, String nmStory, int memNo,
			String memNickname, int nmEnrollNo) { // (관리자 : 김지우) 없는영화 신청 목록 조회 페이지에서 쓰일 매개변수 생성자
		super();
		this.nmTitle = nmTitle;
		this.nmPoster = nmPoster;
		this.nmEnrollDate = nmEnrollDate;
		this.nmApproval = nmApproval;
		this.nmStory = nmStory;
		this.memNo = memNo;
		this.memNickname = memNickname;
		this.nmEnrollNo = nmEnrollNo;
	}

	public NoMovie(int nmEnrollNo, String nmTitle, String nmStory, String nmReleaseDate, String nmRunTime,
			String nmUserRequest, String nmNicknameStatus, String nmApproval, String nmNation, String nmViewGrade,
			String nmEnrollDate, String nmRefuseReason, int memNo, int adminNo, String nmPoster, String nmPreview,
			String memNickname, String categoryNames) {
		super();
		this.nmEnrollNo = nmEnrollNo;
		this.nmTitle = nmTitle;
		this.nmStory = nmStory;
		this.nmReleaseDate = nmReleaseDate;
		this.nmRunTime = nmRunTime;
		this.nmUserRequest = nmUserRequest;
		this.nmNicknameStatus = nmNicknameStatus;
		this.nmApproval = nmApproval;
		this.nmNation = nmNation;
		this.nmViewGrade = nmViewGrade;
		this.nmEnrollDate = nmEnrollDate;
		this.nmRefuseReason = nmRefuseReason;
		this.memNo = memNo;
		this.adminNo = adminNo;
		this.nmPoster = nmPoster;
		this.nmPreview = nmPreview;
		this.memNickname = memNickname;
		this.categoryNames = categoryNames;
	}

	/**
	 * 고객센터 없는영화신청 현황 조회시 띄울 값들을 담은 매개변수 생성자
	 * @author 호용
	 * @param nmEnrollNo 없는영화 신청 번호
	 * @param nmTitle 영화 제목
	 * @param nmApproval 승인여부
	 * @param nmEnrollDate 작성일
	 * @param nmRefuseReason 거절 및 반려 사유
	 * @param memNo 글 작성한 회원번호
	 */
	public NoMovie(int nmEnrollNo, String nmTitle, String nmApproval, String nmEnrollDate, String nmRefuseReason,
			int memNo) {
		super();
		this.nmEnrollNo = nmEnrollNo;
		this.nmTitle = nmTitle;
		this.nmApproval = nmApproval;
		this.nmEnrollDate = nmEnrollDate;
		this.nmRefuseReason = nmRefuseReason;
		this.memNo = memNo;
	}
	
	
	
	public String getCategoryNames() {
		return categoryNames;
	}
	
	public void setCategoryNames(String categoryNames) {
		this.categoryNames = categoryNames;
	}

	public int getNmEnrollNo() {
		return nmEnrollNo;
	}


	public void setNmEnrollNo(int nmEnrollNo) {
		this.nmEnrollNo = nmEnrollNo;
	}

	public String getNmTitle() {
		return nmTitle;
	}

	public void setNmTitle(String nmTitle) {
		this.nmTitle = nmTitle;
	}

	public String getNmStory() {
		return nmStory;
	}

	public void setNmStory(String nmStory) {
		this.nmStory = nmStory;
	}

	public String getNmReleaseDate() {
		return nmReleaseDate;
	}

	public void setNmReleaseDate(String nmReleaseDate) {
		this.nmReleaseDate = nmReleaseDate;
	}

	public String getNmRunTime() {
		return nmRunTime;
	}

	public void setNmRunTime(String nmRunTime) {
		this.nmRunTime = nmRunTime;
	}

	public String getNmUserRequest() {
		return nmUserRequest;
	}

	public void setNmUserRequest(String nmUserRequest) {
		this.nmUserRequest = nmUserRequest;
	}

	public String getNmNicknameStatus() {
		return nmNicknameStatus;
	}

	public void setNmNicknameStatus(String nmNicknameStatus) {
		this.nmNicknameStatus = nmNicknameStatus;
	}

	public String getNmApproval() {
		return nmApproval;
	}

	public void setNmApproval(String nmApproval) {
		this.nmApproval = nmApproval;
	}

	public String getNmNation() {
		return nmNation;
	}

	public void setNmNation(String nmNation) {
		this.nmNation = nmNation;
	}

	public String getNmViewGrade() {
		return nmViewGrade;
	}

	public void setNmViewGrade(String nmViewGrade) {
		this.nmViewGrade = nmViewGrade;
	}

	public String getNmEnrollDate() {
		return nmEnrollDate;
	}

	public void setNmEnrollDate(String nmEnrollDate) {
		this.nmEnrollDate = nmEnrollDate;
	}

	public String getNmRefuseReason() {
		return nmRefuseReason;
	}

	public void setNmRefuseReason(String nmRefuseReason) {
		this.nmRefuseReason = nmRefuseReason;
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

	public String getNmPoster() {
		return nmPoster;
	}

	public void setNmPoster(String nmPoster) {
		this.nmPoster = nmPoster;
	}

	public String getNmPreview() {
		return nmPreview;
	}

	public void setNmPreview(String nmPreview) {
		this.nmPreview = nmPreview;
	}

	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

	@Override
	public String toString() {
		return "NoMovie [nmEnrollNo=" + nmEnrollNo + ", nmTitle=" + nmTitle + ", nmStory=" + nmStory
				+ ", nmReleaseDate=" + nmReleaseDate + ", nmRunTime=" + nmRunTime + ", nmUserRequest=" + nmUserRequest
				+ ", nmNicknameStatus=" + nmNicknameStatus + ", nmApproval=" + nmApproval + ", nmNation=" + nmNation
				+ ", nmViewGrade=" + nmViewGrade + ", nmEnrollDate=" + nmEnrollDate + ", nmRefuseReason="
				+ nmRefuseReason + ", memNo=" + memNo + ", adminNo=" + adminNo + ", nmPoster=" + nmPoster
				+ ", nmPreview=" + nmPreview + ", memNickname=" + memNickname + ", categoryNames=" + categoryNames + "]";
	}
	
}
