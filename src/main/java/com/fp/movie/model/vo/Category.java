package com.fp.movie.model.vo;

public class Category {
	
	private int categoryNo; // 장르번호
	private String categoryName;
	private String categoryDate;
	private String categoryStatus;
	
	private int noMovieCNo; //없는영화장르번호[호용]
	private int noMovieNo; // 없는영화신청번호[호용]
	
	// 없는영화 수정때 필요한 매개변수생성자 [호용]
	public Category(int categoryNo, String categoryName, String categoryDate, String categoryStatus, int noMovieCNo,
			int noMovieNo) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.categoryDate = categoryDate;
		this.categoryStatus = categoryStatus;
		this.noMovieCNo = noMovieCNo;
		this.noMovieNo = noMovieNo;
	}
	
	
	public Category(int categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}


	// 없는영화 수정때 필요한 게터세터 [호용]
	public int getNoMovieCNo() {
		return noMovieCNo;
	}


	// 없는영화 수정때 필요한 게터세터 [호용]
	public void setNoMovieCNo(int noMovieCNo) {
		this.noMovieCNo = noMovieCNo;
	}


	// 없는영화 수정때 필요한 게터세터 [호용]
	public int getNoMovieNo() {
		return noMovieNo;
	}

	
	// 없는영화 수정때 필요한 게터세터 [호용]
	public void setNoMovieNo(int noMovieNo) {
		this.noMovieNo = noMovieNo;
	}



	public Category() {
	}

	public Category(int categoryNo, String categoryName, String categoryDate, String categoryStatus) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.categoryDate = categoryDate;
		this.categoryStatus = categoryStatus;
	}
	
	// (관리자) 카테고리 관리 탭 조회 [수민]
	
	public Category(int categoryNo, String categoryName, String categoryStatus) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.categoryStatus = categoryStatus;
	}

	
	public int getCategoryNo() {
		return categoryNo;
	}

	
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryDate() {
		return categoryDate;
	}

	public void setCategoryDate(String categoryDate) {
		this.categoryDate = categoryDate;
	}

	public String getCategoryStatus() {
		return categoryStatus;
	}

	public void setCategoryStatus(String categoryStatus) {
		this.categoryStatus = categoryStatus;
	}

	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", categoryDate="
				+ categoryDate + ", categoryStatus=" + categoryStatus + ", noMovieCNo=" + noMovieCNo + "]";
	}

	
	
	
}
