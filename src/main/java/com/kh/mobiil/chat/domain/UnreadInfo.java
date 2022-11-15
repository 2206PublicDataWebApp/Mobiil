package com.kh.mobiil.chat.domain;

public class UnreadInfo { // 읽음표시할때 사용하는 vo
	private String memberNick;
	private int refRoomNo;
	
	public UnreadInfo(String memberNick, int refRoomNo) {
		super();
		this.memberNick = memberNick;
		this.refRoomNo = refRoomNo;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public int getRefRoomNo() {
		return refRoomNo;
	}
	public void setRefRoomNo(int refRoomNo) {
		this.refRoomNo = refRoomNo;
	}
	@Override
	public String toString() {
		return "UnreadInfo [memberNick=" + memberNick + ", refRoomNo=" + refRoomNo + "]";
	}
	
	

}
