package com.kh.mobiil.review.service.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.service.ReviewService;
import com.kh.mobiil.review.store.ReviewStore;

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

}
