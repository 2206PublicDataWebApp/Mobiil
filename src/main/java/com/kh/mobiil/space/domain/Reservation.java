package com.kh.mobiil.space.domain;

import java.util.Date;

public class Reservation {

	private	int 	reservationNo; 		// 예약 번호
	private String  memberEmail;		// 멤버 이메일
	private String  hostEmail;			// 호스트 이메일
	private int 	spaceNo;			// 공간 순번
	private String  spaceName;			// 공간 이름
	private String  spaceAddress;		// 공간 주소
	private int 	price;				// 결제금액
	private Date 	reservationDate;	// 예약 날짜
	private String  memberName;			// 이름
	private String  memberPhone;		// 연락처
	private Date 	paymentDate;		// 결제 날짜
	private String  reservationStatus;	// 예약 상태
	private String  reviewStatus;		// 리뷰 상태
	private int revStart;
	private int revEnd;
	
	public int getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(int reservationNo) {
		this.reservationNo = reservationNo;
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
	public String getSpaceName() {
		return spaceName;
	}
	public void setSpaceName(String spaceName) {
		this.spaceName = spaceName;
	}
	public String getSpaceAddress() {
		return spaceAddress;
	}
	public void setSpaceAddress(String spaceAddress) {
		this.spaceAddress = spaceAddress;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
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
	public String getReservationStatus() {
		return reservationStatus;
	}
	public void setReservationStatus(String reservationStatus) {
		this.reservationStatus = reservationStatus;
	}
	public String getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
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
		return "Reservation [reservationNo=" + reservationNo + ", memberEmail=" + memberEmail + ", hostEmail="
				+ hostEmail + ", spaceNo=" + spaceNo + ", spaceName=" + spaceName + ", spaceAddress=" + spaceAddress
				+ ", price=" + price + ", reservationDate=" + reservationDate + ", memberName=" + memberName
				+ ", memberPhone=" + memberPhone + ", paymentDate=" + paymentDate + ", reservationStatus="
				+ reservationStatus + ", reviewStatus=" + reviewStatus + ", revStart=" + revStart + ", revEnd=" + revEnd
				+ "]";
	}
	

}
