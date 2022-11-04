package com.kh.mobiil.space.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.space.domain.Heart;
import com.kh.mobiil.space.domain.HostReply;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;

public interface SpaceService {
	
	// 시간 유효성 체크 
	int checkTime(String start, String end, String reservDate);

	// 리스트 게시물 전체 개수
	int getTotalCount(String searchArea, String searchValue);
	
	int getPriceCount(Integer minNum, Integer maxNum);

	List<Space> printSpace(RowBounds rowBounds);

	Space printOneByNo(Integer spaceNo);

	List<SpaceImg> printImg(Integer spaceNo);

	List<Space> printAllByValue(String searchArea, String searchValue, RowBounds rowBounds);

	List<Space> printByArea(String searchArea, RowBounds rowBounds);

	List<Space> printByPrice(Integer minNum, Integer maxNum, RowBounds rowBounds);

	int registerReservation(Reservation rsv);

	// 지역 카운트
	int getAreaCount(String searchArea);

	// 모든 공간 리스트
	List<Space> printAllSpace();
	
	

	int checkHeart(Integer spaceNo, String memberEmail);

	int insertHeart(Heart heart);

	int deleteHeart(Heart heart);

	Reservation printRsv(String reservationNo);

	List<Review> printReview(Integer spaceNo);

	int insertReply(HostReply hostReply);

	List<HostReply> printReply(int reviewNo);

	List<ReviewImg> printReviewImg(Integer reviewNo);

	List<Space> printHeartDesc(RowBounds rowBounds);

	List<Space> printRivewDesc(RowBounds rowBounds);

	int updateReply(HostReply hostReply);


}
