package com.fp.movie.model.vo;

public class MovieCategory {
	private int mvCategoryNo;
	private int mvNo;
	private int categoryNo;
	
	public MovieCategory() {
	}

	public MovieCategory(int mvCategoryNo, int mvNo, int categoryNo) {
		super();
		this.mvCategoryNo = mvCategoryNo;
		this.mvNo = mvNo;
		this.categoryNo = categoryNo;
	}

	public int getMvCategoryNo() {
		return mvCategoryNo;
	}

	public void setMvCategoryNo(int mvCategoryNo) {
		this.mvCategoryNo = mvCategoryNo;
	}

	public int getMvNo() {
		return mvNo;
	}

	public void setMvNo(int mvNo) {
		this.mvNo = mvNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "MovieCategory [mvCategoryNo=" + mvCategoryNo + ", mvNo=" + mvNo + ", categoryNo=" + categoryNo + "]";
	}
	
	
}
