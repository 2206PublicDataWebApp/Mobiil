package com.kh.mobiil.review.domain;

public class ReviewImg {
	private int reviewImgNo;
	private int reviewNo;
	private String reviewFileName;
	private String reviewFileRename;
	private String reviewFilePath;
	
	public int getReviewImgNo() {
		return reviewImgNo;
	}
	public void setReviewImgNo(int reviewImgNo) {
		this.reviewImgNo = reviewImgNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewFileName() {
		return reviewFileName;
	}
	public void setReviewFileName(String reviewFileName) {
		this.reviewFileName = reviewFileName;
	}
	public String getReviewFileRename() {
		return reviewFileRename;
	}
	public void setReviewFileRename(String reviewFileRename) {
		this.reviewFileRename = reviewFileRename;
	}
	public String getReviewFilePath() {
		return reviewFilePath;
	}
	public void setReviewFilePath(String reviewFilePath) {
		this.reviewFilePath = reviewFilePath;
	}
	@Override
	public String toString() {
		return "ReviewImg [reviewImgNo=" + reviewImgNo + ", reviewNo=" + reviewNo + ", reviewFileName="
				+ reviewFileName + ", reviewFileRename=" + reviewFileRename + ", reviewFilePath=" + reviewFilePath
				+ "]";
	}
	
	
}
