package com.kh.mobiil.chat.domain;

public class ChatSearchResult { // 채팅중 검색결과 담는 vo
	
	private int spaceNo;
	private String spaceName;
	private int heartCount;
	public int getSpaceNo() {
		return spaceNo;
	}
	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}
	public int getHeartCount() {
		return heartCount;
	}
	public void setHeartCount(int heartCount) {
		this.heartCount = heartCount;
	}
	
	
	public String getSapceName() {
		return spaceName;
	}
	public void setSapceName(String sapceName) {
		this.spaceName = sapceName;
	}
	@Override
	public String toString() {
		return "ChatSearchResult [spaceNo=" + spaceNo + ", spaceName=" + spaceName + ", heartCount=" + heartCount + "]";
	}

	
	

}
