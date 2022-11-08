package com.kh.mobiil.space.domain;

import java.sql.Date;

public class Space {

		private int    spaceNo;		  	// 공간 순번
		private String spaceName;		// 공간 이름
		private String address1;		// 공간 주소
		private String address2;		// 공간 주소
		private String address3;		// 공간 주소
		private String address4;		// 공간 주소
		private String spaceComent;		// 공간 소개
		private String spaceArea;		// 공간 지역
		private String spacePrice;		// 공간 가격
		private String approval;  		// 공간 승인 여부
		private Date   approvalDate;	// 공간 승인일
		private String spaceStatus;		// 공간 등록여부
		private String hostEmail;		// 호스트 이메일
		private String rejectMailChk;	// 승인 거부 메일
		
		// spaceFileRename 한 개 가져오기 위해서 생성
		private SpaceImg spaceImg;

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

		public String getAddress1() {
			return address1;
		}

		public void setAddress1(String address1) {
			this.address1 = address1;
		}

		public String getAddress2() {
			return address2;
		}

		public void setAddress2(String address2) {
			this.address2 = address2;
		}

		public String getAddress3() {
			return address3;
		}

		public void setAddress3(String address3) {
			this.address3 = address3;
		}

		public String getAddress4() {
			return address4;
		}

		public void setAddress4(String address4) {
			this.address4 = address4;
		}

		public String getSpaceComent() {
			return spaceComent;
		}

		public void setSpaceComent(String spaceComent) {
			this.spaceComent = spaceComent;
		}

		public String getSpaceArea() {
			return spaceArea;
		}

		public void setSpaceArea(String spaceArea) {
			this.spaceArea = spaceArea;
		}

		public String getSpacePrice() {
			return spacePrice;
		}

		public void setSpacePrice(String spacePrice) {
			this.spacePrice = spacePrice;
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

		public String getSpaceStatus() {
			return spaceStatus;
		}

		public void setSpaceStatus(String spaceStatus) {
			this.spaceStatus = spaceStatus;
		}

		public String getHostEmail() {
			return hostEmail;
		}

		public void setHostEmail(String hostEmail) {
			this.hostEmail = hostEmail;
		}

		public String getRejectMailChk() {
			return rejectMailChk;
		}

		public void setRejectMailChk(String rejectMailChk) {
			this.rejectMailChk = rejectMailChk;
		}

		public SpaceImg getSpaceImg() {
			return spaceImg;
		}

		public void setSpaceImg(SpaceImg spaceImg) {
			this.spaceImg = spaceImg;
		}

		@Override
		public String toString() {
			return "Space [spaceNo=" + spaceNo + ", spaceName=" + spaceName + ", address1=" + address1 + ", address2="
					+ address2 + ", address3=" + address3 + ", address4=" + address4 + ", spaceComent=" + spaceComent
					+ ", spaceArea=" + spaceArea + ", spacePrice=" + spacePrice + ", approval=" + approval
					+ ", approvalDate=" + approvalDate + ", spaceStatus=" + spaceStatus + ", hostEmail=" + hostEmail
					+ ", rejectMailChk=" + rejectMailChk + ", spaceImg=" + spaceImg + ", getSpaceNo()=" + getSpaceNo()
					+ ", getSpaceName()=" + getSpaceName() + ", getAddress1()=" + getAddress1() + ", getAddress2()="
					+ getAddress2() + ", getAddress3()=" + getAddress3() + ", getAddress4()=" + getAddress4()
					+ ", getSpaceComent()=" + getSpaceComent() + ", getSpaceArea()=" + getSpaceArea()
					+ ", getSpacePrice()=" + getSpacePrice() + ", getApproval()=" + getApproval()
					+ ", getApprovalDate()=" + getApprovalDate() + ", getSpaceStatus()=" + getSpaceStatus()
					+ ", getHostEmail()=" + getHostEmail() + ", getRejectMailChk()=" + getRejectMailChk()
					+ ", getSpaceImg()=" + getSpaceImg() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
					+ ", toString()=" + super.toString() + "]";
		}
}