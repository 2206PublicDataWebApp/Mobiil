package com.kh.mobiil.review.service;

import java.util.List;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.space.domain.Reservation;

public interface ReviewService {

	public Reservation printReservation(String reservationNo); // 리뷰 작성 화면에 정보 불러오기

	public int registerReview(Review review); // 리뷰 등록

	public int registerReviewImg(ReviewImg reviewImage); // 리뷰 사진 등록

	public int updateRevStatus(Reservation reservation); // 리뷰 등록 시 reservation 의 리뷰 상태 Y로 업데이트

	public List<ReviewImg> printReviewImg(Integer reviewNo); // 리뷰 상세 보기에 리뷰 이미지 불러오기

	public Review printOneByNo(Integer reviewNo); // 리뷰 상세, 수정 화면

	public List<ReviewImg> printImgByNo(Integer reviewNo); // 리뷰 수정 화면

	public int reviewModify(Review review); // 리뷰 수정

	public int reviewImgModify(ReviewImg reviewImg); // 리뷰 사진 수정
	
	public int removeReview(Integer reviewNo); // 리뷰 삭제

	public int removeReviewImg(Integer reviewNo); // 리뷰 사진 삭제

	public int updateRevStatusN(String reservationNo); // 리뷰 삭제 시 reservation 의 리뷰 상태 N으로 업데이트

}
