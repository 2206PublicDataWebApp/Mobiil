package com.kh.mobiil.banner.domain;

public class Banner {

	private int bannerNo;
	private String bannerPath;
	private String bannerFileName;
	private String bannerRename;
	private String bannerMsg;
	private String writer;
	public int getBannerNo() {
		return bannerNo;
	}
	public void setBannerNo(int bannerNo) {
		this.bannerNo = bannerNo;
	}
	public String getBannerPath() {
		return bannerPath;
	}
	public void setBannerPath(String bannerPath) {
		this.bannerPath = bannerPath;
	}
	public String getBannerFileName() {
		return bannerFileName;
	}
	public void setBannerFileName(String bannerFileName) {
		this.bannerFileName = bannerFileName;
	}
	public String getBannerRename() {
		return bannerRename;
	}
	public void setBannerRename(String bannerRename) {
		this.bannerRename = bannerRename;
	}
	public String getBannerMsg() {
		return bannerMsg;
	}
	public void setBannerMsg(String bannerMsg) {
		this.bannerMsg = bannerMsg;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "Banner [bannerNo=" + bannerNo + ", bannerPath=" + bannerPath + ", bannerFileName=" + bannerFileName
				+ ", bannerRename=" + bannerRename + ", bannerMsg=" + bannerMsg + ", writer=" + writer + "]";
	}
	
	 
	 
}
