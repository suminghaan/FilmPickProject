package com.fp.movie.model.vo;

import java.sql.Date;

public class SearchFilter {
	
	private String currentScreening; // 현재상영중인
	private String categoryName; // 장르
	private String viewRatiog; // 등급
	private String mvOpenDate; // 연도
	private String mvNation; // 국가
	private String orderBy; // 필터
	
	
	public SearchFilter() {
		
	}


	public SearchFilter(String currentScreening, String categoryName, String viewRatiog, String mvOpenDate,
			String mvNation, String orderBy) {
		super();
		this.currentScreening = currentScreening;
		this.categoryName = categoryName;
		this.viewRatiog = viewRatiog;
		this.mvOpenDate = mvOpenDate;
		this.mvNation = mvNation;
		this.orderBy = orderBy;
	}


	public String getCurrentScreening() {
		return currentScreening;
	}


	public void setCurrentScreening(String currentScreening) {
		this.currentScreening = currentScreening;
	}


	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public String getViewRatiog() {
		return viewRatiog;
	}


	public void setViewRatiog(String viewRatiog) {
		this.viewRatiog = viewRatiog;
	}


	public String getMvOpenDate() {
		return mvOpenDate;
	}


	public void setMvOpenDate(String mvOpenDate) {
		this.mvOpenDate = mvOpenDate;
	}


	public String getMvNation() {
		return mvNation;
	}


	public void setMvNation(String mvNation) {
		this.mvNation = mvNation;
	}


	public String getOrderBy() {
		return orderBy;
	}


	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}


	@Override
	public String toString() {
		return "SearchFilter [currentScreening=" + currentScreening + ", categoryName=" + categoryName + ", viewRatiog="
				+ viewRatiog + ", mvOpenDate=" + mvOpenDate + ", mvNation=" + mvNation + ", orderBy=" + orderBy + "]";
	}

	
	
	
	
	
	
	
}
