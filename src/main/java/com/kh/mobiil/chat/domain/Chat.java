package com.kh.mobiil.chat.domain;

import java.sql.Timestamp;

public class Chat { // 챗메시지 내용
	
	private int chatNo;
	private int refRoomNo;
	private String sender;
	private String chat;
	private Timestamp createDate;
	private String read_chk;
	
	public int getChatNo() {
		return chatNo;
	}
	public void setChatNo(int chatNo) {
		this.chatNo = chatNo;
	}
	public int getRefRoomNo() {
		return refRoomNo;
	}
	public void setRefRoomNo(int refRoomNo) {
		this.refRoomNo = refRoomNo;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getChat() {
		return chat;
	}
	public void setChat(String chat) {
		this.chat = chat;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public String getRead_chk() {
		return read_chk;
	}
	public void setRead_chk(String read_chk) {
		this.read_chk = read_chk;
	}
	@Override
	public String toString() {
		return "Chat [chatNo=" + chatNo + ", refRoomNo=" + refRoomNo + ", sender=" + sender + ", chat=" + chat
				+ ", createDate=" + createDate + ", read_chk=" + read_chk + "]";
	}
	
	
	
}
