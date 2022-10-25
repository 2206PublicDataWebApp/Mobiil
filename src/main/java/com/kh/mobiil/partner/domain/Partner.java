package com.kh.mobiil.partner.domain;

import java.util.Date;

public class Partner {
	private int partnerNo;
	private String memberNick;
	private String memberEmail;
	private String area;
	private String instrument;
	private String title;
	private String contents;
	private String profileFileName;
	private String profileRename;
	private String profilePath;
	private String approval;
	private Date approvalDate;
	private String rejectMailChk;
	public int getPartnerNo() {
		return partnerNo;
	}
	public void setPartnerNo(int partnerNo) {
		this.partnerNo = partnerNo;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getInstrument() {
		return instrument;
	}
	public void setInstrument(String instrument) {
		this.instrument = instrument;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getProfileFileName() {
		return profileFileName;
	}
	public void setProfileFileName(String profileFileName) {
		this.profileFileName = profileFileName;
	}
	public String getProfileRename() {
		return profileRename;
	}
	public void setProfileRename(String profileRename) {
		this.profileRename = profileRename;
	}
	public String getProfilePath() {
		return profilePath;
	}
	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	public Date getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}
	public String getRejectMailChk() {
		return rejectMailChk;
	}
	public void setRejectMailChk(String rejectMailChk) {
		this.rejectMailChk = rejectMailChk;
	}
	@Override
	public String toString() {
		return "Partner [partnerNo=" + partnerNo + ", memberNick=" + memberNick + ", memberEmail=" + memberEmail
				+ ", area=" + area + ", instrument=" + instrument + ", title=" + title + ", contents=" + contents
				+ ", profileFileName=" + profileFileName + ", profileRename=" + profileRename + ", profilePath="
				+ profilePath + ", approval=" + approval + ", approvalDate=" + approvalDate + ", rejectMailChk="
				+ rejectMailChk + "]";
	}
	
	
	
	



}
