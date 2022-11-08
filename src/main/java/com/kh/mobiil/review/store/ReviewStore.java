package com.kh.mobiil.review.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;

public interface ReviewStore {

	public int insertReview(SqlSession session, Review review);

	public int updateRevStatus(SqlSession session, Reservation reservation);
	
	public int insertReviewImg(SqlSession session, ReviewImg reviewImg);

	public List<ReviewImg> selectReviewImg(SqlSession session, Integer reviewNo); // 리뷰 상세보기에서 리뷰 이미지

	public int reviewModify(SqlSession session, Review review);
	
	public int reviewImgModify(SqlSession session, ReviewImg reviewImg);

	public int deleteReview(SqlSession session, Integer reviewNo);

	public Review selectOneByNo(SqlSession session, Integer reviewNo);

	public Reservation selectReservation(SqlSession session, String reservationNo);

	public int updateRevStatusN(SqlSession session, String reservationNo);

	public List<ReviewImg> selectImgByNo(SqlSession session, Integer reviewNo);

	public int deleteReviewImg(SqlSession session, Integer reviewNo);






}
