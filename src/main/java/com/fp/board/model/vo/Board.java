package com.fp.board.model.vo;

public class Board {

	private int bNo; // 게시글번호
	private String bTitle; // 게시글 제목
	private String bContent; // 게시글내용
	private String bRegistDate; // 작성일
	private int bReadCount; // 조회수
	private int bRecommendCount; // 추천수
	private String bCategory; // 카테고리 1|2 (영화|잡담)
	private String bStatus; // 블라인드 여부 Y
	private String dSatus; // 글 삭제여부
	private String memNo; // 회원번호 | 작성자아이디 | 닉네임(관리자 페이지에서 쓸 예정 (김지우))
	private String titleImgUrl; // 대표이미지 경로 보관할 필드(게시글에 미리보는 이미지에 표시) 
	private int replyCount; // 댓글갯수
	private int memberNo; // 게시글을 작성한 회원의 번호
	// ** 2024.03.20 (관리자 : 김지우) 회원 작성 게시글 조회 페이지에서 쓸 필드 추가
	private String memId; // 회원 아이디
	private String memColor; // 회원 색깔
	private int boardCount; // 총 게시글 개수
	private int memLevel; // 회원등급
	private String memNickname; // 닉네임
	// ** 2024.03.21 (관리자 : 한수민) 블라인드 게시글 조회 페이지에서 쓸 필드 추가
	private String replyContent; // 댓글내용
	// ** 2024.03.22 (관리자 : 한수민) 신고된 게시글 페이지에서 쓸 필드 추가
	private int reportCount; // 신고수
	private String fileOriginName; // 기존파일명
	private String fileChangeName; // 바뀐파일명
	private String filePath;	// 파일경로
	
	public Board() {}
	
	/**
	 * (관리자) 신고게시글 조회용
	 * @param bNo
	 * @param bTitle
	 * @param bContent
	 * @param bRegistDate
	 * @param bReadCount
	 * @param bCategory
	 * @param memId
	 * @param reportCount
	 * @param fileOriginName
	 * @param fileChangeName
	 * @param filePath
	 * 
	 * @author 수민
	 */

	public Board(int bNo, String bTitle, String bContent, String bRegistDate, int bReadCount, String bCategory,
			String memId, int reportCount, String fileOriginName, String fileChangeName, String filePath) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bCategory = bCategory;
		this.memId = memId;
		this.reportCount = reportCount;
		this.fileOriginName = fileOriginName;
		this.fileChangeName = fileChangeName;
		this.filePath = filePath;
	}



	/**
	 * (관리자) 블라인드게시글의 댓글 조회용도
	 * @param bNo 게시글번호
	 * @param bTitle 게시글제목
	 * @param bRegistDate 게시글등록일
	 * @param bReadCount 조회수
	 * @param bCategory 카테고리
	 * @param replyCount 댓글수
	 * @param memId 등록자
	 * @param replyContent 댓글내용
	 * 
	 * @author 한수민
	 */
	public Board(int bNo, String bTitle, String bRegistDate, int bReadCount, String bCategory,
			int replyCount, String memId, String bContent) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bCategory = bCategory;
		this.replyCount = replyCount;
		this.memId = memId;
		this.bContent = bContent;
	}
	
	




	/**
	 * (관리자) 블라인드 게시글 목록 조회용
	 * @param bNo
	 * @param bTitle
	 * @param bRegistDate
	 * @param bReadCount
	 * @param bCategory
	 * @param replyCount
	 * @param memId
	 *  @author 한수민
	 */
	public Board(int bNo, String bTitle, String bRegistDate, int bReadCount, String bCategory, int replyCount,
			String memId) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bCategory = bCategory;
		this.replyCount = replyCount;
		this.memId = memId;
	}




	/** (관리자) 회원 프로필 조회 용도
	 * @param memNo 회원 아이디
	 * @param titleImgUrl 회원 프로필 이미지 경로
	 * @param memColor 회원 프로필 색상
	 * @param memNickname 회원 닉네임
	 * @param memLevel 회원등급
	 * @param boardCount 총 게시글 개수
	 * 
	 * @author 김지우
	 */
	public Board(String memNo, String memId, String titleImgUrl, String memColor, String memNickname, int memLevel, int boardCount) {
		super();
		this.memNo = memNo;
		this.memId = memId;
		this.titleImgUrl = titleImgUrl;
		this.memColor = memColor;
		this.memNickname = memNickname;
		this.memLevel = memLevel;
		this.boardCount = boardCount;
	}



	/** (관리자) 회원 작성 게시글 조회에서 쓸 용도
	 * 
	 * @param bNo 게시글 번호
	 * @param bTitle 게시글 제목
	 * @param bContent 게시글 내용
	 * @param memNo 닉네임
	 * @param bRegistDate 작성일
	 * @param bReadCount 조회수
	 * @param replyCount 댓글 개수
	 * 
	 * @author 김지우
	 */
	public Board(int bNo, String bTitle, String bContent, String memNo, String bRegistDate, int bReadCount, int replyCount) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.memNo = memNo;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.replyCount = replyCount;
	}

	/** 관리자) 회원 작성 게시글 페이징, 게시글 조회 용도로 사용할 생성자
	 * 
	 * @param bNo 글번호
	 * @param bTitle 게시글 제목
	 * @param memNo 작성자 닉네임
	 * @param bRegistDate 작성일
	 * @param replyCount 조회수
	 * 
	 * @author 김지우
	 */
	public Board(int bNo, String bTitle, String bContent, String memNo, String bRegistDate, int replyCount) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.memNo = memNo;
		this.bRegistDate = bRegistDate;
		this.replyCount = replyCount;
	}


	/**
	 * 커뮤니티 메인페이지의 띄울 값들을 보관하기 위한 매개변수 생성자
	 * @호용
	 */
	public Board(int bNo, String bTitle, String bRegistDate, int bReadCount, int bRecommendCount, String bCategory,
			String memNo, String titleImgUrl, int replyCount, String bStatus, String dSatus) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bRecommendCount = bRecommendCount;
		this.bCategory = bCategory;
		this.memNo = memNo;
		this.titleImgUrl = titleImgUrl;
		this.replyCount = replyCount;
		this.bStatus = bStatus;
		this.dSatus = dSatus;
		
	}

	
	/**
	 * 커뮤니티 게시글상세페이지에 띄울 값들을 보관하기 위한 매개변수 생성자
	 * @param bNo 글번호
	 * @param bTitle 게시글 제목
	 * @param bContent 게시글 내용
	 * @param bRegistDate 작성시간
	 * @param bCategory 카테고리(영화 | 잡담)
	 * @param memNo (작성자아이디)
	 * @author 김호용
	 */
	public Board(int bNo, String bTitle, String bContent, String bRegistDate, String bCategory, String memNo, int memberNo) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bRegistDate = bRegistDate;
		this.bCategory = bCategory;
		this.memNo = memNo;
		this.memberNo = memberNo;
	}

	
	/**
	 * 마이페이지 작성글목록
	 * @param bNo
	 * @param bTitle
	 * @param bRegistDate
	 * @param bReadCount
	 * @author 정은정
	 */
	public Board(int bNo, String bCategory, String bTitle, String bRegistDate, int bReadCount) {
		super();
		this.bNo = bNo;
		this.bCategory = bCategory;
		this.bTitle = bTitle;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
	}


	

	public Board(int bNo, String bTitle, String bContent, String bRegistDate, int bReadCount, int bRecommendCount,
			String bCategory, String bStatus, String dSatus, String memNo, String titleImgUrl, int replyCount,
			int memberNo, String memId, String memColor, int boardCount, int memLevel, String memNickname,
			String replyContent) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bRecommendCount = bRecommendCount;
		this.bCategory = bCategory;
		this.bStatus = bStatus;
		this.dSatus = dSatus;
		this.memNo = memNo;
		this.titleImgUrl = titleImgUrl;
		this.replyCount = replyCount;
		this.memberNo = memberNo;
		this.memId = memId;
		this.memColor = memColor;
		this.boardCount = boardCount;
		this.memLevel = memLevel;
		this.memNickname = memNickname;
		this.replyContent = replyContent;
	}




	public Board(int bNo, String bTitle, String bContent, String bRegistDate, int bReadCount, int bRecommendCount,
			String bCategory, String bStatus, String dSatus, String memNo, String titleImgUrl, int replyCount,
			String memId, String memImgPath, String memColor, String nickname, int memLevel, int boardCount) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bRecommendCount = bRecommendCount;
		this.bCategory = bCategory;
		this.bStatus = bStatus;
		this.dSatus = dSatus;
		this.memNo = memNo;
		this.titleImgUrl = titleImgUrl;
		this.replyCount = replyCount;
	}

	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public String getbTitle() {
		return bTitle;
	}


	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}


	public String getbContent() {
		return bContent;
	}


	public void setbContent(String bContent) {
		this.bContent = bContent;
	}


	public String getbRegistDate() {
		return bRegistDate;
	}


	public void setbRegistDate(String bRegistDate) {
		this.bRegistDate = bRegistDate;
	}


	public int getbReadCount() {
		return bReadCount;
	}


	public void setbReadCount(int bReadCount) {
		this.bReadCount = bReadCount;
	}


	public int getbRecommendCount() {
		return bRecommendCount;
	}


	public void setbRecommendCount(int bRecommendCount) {
		this.bRecommendCount = bRecommendCount;
	}


	public String getbCategory() {
		return bCategory;
	}


	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}


	public String getbStatus() {
		return bStatus;
	}


	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}


	public String getdSatus() {
		return dSatus;
	}


	public void setdSatus(String dSatus) {
		this.dSatus = dSatus;
	}


	public String getMemNo() {
		return memNo;
	}


	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}


	public String getTitleImgUrl() {
		return titleImgUrl;
	}


	public void setTitleImgUrl(String titleImgUrl) {
		this.titleImgUrl = titleImgUrl;
	}


	public int getReplyCount() {
		return replyCount;
	}


	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
	public String getMemColor() {
		return memColor;
	}



	public void setMemColor(String memColor) {
		this.memColor = memColor;
	}



	public int getBoardCount() {
		return boardCount;
	}



	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}



	public int getMemLevel() {
		return memLevel;
	}



	public void setMemLevel(int memLevel) {
		this.memLevel = memLevel;
	}



	public String getMemNickname() {
		return memNickname;
	}

	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}

	public String getMemId() {
		return memId;
	}



	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	
	
	
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	



	public String getReplyContent() {
		return replyContent;
	}





	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}





	public int getReportCount() {
		return reportCount;
	}




	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}




	public String getFileOriginName() {
		return fileOriginName;
	}



	public void setFileOriginName(String fileOriginName) {
		this.fileOriginName = fileOriginName;
	}



	public String getFileChangeName() {
		return fileChangeName;
	}



	public void setFileChangeName(String fileChangeName) {
		this.fileChangeName = fileChangeName;
	}



	public String getFilePath() {
		return filePath;
	}



	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}



	public Board(int bNo, String bTitle, String bContent, String bRegistDate, int bReadCount, int bRecommendCount,
			String bCategory, String bStatus, String dSatus, String memNo, String titleImgUrl, int replyCount,
			String memId, String memColor, int boardCount, int memLevel, String memNickname) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bRegistDate = bRegistDate;
		this.bReadCount = bReadCount;
		this.bRecommendCount = bRecommendCount;
		this.bCategory = bCategory;
		this.bStatus = bStatus;
		this.dSatus = dSatus;
		this.memNo = memNo;
		this.titleImgUrl = titleImgUrl;
		this.replyCount = replyCount;
		this.memId = memId;
		this.memColor = memColor;
		this.boardCount = boardCount;
		this.memLevel = memLevel;
		this.memNickname = memNickname;
	}




	@Override
	public String toString() {
		return "Board [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bRegistDate=" + bRegistDate
				+ ", bReadCount=" + bReadCount + ", bRecommendCount=" + bRecommendCount + ", bCategory=" + bCategory
				+ ", bStatus=" + bStatus + ", dSatus=" + dSatus + ", memNo=" + memNo + ", titleImgUrl=" + titleImgUrl
				+ ", replyCount=" + replyCount + ", memberNo=" + memberNo + ", memId=" + memId + ", memColor="
				+ memColor + ", boardCount=" + boardCount + ", memLevel=" + memLevel + ", memNickname=" + memNickname
				+ ", replyContent=" + replyContent + "]";
	}

}