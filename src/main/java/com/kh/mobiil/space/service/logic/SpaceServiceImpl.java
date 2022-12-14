package com.kh.mobiil.space.service.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.space.domain.Heart;
import com.kh.mobiil.space.domain.HostReply;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;
import com.kh.mobiil.space.domain.Search;
import com.kh.mobiil.space.service.SpaceService;
import com.kh.mobiil.space.store.SpaceStore;

@Service
public class SpaceServiceImpl implements SpaceService{

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private SpaceStore sStore;

	// 리스트 게시물 전체 개수
	@Override
	public int getTotalCount(Search search) {
		int totalCount = sStore.selectTotalCount(session, search);
		return totalCount;
	}

	// 가격에 대한 게시물 개수
	@Override
	public int getPriceCount(Search search) {
		int totalCount = sStore.selectPriceCount(session, search);
		return totalCount;
	}

	// 검색에 대한 게시물 개수
	@Override
	public int getSearchCount(Search search) {
		int totalCount = sStore.selectSearchCount(session, search);
		return totalCount;
	}

	// 지역에 대한 게시물 개수
	@Override
	public int getAreaCount(String area) {
		int result = sStore.selectAreaCount(area, session);
		return result;
	}

	// 조건X 공간 리스트 출력
	@Override
	public List<Space> printSpace(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectSpace(session, search, rowBounds);
		return sList;
	}

	// 가격+최신순 리스트 출력
	@Override
	public List<Space> printDateDescByPrice(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectDateDescByPrice(session, search, rowBounds);
		return sList;
	}

	// 지역+최신순 리스트 출력
	@Override
	public List<Space> printDateDescByArea(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectDateDescByArea(session, search, rowBounds);
		return sList;
	}

	// 검색+최신순 리스트 출력
	@Override
	public List<Space> printDateDescByValue(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectDateDescByValue(session, search, rowBounds);
		return sList;
	}

	// 찜많은순 전체 리스트 출력
	@Override
	public List<Space> printHeartDesc(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectHeartDesc(session, search, rowBounds);
		return sList;
	}

	// 가격+찜많은순 리스트 출력
	@Override
	public List<Space> printHeartDescByPrice(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectHeartDescByPrice(session, search, rowBounds);
		return sList;
	}

	// 지역+찜많은순 리스트 출력
	@Override
	public List<Space> printHeartDescByArea(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectHeartDescByArea(session, search, rowBounds);
		return sList;
	}

	// 검색+찜많은순 리스트 출력
	@Override
	public List<Space> printHeartDescByValue(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectHeartDescByValue(session, search, rowBounds);
		return sList;
	}

	// 리뷰많은순 전체 리스트 출력
	@Override
	public List<Space> printRivewDesc(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectRivewDesc(session, search, rowBounds);
		return sList;
	}

	// 가격+리뷰많은순 리스트 출력
	@Override
	public List<Space> printReviewDescByPrice(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectReviewDescByPrice(session, search, rowBounds);
		return sList;
	}

	// 지역+리뷰많은순 리스트 출력
	@Override
	public List<Space> printRivewDescByArea(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectReviewDescByArea(session, search, rowBounds);
		return sList;
	}

	// 검색+리뷰많은순 리스트 출력
	@Override
	public List<Space> printRivewDescByValue(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectRivewDescByValue(session, search, rowBounds);
		return sList;
	}

	// 검색시 리스트 출력
	@Override
	public List<Space> printAllByValue(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectAllByValue(session, search, rowBounds);
		return sList;
	}

	// 지역 정렬시 게시물 개수
	@Override
	public int getByAreaCount(Search search) {
		int result = sStore.selectByAreaCount(search, session);
		return result;
	}

	// 지역 리스트 출력
	@Override
	public List<Space> printByArea(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectByArea(session, search, rowBounds);
		return sList;
	}

	// 가격 리스트 출력
	@Override
	public List<Space> printByPrice(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectByPrice(session, search, rowBounds);
		return sList;
	}

	// 공간 상세 조회
	@Override
	public Space printOneByNo(Integer spaceNo) {
		Space space = sStore.selectOneByNo(session, spaceNo);
		return space;
	}

	// 공간 이미지 조회
	@Override
	public List<SpaceImg> printImg(Integer spaceNo) {
		List<SpaceImg> iList = sStore.selectImg(session, spaceNo);
		return iList;
	}

	// 리뷰 조회
	@Override
	public List<Review> printReview(Integer spaceNo) {
		List<Review> rList = sStore.selectReview(session, spaceNo);
		return rList;
	}

	// 리뷰 이미지 조회
	@Override
	public List<ReviewImg> printReviewImg(Integer reviewNo) {
		List<ReviewImg> riList = sStore.selectReviewImg(session, reviewNo);
		return riList;
	}

	// 호스트 댓글 조회
	@Override
	public List<HostReply> printReply(int reviewNo) {
		List<HostReply> hrList = sStore.selectReply(session, reviewNo);
		return hrList;
	}

	// 호스트 댓글 등록
	@Override
	public int insertReply(HostReply hostReply) {
		int result = sStore.insertReply(session, hostReply);
		return result;
	}

	// 호스트 댓글 수정
	@Override
	public int updateReply(HostReply hostReply) {
		int result = sStore.updateReply(session, hostReply);
		return result;
	}

	// 호스트 댓글 삭제
	@Override
	public int deleteReply(Integer replyNo) {
		int result = sStore.deleteReply(session, replyNo);
		return result;
	}

	// 찜 여부 체크
	@Override
	public int checkHeart(Integer spaceNo, String memberEmail) {
		int result = sStore.checkHeart(session, spaceNo, memberEmail);
		return result;
	}

	// 찜 추가
	@Override
	public int insertHeart(Heart heart) {
		int result = sStore.insertHeart(session, heart);
		return result;
	}

	// 찜 삭제
	@Override
	public int deleteHeart(Heart heart) {
		int result = sStore.deleteHeart(session, heart);
		return result;
	}

	// 날짜 및 시간 유효성 검사
	@Override
	public int checkTime(String start, String end, String reservDate) {
		int result = sStore.checkTime(session, start, end, reservDate);
		return result;
	}

	// 예약 정보 저장
	@Override
	public int registerReservation(Reservation rsv) {
		int result = sStore.insertReservation(session, rsv);
		return result;
	}
	
	// 예약 정보 조회
	@Override
	public Reservation printRsv(String reservationNo) {
		Reservation rsv = sStore.selectRsv(session, reservationNo);
		return rsv;
	}

	// 지도 모든 공간 리스트
	@Override
	public List<Space> printAllSpace() {
		List<Space> sList = sStore.selectAllSpace(session);
		return sList;
	}
	
}
