package com.kh.mobiil.space.domain;

public class Search {
	private String heart;
	private String review;
	private String searchArea;
	private String searchValue;
	private int minNum;
	private int maxNum;
	
	
	public Search() {}
	
	
	public Search(int minNum, int maxNum) {
		super();
		this.minNum = minNum;
		this.maxNum = maxNum;
	}


	public Search(String searchArea) {
		super();
		this.searchArea = searchArea;
	}


	public Search(String searchArea, String searchValue) {
		super();
		this.searchArea = searchArea;
		this.searchValue = searchValue;
	}


	public Search(String heart, String review, String searchArea, String searchValue, int minNum, int maxNum) {
		super();
		this.heart = heart;
		this.review = review;
		this.searchArea = searchArea;
		this.searchValue = searchValue;
		this.minNum = minNum;
		this.maxNum = maxNum;
	}
	public String getHeart() {
		return heart;
	}
	public void setHeart(String heart) {
		this.heart = heart;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getSearchArea() {
		return searchArea;
	}
	public void setSearchArea(String searchArea) {
		this.searchArea = searchArea;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public int getMinNum() {
		return minNum;
	}
	public void setMinNum(int minNum) {
		this.minNum = minNum;
	}
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	
	@Override
	public String toString() {
		return "Search [heart=" + heart + ", review=" + review + ", searchArea=" + searchArea + ", searchValue="
				+ searchValue + ", minNum=" + minNum + ", maxNum=" + maxNum + "]";
	}
	
}