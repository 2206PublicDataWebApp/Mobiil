package com.kh.mobiil.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.service.ReviewService;

public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	// 리뷰 등록 화면
	@RequestMapping(value="/review/writeView.kh", method=RequestMethod.GET)
	public String reviewWriteView() {
		return "member/reviewWrite";
	}
	
	// 리뷰 등록
	@RequestMapping(value="/review/register.kh", method=RequestMethod.POST)
	public ModelAndView registReview(ModelAndView mv, Review review, HttpServletRequest request) {
		try {
			int result = rService.registerReview(review);
			request.setAttribute("msg","리뷰가 등록되었습니다.");
			request.setAttribute("url","/");
		}catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
}
