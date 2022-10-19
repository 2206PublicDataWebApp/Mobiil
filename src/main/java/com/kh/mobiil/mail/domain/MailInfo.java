package com.kh.mobiil.mail.domain;


public class MailInfo {
	
	private String recipient; // 수신자
	private String subject;  // 메일 제목
	private String text;  // 메일 본문
	
	
	public String getRecipient() {
		return recipient;
	}
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "MailInfo [recipient=" + recipient + ", subject=" + subject + ", text=" + text + "]";
	}

	

}
