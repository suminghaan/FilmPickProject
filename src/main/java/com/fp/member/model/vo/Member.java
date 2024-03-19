package com.fp.member.model.vo;

public class Member {
	private int memNo; // 회원번호
	private String memId; // 아이디
	private String memPwd; // 비밀번호
	private String memName; // 이름
	private String memBirth; // 생년월일
	private String memGender; // 성별
	private String memEmail; // 이메일
	private String memPhone; // 전화번호
	private String prefGenre; // 선호장르
	private String nickname; // 닉네임
	private String memStatus; // 회원상태
	private String signInDate; // 회원정보수정일
	private int memLevel; // 회원등급
	private String memColor; // 회원정보 색깔
	private String memImgPath; // 프로필 이미지 경로
	private int memFile; // 회원정보 사진파일 번호
	private String dormantStatus; // 휴면회원 여부
	private int reviewContentCnt; // 리뷰횟수 ( (관리자) 회원조회 페이지에서 사용할 필드 )
	private double avgLikePoint; // 별점평균 ( (관리자) 회원조회 페이지에서 사용할 필드)
	private int memBoardCnt; // 회원이 작성한 게시글 개수 ( (관리자) 회원 작성 게시글 조회하는 페이지에서 사용할 필드 )

	// 회원 작성 게시글 조회하는 페이지에서 사용할 매개변수 생성자 (김지우)
	public Member(String memId, String memImgPath, String memColor, String nickname, int memLevel, int memBoardCnt) {
		super();
		this.memId = memId;
		this.memImgPath = memImgPath;
		this.memColor = memColor;
		this.nickname = nickname;
		this.memLevel = memLevel;
		this.memBoardCnt = memBoardCnt;
	}

	public Member(int memNo, String memId, int memLevel, int reviewContentCnt, double avgLikePoint, String prefGenre,
			String dormantStatus) { // 회원조회 페이지에서 전체회원조회 용도로 사용될 매개변수 생성자 (김지우)
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memLevel = memLevel;
		this.reviewContentCnt = reviewContentCnt;
		this.avgLikePoint = avgLikePoint;
		this.prefGenre = prefGenre;
		this.dormantStatus = dormantStatus;
	}

	public Member(int memNo, String memId, String memPwd, String memName, String memBirth, String memGender,
			String memEmail, String memPhone, String prefGenre, String nickname, String memStatus, String signInDate,
			int memLevel, String memColor, String memImgPath, int memFile, String dormantStatus) { // 회원 로그인 용도(은정)
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memBirth = memBirth;
		this.memGender = memGender;
		this.memEmail = memEmail;
		this.memPhone = memPhone;
		this.prefGenre = prefGenre;
		this.nickname = nickname;
		this.memStatus = memStatus;
		this.signInDate = signInDate;
		this.memLevel = memLevel;
		this.memColor = memColor;
		this.memImgPath = memImgPath;
		this.memFile = memFile;
		this.dormantStatus = dormantStatus;
	}

	public Member(String memId, String memPwd, String memEmail, String nickname, String memName, String memBirth,
			String memGender, String memPhone, String prefGenre) { // 회원가입용(은정)
		super();
		this.memId = memId;
		this.memPwd = memPwd;
		this.memEmail = memEmail;
		this.nickname = nickname;
		this.memName = memName;
		this.memBirth = memBirth;
		this.memGender = memGender;
		this.memPhone = memPhone;
		this.prefGenre = prefGenre;
	}

	public Member() {

	}

	public Member(int memNo, String memId, String memPwd, String memName, String memBirth, String memGender,
			String memEmail, String memPhone, String prefGenre, String nickname, String memStatus, String signInDate,
			int memLevel, String memColor, String memImgPath, int memFile, String dormantStatus, int reviewContentCnt,
			double avgLikePoint) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.memPwd = memPwd;
		this.memName = memName;
		this.memBirth = memBirth;
		this.memGender = memGender;
		this.memEmail = memEmail;
		this.memPhone = memPhone;
		this.prefGenre = prefGenre;
		this.nickname = nickname;
		this.memStatus = memStatus;
		this.signInDate = signInDate;
		this.memLevel = memLevel;
		this.memColor = memColor;
		this.memImgPath = memImgPath;
		this.memFile = memFile;
		this.dormantStatus = dormantStatus;
		this.reviewContentCnt = reviewContentCnt;
		this.avgLikePoint = avgLikePoint;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPwd() {
		return memPwd;
	}

	public void setMemPwd(String memPwd) {
		this.memPwd = memPwd;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemGender() {
		return memGender;
	}

	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getPrefGenre() {
		return prefGenre;
	}

	public void setPrefGenre(String prefGenre) {
		this.prefGenre = prefGenre;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	public String getSignInDate() {
		return signInDate;
	}

	public void setSignInDate(String signInDate) {
		this.signInDate = signInDate;
	}

	public int getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}

	public String getMemColor() {
		return memColor;
	}

	public void setMemColor(String memColor) {
		this.memColor = memColor;
	}

	public String getMemImgPath() {
		return memImgPath;
	}

	public void setMemImgPath(String memImgPath) {
		this.memImgPath = memImgPath;
	}

	public int getMemFile() {
		return memFile;
	}

	public void setMemFile(int memFile) {
		this.memFile = memFile;
	}

	public String getDormantStatus() {
		return dormantStatus;
	}

	public void setDormantStatus(String dormantStatus) {
		this.dormantStatus = dormantStatus;
	}

	public int getReviewContentCnt() {
		return reviewContentCnt;
	}

	public void setReviewContentCnt(int reviewContentCnt) {
		this.reviewContentCnt = reviewContentCnt;
	}

	public double getAvgLikePoint() {
		return avgLikePoint;
	}

	public void setAvgLikePoint(double avgLikePoint) {
		this.avgLikePoint = avgLikePoint;
	}

	public int getMemBoardCnt() {
		return memBoardCnt;
	}

	public void setMemBoardCnt(int memBoardCnt) {
		this.memBoardCnt = memBoardCnt;
	}

	@Override
	public String toString() {
		return "Member [memNo=" + memNo + ", memId=" + memId + ", memPwd=" + memPwd + ", memName=" + memName
				+ ", memBirth=" + memBirth + ", memGender=" + memGender + ", memEmail=" + memEmail + ", memPhone="
				+ memPhone + ", prefGenre=" + prefGenre + ", nickname=" + nickname + ", memStatus=" + memStatus
				+ ", signInDate=" + signInDate + ", memLevel=" + memLevel + ", memColor=" + memColor + ", memImgPath="
				+ memImgPath + ", memFile=" + memFile + ", dormantStatus=" + dormantStatus + ", reviewContentCnt="
				+ reviewContentCnt + ", avgLikePoint=" + avgLikePoint + ", memBoardCnt=" + memBoardCnt + "]";
	}

}
