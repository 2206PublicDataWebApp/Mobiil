package com.kh.mobiil.review.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.review.store.ReviewStore;

@Repository
public class ReviewStoreLogic implements ReviewStore{

	@Override
	public int insertReview(SqlSession session, Review review) {
		int result = session.insert("ReviewMapper.insertReview", review);
		return result;
	}

	@Override
	public int insertReviewImg(SqlSession session, ReviewImg reviewImg) {
		int result = session.insert("ReviewMapper.insertReviewImg", reviewImg);
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

}
