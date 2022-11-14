package com.kh.mobiil.space.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.space.domain.Heart;
import com.kh.mobiil.space.domain.HostReply;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Search;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;

public interface SpaceService {
	
	int getTotalCount(Search search); // 리스트 게시물 전체 개수
	
	int getPriceCount(Search search); // 가격에 대한 게시물 개수

	int getSearchCount(Search search); // 검색에 대한 게시물 개수

	int getAreaCount(String area); // 지역에 대한 게시물 개수

	// 조건X 공간 리스트 출력
	List<Space> printSpace(Search search, RowBounds rowBounds);

	// 가격+최신순 리스트 출력
	List<Space> printDateDescByPrice(Search search, RowBounds rowBounds);

	// 지역+최신순 리스트 출력
	List<Space> printDateDescByArea(Search search, RowBounds rowBounds);

	// 검색+최신순 리스트 출력
	List<Space> printDateDescByValue(Search search, RowBounds rowBounds);

	// 찜많은순 전체 리스트 출력
	List<Space> printHeartDesc(Search search, RowBounds rowBounds);

	// 가격+찜많은순 리스트 출력
	List<Space> printHeartDescByPrice(Search search, RowBounds rowBounds);

	// 지역+찜많은순 리스트 출력
	List<Space> printHeartDescByArea(Search search, RowBounds rowBounds);

	// 검색+찜많은순 리스트 출력
	List<Space> printHeartDescByValue(Search search, RowBounds rowBounds);

	// 리뷰많은순 전체 리스트 출력
	List<Space> printRivewDesc(Search search, RowBounds rowBounds);

	// 가격+리뷰많은순 리스트 출력
	List<Space> printReviewDescByPrice(Search search, RowBounds rowBounds);

	// 지역+리뷰많은순 리스트 출력
	List<Space> printRivewDescByArea(Search search, RowBounds rowBounds);

	// 검색+리뷰많은순 리스트 출력
	List<Space> printRivewDescByValue(Search search, RowBounds rowBounds);

	// 검색시 리스트 출력
	List<Space> printAllByValue(Search search, RowBounds rowBounds);

	// 지역 정렬시 게시물 개수
	int getByAreaCount(Search search);

	// 지역 리스트 출력
	List<Space> printByArea(Search search, RowBounds rowBounds);

	// 가격 리스트 출력
	List<Space> printByPrice(Search search, RowBounds rowBounds);

	// 공간 상세 조회
	Space printOneByNo(Integer spaceNo);

	// 공간 이미지 조회
	List<SpaceImg> printImg(Integer spaceNo);

	// 리뷰 조회
	List<Review> printReview(Integer spaceNo);

	// 리뷰 이미지 조회
	List<ReviewImg> printReviewImg(Integer reviewNo);

	// 호스트 댓글 조회
	List<HostReply> printReply(int reviewNo);

	// 호스트 댓글 등록
	int insertReply(HostReply hostReply);

	// 호스트 댓글 수정
	int updateReply(HostReply hostReply);

	// 호스트 댓글 삭제
	int deleteReply(Integer replyNo);

	// 찜 여부 체크
	int checkHeart(Integer spaceNo, String memberEmail);

	// 찜 추가
	int insertHeart(Heart heart);

	// 찜 삭제
	int deleteHeart(Heart heart);

	// 시간 유효성 체크 
	int checkTime(String start, String end, String reservDate);

	// 예약 정보 저장
	int registerReservation(Reservation rsv);

	// 예약 정보 조회
	Reservation printRsv(String reservationNo);

	// 채팅 모든 공간 리스트
	List<Space> printAllSpace();

}
