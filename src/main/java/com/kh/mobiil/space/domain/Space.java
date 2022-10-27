package com.kh.mobiil.space.domain;

import java.sql.Date;

public class Space {

		private int    spaceNo;		  	// 공간 순번
		private String spaceName;		// 공간 이름
		private String address;			// 공간 주소
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

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
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
			return "Space [spaceNo=" + spaceNo + ", spaceName=" + spaceName + ", address=" + address + ", spaceComent="
					+ spaceComent + ", spaceArea=" + spaceArea + ", spacePrice=" + spacePrice + ", approval=" + approval
					+ ", approvalDate=" + approvalDate + ", spaceStatus=" + spaceStatus + ", hostEmail=" + hostEmail
					+ ", rejectMailChk=" + rejectMailChk + ", spaceImg=" + spaceImg + "]";
		}
		
}
