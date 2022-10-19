package com.kh.mobiil.space.domain;

public class SpaceImg {
	private int spaceImgNo;
	private int spaceNo;
	private String spaceFileName;
	private String spaceFileRename;
	private String spaceFilePath;
	
	public int getSpaceImgNo() {
		return spaceImgNo;
	}
	public void setSpaceImgNo(int spaceImgNo) {
		this.spaceImgNo = spaceImgNo;
	}
	public int getSpaceNo() {
		return spaceNo;
	}
	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}
	public String getSpaceFileName() {
		return spaceFileName;
	}
	public void setSpaceFileName(String spaceFileName) {
		this.spaceFileName = spaceFileName;
	}
	public String getSpaceFileRename() {
		return spaceFileRename;
	}
	public void setSpaceFileRename(String spaceFileRename) {
		this.spaceFileRename = spaceFileRename;
	}
	public String getSpaceFilePath() {
		return spaceFilePath;
	}
	public void setSpaceFilePath(String spaceFilePath) {
		this.spaceFilePath = spaceFilePath;
	}
	
	@Override
	public String toString() {
		return "SpaceImg [spaceImgNo=" + spaceImgNo + ", spaceNo=" + spaceNo + ", spaceFileName=" + spaceFileName
				+ ", spaceFileRename=" + spaceFileRename + ", spaceFilePath=" + spaceFilePath + "]";
	}
	
}
