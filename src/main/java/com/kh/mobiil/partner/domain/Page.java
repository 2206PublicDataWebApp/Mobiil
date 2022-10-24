package com.kh.mobiil.partner.domain;


	
	public class Page{
		
		private int currentPage;
		private int totalCount;
		private int naviLimit;
		private int maxPage;
		private int startNavi;
		private int endNavi;
		private int boardLimit;
		private int offset;
		
		
		public Page(int currentPage, int totalCount, int naviLimit, int boardLimit) {
			// 현재페이지, 검색조건 토탈카운트, 내비리밋, 보드리밋 넘겨주면 계산해서 각 변수에 저장!
			super();
			this.currentPage = currentPage;
			this.totalCount = totalCount;
			this.naviLimit = naviLimit;
			this.boardLimit = boardLimit;
			
			maxPage = (int) ((double) totalCount / boardLimit + 0.9);
			startNavi = ((int) ((double) currentPage / naviLimit + 0.9) - 1) * naviLimit + 1;
			endNavi = startNavi + naviLimit - 1;
			offset = (currentPage -1)*boardLimit;
			
			if (maxPage < endNavi) {
				endNavi = maxPage;
			}
		}
		
		
		public int getCurrentPage() {
			return currentPage;
		}
		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}
		public int getTotalCount() {
			return totalCount;
		}
		public void setTotalCount(int totalCount) {
			this.totalCount = totalCount;
		}
		public int getNaviLimit() {
			return naviLimit;
		}
		public void setNaviLimit(int naviLimit) {
			this.naviLimit = naviLimit;
		}
		public int getMaxPage() {
			return maxPage;
		}
		public void setMaxPage(int maxPage) {
			this.maxPage = maxPage;
		}
		public int getStartNavi() {
			return startNavi;
		}
		public void setStartNavi(int startNavi) {
			this.startNavi = startNavi;
		}
		public int getEndNavi() {
			return endNavi;
		}
		public void setEndNavi(int endNavi) {
			this.endNavi = endNavi;
		}
		public int getBoardLimit() {
			return boardLimit;
		}
		public void setBoardLimit(int boardLimit) {
			this.boardLimit = boardLimit;
		}
		public int getOffset() {
			return offset;
		}
		public void setOffset(int offset) {
			this.offset = offset;
		}
	}

