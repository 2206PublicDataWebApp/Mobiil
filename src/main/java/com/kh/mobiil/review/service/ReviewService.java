package com.kh.mobiil.review.service;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;

public interface ReviewService {

	public int registerReview(Review review);

	public int registerReviewImg(ReviewImg reviewImage);

	public int removeReview(Integer reviewNo);

	public Review printOneByNo(Integer reviewNo);

}
