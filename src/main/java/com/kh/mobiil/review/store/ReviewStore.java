package com.kh.mobiil.review.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;

public interface ReviewStore {

	public int insertReview(SqlSession session, Review review);

	public int insertReviewImg(SqlSession session, ReviewImg reviewImg);

	public int deleteReview(SqlSession session, Integer reviewNo);

	public Review selectOneByNo(SqlSession session, Integer reviewNo);

}
