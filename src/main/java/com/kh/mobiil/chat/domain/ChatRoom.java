package com.kh.mobiil.chat.domain;

public class ChatRoom {
	
	private int roomNo;
	private String createUser;
	private String withUser;
	private String createDate;
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getWithUser() {
		return withUser;
	}
	public void setWithUser(String withUser) {
		this.withUser = withUser;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	@Override
	public String toString() {
		return "ChatRoom [roomNo=" + roomNo + ", createUser=" + createUser + ", withUser=" + withUser + ", createDate="
				+ createDate + "]";
	}
	
	
	
}
