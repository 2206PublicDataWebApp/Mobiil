package com.kh.mobiil.space.domain;

import java.sql.Date;

public class HostReply {
	private int replyNo;
	private int reviewNo;
	private String hostEmail;
	private String replyWriter;
	private String replyContents;
	private Date createDate;
	private Date updateDate;
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getHostEmail() {
		return hostEmail;
	}
	public void setHostEmail(String hostEmail) {
		this.hostEmail = hostEmail;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public String getReplyContents() {
		return replyContents;
	}
	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	@Override
	public String toString() {
		return "HostReply [replyNo=" + replyNo + ", reviewNo=" + reviewNo + ", hostEmail=" + hostEmail
				+ ", replyWriter=" + replyWriter + ", replyContents=" + replyContents + ", createDate=" + createDate
				+ ", updateDate=" + updateDate + "]";
	}
	

}
