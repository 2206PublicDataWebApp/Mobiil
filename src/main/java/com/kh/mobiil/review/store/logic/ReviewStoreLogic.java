package com.kh.mobiil.review.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.review.store.ReviewStore;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;

@Repository
public class ReviewStoreLogic implements ReviewStore{

	@Override
	public int insertReview(SqlSession session, Review review) {
		int result = session.insert("ReviewMapper.insertReview", review);
		return result;
	}

	@Override
	public int updateRevStatus(SqlSession session, Reservation reservation) {
		int result = session.update("ReviewMapper.updateRevStatus", reservation);
		return result;
	}
	
	@Override
	public int insertReviewImg(SqlSession session, ReviewImg reviewImg) {
		int result = session.insert("ReviewMapper.insertReviewImg", reviewImg);
		return result;
	}

	@Override
	public List<ReviewImg> selectReviewImg(SqlSession session, Integer reviewNo) {
		List<ReviewImg> rList = session.selectList("ReviewMapper.selectReviewImg", reviewNo);
		return rList;
	}
	
	@Override
	public int reviewModify(SqlSession session, Review review) {
		int result = session.update("ReviewMapper.reviewModify", review);
		return result;
	}

	@Override
	public int reviewImgModify(SqlSession session, ReviewImg reviewImg) {
		int result = session.update("ReviewMapper.reviewImgModify", reviewImg);
		return result;
	}


	@Override
	public int deleteReview(SqlSession session, Integer reviewNo) {
		int result = session.delete("ReviewMapper.deleteReview", reviewNo);
		return result;
	}

	@Override
	public Review selectOneByNo(SqlSession session, Integer reviewNo) {
		Review review = session.selectOne("ReviewMapper.selectOneByNo", reviewNo);
		return review;
	}

	@Override
	public Reservation selectReservation(SqlSession session, String reservationNo) {
		Reservation reservation = session.selectOne("ReviewMapper.selectReservation", reservationNo);
		return reservation;
	}

	@Override
	public int updateRevStatusN(SqlSession session, String reservationNo) {
		int result = session.update("ReviewMapper.updateRevStatusN", reservationNo);
		return result;
	}

	@Override
	public List<ReviewImg> selectImgByNo(SqlSession session, Integer reviewNo) {
		List<ReviewImg> reviewImg = session.selectList("ReviewMapper.selectImgByNo", reviewNo);
		return reviewImg;
	}

	@Override
	public int deleteReviewImg(SqlSession session, Integer reviewNo) {
		int result = session.delete("ReviewMapper.deleteReviewImg", reviewNo);
		return result;
	}

	}

