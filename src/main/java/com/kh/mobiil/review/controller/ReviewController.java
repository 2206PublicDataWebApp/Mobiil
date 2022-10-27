package com.kh.mobiil.review.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.review.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	// 리뷰 등록 화면
	@RequestMapping(value="/review/writeView.kh", method=RequestMethod.GET)
	public String reviewWriteView() {
		return "review/reviewWrite";
	}
	
	// 리뷰 등록
	@RequestMapping(value="/review/register.kh", method=RequestMethod.POST)
	public ModelAndView registReview(ModelAndView mv, @ModelAttribute Review review, 
			@RequestParam(value="uploadFile", required=false) List<MultipartFile> uploadFile, 
			MultipartHttpServletRequest mRequest, HttpServletRequest request) {
		try {
			int result = rService.registerReview(review);	
			int imgNo = 1;
			ReviewImg reviewImg = null;
			for(MultipartFile mf : uploadFile) {
				String reviewFileName = mf.getOriginalFilename();
				if(!reviewFileName.equals("")) {
					String root = request.getSession().getServletContext().getRealPath("resources");
					String savePath = root + "\\reviewFiles";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String reviewFileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+reviewFileName.substring(reviewFileName.lastIndexOf(".")+1);
					File file = new File(savePath);
					if(!file.exists()) { 
						file.mkdir();
					}
					mf.transferTo(new File(savePath + "\\" + reviewFileRename));
					String reviewFilePath = savePath + "\\" + reviewFileRename;
					reviewImg = new ReviewImg();
					reviewImg.setReviewFileName(reviewFileName);
					reviewImg.setReviewFileRename(reviewFileRename);
					reviewImg.setReviewFilePath(reviewFilePath);
					imgNo += 1;
				}
				int result2 = rService.registerReviewImg(reviewImg);
				mv.setViewName("redirect:/payment/list.kh");
			}
		}catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 리뷰 상세조회
	@RequestMapping(value="/review/detail.kh", method=RequestMethod.GET)
		public ModelAndView reviewDetailView(ModelAndView mv, @RequestParam("reviewNo") Integer reviewNo, HttpSession session) {
		try {
			Review review = rService.printOneByNo(reviewNo);
			session.setAttribute("reviewNo", review.getReviewNo());
			mv.addObject("review", review);
			mv.setViewName("review/detailView");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 리뷰 수정
	
	// 리뷰 삭제
	@RequestMapping(value="/review/remove.kh", method = RequestMethod.GET)
	public String reviewRemove(HttpSession session, Model model, @RequestParam("reservationNo") Integer reservationNo) { 
	try {
		int reviewNo = (int)session.getAttribute("reviewNo");
		int result = rService.removeReview(reviewNo);
		if(result > 0) {
			session.removeAttribute("reviewNo");
		}
		return "redirect:/payment/detail.kh?reservationNo="+reservationNo;
	} catch (Exception e) {
		model.addAttribute("msg", e.toString());
		return "common/errorPage";
	}
}
}
