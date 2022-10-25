package com.kh.mobiil.review.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.mobiil.review.domain.Review;

public interface ReviewStore {

	public int insertReview(SqlSession session, Review review);

}
