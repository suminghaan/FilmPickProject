package com.fp.common.model.vo;

public class Attachment {
	private int fileNo;//첨부파일번호
	private String originName;//첨부파일원본명
	private String changeName;//첨부파일수정명
	private String uploadDate;//파일업로드날짜
	private int fileType;//사진|동영상(1|2)
	private String filePath;//저장경로
	private int fileLevel;//파일레벨 1|2 (메인|추가)
	private String fileStatus;//파일상태(Y|N)
	private String refType;//영화상세이미지/영화예고편/게시글...../없는영화
	/*
	 * 참조대상유형
		1 : 영화 이미지
		2 : 영화 동영상
		3 : 게시글
		4 : 없는 영화 ->수정필요
		5 : 공지사항
		6 : 사용자이미지
		7 : 1대1 문의
		8 : 인물사진
	 */
	private int refNo;//영화번호/게시글번호
	
	public Attachment() {}
	
	public Attachment(int fileNo, String originName, String changeName, String uploadDate, int fileType,
			String filePath, int fileLevel, String fileStatus, String refType, int refNo) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.uploadDate = uploadDate;
		this.fileType = fileType;
		this.filePath = filePath;
		this.fileLevel = fileLevel;
		this.fileStatus = fileStatus;
		this.refType = refType;
		this.refNo = refNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileType() {
		return fileType;
	}

	public void setFileType(int fileType) {
		this.fileType = fileType;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}

	public String getRefType() {
		return refType;
	}

	public void setRefType(String refType) {
		this.refType = refType;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}
	
	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", originName=" + originName + ", changeName=" + changeName
				+ ", uploadDate=" + uploadDate + ", fileType=" + fileType + ", filePath=" + filePath + ", fileLevel="
				+ fileLevel + ", fileStatus=" + fileStatus + ", refType=" + refType + ", refNo=" + refNo + "]";
	}
	
}
