package com.kh.mobiil.review.service;

import java.util.List;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;

public interface ReviewService {

	public int registerReview(Review review);
	
	public int updateRevStatus(Reservation reservation); // 리뷰 등록 시 reservation 의 리뷰 상태 Y로 업데이트
	
	public int registerReviewImg(ReviewImg reviewImage);

	public List<ReviewImg> printReviewImg(Integer reviewNo); // 리뷰 상세 보기에 리뷰 이미지 불러오기

	public int reviewModify(Review review);
	
	public int reviewImgModify(ReviewImg reviewImg);
	
	public int removeReview(Integer reviewNo);

	public Review printOneByNo(Integer reviewNo);

	public Space printSpace(Integer spaceNo);

	public Reservation printReservation(Integer spaceNo);

	public int updateRevStatusN(Reservation reservation);






}
