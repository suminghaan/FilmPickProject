package com.fp.movie.model.vo;

public class Category {
	
	private int categoryNo;
	private String categoryName;
	private String categoryDate;
	
	public Category() {
	}

	public Category(int categoryNo, String categoryName, String categoryDate) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
		this.categoryDate = categoryDate;
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

	@Override
	public String toString() {
		return "Category [categoryNo=" + categoryNo + ", categoryName=" + categoryName + ", categoryDate="
				+ categoryDate + "]";
	}
	
	
}
