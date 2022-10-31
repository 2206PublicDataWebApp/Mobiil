package com.kh.mobiil.partner.domain;

public class SearchPartner {
	private String searchByWho; // admin or service
	private String searchArea; // 지역
	private String searchCondition; // 제목 or 내용 or 악기
	private String searchValue; // 검색어
	
	
	public SearchPartner(String searchByWho, String searchArea, String searchCondition, String searchValue) {
		super();
		this.searchByWho = searchByWho;
		this.searchArea = searchArea;
		this.searchCondition = searchCondition;
		this.searchValue = searchValue;
	}
	
	
	
	public SearchPartner(String searchByWho) { // 그냥 리스트 뽑을 때 사용(어드민에서 검색 or 서비스에서 검색)
		super();
		this.searchByWho = searchByWho;
	}



	public String getSearchByWho() {
		return searchByWho;
	}



	public void setSearchByWho(String searchByWho) {
		this.searchByWho = searchByWho;
	}



	public String getSearchArea() {
		return searchArea;
	}



	public void setSearchArea(String searchArea) {
		this.searchArea = searchArea;
	}



	public String getSearchCondition() {
		return searchCondition;
	}



	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}



	public String getSearchValue() {
		return searchValue;
	}



	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}



	
	
	
}
