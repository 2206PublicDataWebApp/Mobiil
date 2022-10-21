package com.kh.mobiil.space.domain;

import java.sql.Date;

public class Reservation {
	
	private int reservNo;
	private String memberEmail;
	private String hostEmail;
	private int spaceNo;
	private String spaceTitle;
	private String spaceAddress;
	private String price;
	private Date reservDate;
	private String memberName;
	private String memberPhone;
	private Date paymentDate;
	private int revStart;
	private int revEnd;
	
	public int getReservNo() {
		return reservNo;
	}
	public void setReservNo(int reservNo) {
		this.reservNo = reservNo;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getHostEmail() {
		return hostEmail;
	}
	public void setHostEmail(String hostEmail) {
		this.hostEmail = hostEmail;
	}
	public int getSpaceNo() {
		return spaceNo;
	}
	public void setSpaceNo(int spaceNo) {
		this.spaceNo = spaceNo;
	}
	public String getSpaceTitle() {
		return spaceTitle;
	}
	public void setSpaceTitle(String spaceTitle) {
		this.spaceTitle = spaceTitle;
	}
	public String getSpaceAddress() {
		return spaceAddress;
	}
	public void setSpaceAddress(String spaceAddress) {
		this.spaceAddress = spaceAddress;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Date getReservDate() {
		return reservDate;
	}
	public void setReservDate(Date reservDate) {
		this.reservDate = reservDate;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public int getRevStart() {
		return revStart;
	}
	public void setRevStart(int revStart) {
		this.revStart = revStart;
	}
	public int getRevEnd() {
		return revEnd;
	}
	public void setRevEnd(int revEnd) {
		this.revEnd = revEnd;
	}
	
	@Override
	public String toString() {
		return "Reservation [reservNo=" + reservNo + ", memberEmail=" + memberEmail + ", hostEmail=" + hostEmail
				+ ", spaceNo=" + spaceNo + ", spaceTitle=" + spaceTitle + ", spaceAddress=" + spaceAddress + ", price="
				+ price + ", reservDate=" + reservDate + ", memberName=" + memberName + ", memberPhone=" + memberPhone
				+ ", paymentDate=" + paymentDate + ", revStart=" + revStart + ", revEnd=" + revEnd + "]";
	}
	
	
}
