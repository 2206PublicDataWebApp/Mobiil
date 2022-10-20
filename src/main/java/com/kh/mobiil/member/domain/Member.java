package com.kh.mobiil.member.domain;

import java.sql.Date;

public class Member {
	private String memberEmail;
	private String memberPwd; 
	private String memberName;
	private String memberNick;
	private String memberPhone;
	private Date enrollDate;
	private Date updateDate;
	private String mStatus; 
	private String manageStatus;
	
	public Member() {}
	
	public Member(String memberEmail, String memberPwd) {
		super();
		this.memberEmail = memberEmail;
		this.memberPwd = memberPwd;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public String getManageStatus() {
		return manageStatus;
	}

	public void setManageStatus(String manageStatus) {
		this.manageStatus = manageStatus;
	}

	@Override
	public String toString() {
		return "Member [memberEmail=" + memberEmail + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", memberNick=" + memberNick + ", memberPhone=" + memberPhone + ", enrollDate=" + enrollDate
				+ ", updateDate=" + updateDate + ", mStatus=" + mStatus + ", manageStatus=" + manageStatus + "]";
	}
	
	
}
