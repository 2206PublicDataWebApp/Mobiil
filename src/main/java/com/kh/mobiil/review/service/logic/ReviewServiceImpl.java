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
import com.kh.mobiil.space.domain.Space;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private SqlSession session;
	
	@Autowired
	private ReviewStore rStore;
	
	@Override
	public int registerReview(Review review) {
		int result = rStore.insertReview(session, review);
		return result;
	}
	
	@Override
	public int updateRevStatus(Reservation reservation) {
		int result = rStore.updateRevStatus(session, reservation);
		return result;
	}

	@Override
	public int registerReviewImg(ReviewImg ReviewImg) {
		int result = rStore.insertReviewImg(session, ReviewImg);
		return result;
	}

	// 리뷰 상세보기에 리뷰 이미지 불러오기
	@Override
	public List<ReviewImg> printReviewImg(Integer reviewNo) {
		List<ReviewImg> rList = rStore.selectReviewImg(session, reviewNo);
		return rList;
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
	public Review printOneByNo(Integer reviewNo) {
		Review review = rStore.selectOneByNo(session, reviewNo);
		return review;
	}

	@Override
	public Space printSpace(Integer spaceNo) {
		Space space = rStore.selectSpace(session, spaceNo);
		return space;
	}

	@Override
	public Reservation printReservation(Integer spaceNo) {
		Reservation reservation = rStore.selectReservation(session, spaceNo);
		return reservation;
	}

	@Override
	public int updateRevStatusN(Reservation reservation) {
		int result = rStore.updateRevStatusN(session, reservation);
		return result;
	}




}
