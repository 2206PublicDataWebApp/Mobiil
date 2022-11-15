package com.kh.mobiil.review.service.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.review.service.ReviewService;
import com.kh.mobiil.review.store.ReviewStore;
import com.kh.mobiil.space.domain.Reservation;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private ReviewStore rStore;
	
	@Override
	public Reservation printReservation(String reservationNo) {
		Reservation reservation = rStore.selectReservation(session, reservationNo);
		return reservation;
	}

	@Override
	public int registerReview(Review review) {
		int result = rStore.insertReview(session, review);
		return result;
	}
	
	@Override
	public int registerReviewImg(ReviewImg ReviewImg) {
		int result = rStore.insertReviewImg(session, ReviewImg);
		return result;
	}

	@Override
	public int updateRevStatus(Reservation reservation) {
		int result = rStore.updateRevStatus(session, reservation);
		return result;
	}

	@Override
	public List<ReviewImg> printReviewImg(Integer reviewNo) {
		List<ReviewImg> rList = rStore.selectReviewImg(session, reviewNo);
		return rList;
	}
	
	@Override
	public Review printOneByNo(Integer reviewNo) {
		Review review = rStore.selectOneByNo(session, reviewNo);
		return review;
	}

	@Override
	public List<ReviewImg> printImgByNo(Integer reviewNo) {
		List<ReviewImg> reviewImg = rStore.selectImgByNo(session, reviewNo);
		return reviewImg;
	}

	@Override
	public int reviewModify(Review review) {
		int result = rStore.reviewModify(session, review);
		return result;
	}
	
	@Override
	public int reviewImgModify(ReviewImg reviewImg) {
		int result = rStore.reviewImgModify(session, reviewImg);
		return result;
	}
	
	@Override
	public int removeReview(Integer reviewNo) {
		int result = rStore.deleteReview(session, reviewNo);
		return result;
	}

	@Override
	public int removeReviewImg(Integer reviewNo) {
		int result = rStore.deleteReviewImg(session, reviewNo);
		return result;
	}

	@Override
	public int updateRevStatusN(String reservationNo) {
		int result = rStore.updateRevStatusN(session, reservationNo);
		return result;
	}





}
