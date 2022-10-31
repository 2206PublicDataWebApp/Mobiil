package com.kh.mobiil.space.domain;

public class Heart {

	private String memberEmail;
	private int spaceNo;
	private String spaceName;
	private String spaceFileRename;
	
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public int getSpaceNo() {
		return spaceNo;
	}
	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}
	public String getSpaceName() {
		return spaceName;
	}
	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}
	public String getSpaceFileRename() {
		return spaceFileRename;
	}
	public void setSpaceFileRename(String spaceFileRename) {
		this.spaceFileRename = spaceFileRename;
	}
	@Override
	public String toString() {
		return "Heart [memberEmail=" + memberEmail + ", spaceNo=" + spaceNo + ", spaceName=" + spaceName
				+ ", spaceFileRename=" + spaceFileRename + "]";
	}
	
	
	
}
