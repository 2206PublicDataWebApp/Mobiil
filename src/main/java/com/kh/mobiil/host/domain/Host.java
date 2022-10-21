package com.kh.mobiil.host.domain;

import java.sql.Date;

public class Host {
	private String hostEmail; 
	private String hostPwd; 
	private String hostName; 
	private String hostPhone;
	private String companyName; 
	private String companyRegNum; 
	private String accountName; 
	private String accountHolder; 
	private String accountNumber; 
	private String regPhotoName;
	private String regPhotoRename;
	private String regPhotoPath;
	private Date enrollDate; 
	private Date updateDate; 
	private String hStatus;
	
	public Host() {}
	
	public Host(String hostEmail, String hostPwd) {
		super();
		this.hostEmail = hostEmail;
		this.hostPwd = hostPwd;
	}

	public String getHostEmail() {
		return hostEmail;
	}

	public void setHostEmail(String hostEmail) {
		this.hostEmail = hostEmail;
	}

	public String getHostPwd() {
		return hostPwd;
	}

	public void setHostPwd(String hostPwd) {
		this.hostPwd = hostPwd;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getHostPhone() {
		return hostPhone;
	}

	public void setHostPhone(String hostPhone) {
		this.hostPhone = hostPhone;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyRegNum() {
		return companyRegNum;
	}

	public void setCompanyRegNum(String companyRegNum) {
		this.companyRegNum = companyRegNum;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountHolder() {
		return accountHolder;
	}

	public void setAccountHolder(String accountHolder) {
		this.accountHolder = accountHolder;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getRegPhotoName() {
		return regPhotoName;
	}

	public void setRegPhotoName(String regPhotoName) {
		this.regPhotoName = regPhotoName;
	}

	public String getRegPhotoRename() {
		return regPhotoRename;
	}

	public void setRegPhotoRename(String regPhotoRename) {
		this.regPhotoRename = regPhotoRename;
	}

	public String getRegPhotoPath() {
		return regPhotoPath;
	}

	public void setRegPhotoPath(String regPhotoPath) {
		this.regPhotoPath = regPhotoPath;
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

	public String gethStatus() {
		return hStatus;
	}

	public void sethStatus(String hStatus) {
		this.hStatus = hStatus;
	}

	@Override
	public String toString() {
		return "Host [hostEmail=" + hostEmail + ", hostPwd=" + hostPwd + ", hostName=" + hostName + ", hostPhone="
				+ hostPhone + ", companyName=" + companyName + ", companyRegNum=" + companyRegNum + ", accountName="
				+ accountName + ", accountHolder=" + accountHolder + ", accountNumber=" + accountNumber
				+ ", regPhotoName=" + regPhotoName + ", regPhotoRename=" + regPhotoRename + ", regPhotoPath="
				+ regPhotoPath + ", enrollDate=" + enrollDate + ", updateDate=" + updateDate + ", hStatus=" + hStatus
				+ "]";
	}
	

}
