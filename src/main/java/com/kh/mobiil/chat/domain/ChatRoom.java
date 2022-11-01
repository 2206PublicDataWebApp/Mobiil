package com.kh.mobiil.chat.domain;

import java.sql.Date;

public class ChatRoom {
	
	private int roomNo;
	private String createUser;
	private String withUser;
	private String createDate;
	private int unReadCount;
	private String roomStatus; // 활성화시 Y 비활성화 N
	private Date disableDate; // 비활성화 일
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
	
	
	public int getUnReadCount() {
		return unReadCount;
	}
	public void setUnReadCount(int unReadCount) {
		this.unReadCount = unReadCount;
	}
	
	
	public String getRoomStatus() {
		return roomStatus;
	}
	public void setRoomStatus(String roomStatus) {
		this.roomStatus = roomStatus;
	}
	
	public Date getDisableDate() {
		return disableDate;
	}
	public void setDisableDate(Date disableDate) {
		this.disableDate = disableDate;
	}
	@Override
	public String toString() {
		return "ChatRoom [roomNo=" + roomNo + ", createUser=" + createUser + ", withUser=" + withUser + ", createDate="
				+ createDate + ", unReadCount=" + unReadCount + ", roomStatus=" + roomStatus + ", disableDate="
				+ disableDate + "]";
	}
	
	
	
	
	
	
	
}
