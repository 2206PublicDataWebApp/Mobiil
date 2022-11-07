package com.kh.mobiil.review.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

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
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	// 리뷰 등록 화면
	@RequestMapping(value="/review/writeView.kh", method=RequestMethod.GET)
	public ModelAndView reviewWriteView(ModelAndView mv,
			@RequestParam(value="reservationNo") String reservationNo) {
		Reservation reservation = rService.printReservation(reservationNo);
		mv.addObject("reservation", reservation);
		mv.addObject("reservationNo", reservationNo);
		mv.setViewName("/review/reviewWrite");
		return mv;
	}
	
	// 리뷰 등록
	@RequestMapping(value="/review/register.kh", method=RequestMethod.POST)
	public ModelAndView registReview(ModelAndView mv, @ModelAttribute Review review,
			@ModelAttribute Reservation reservation,
			@RequestParam(value="uploadFile", required=false) List<MultipartFile> uploadFile, 
			MultipartHttpServletRequest mRequest, HttpServletRequest request) {
		try {
			int result = rService.registerReview(review);
			int result2 = rService.updateRevStatus(reservation);

			int imgNo = 1;
			ReviewImg reviewImg = null;
			for(MultipartFile mf : uploadFile) {
				String reviewFileName = mf.getOriginalFilename();
				if(!reviewFileName.equals("")) {
					String root = request.getSession().getServletContext().getRealPath("resources");
					String savePath = root + "\\reviewFiles";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					
					String reviewFileRename = sdf.format(new Date(System.currentTimeMillis()))+"."+reviewFileName.substring(reviewFileName.lastIndexOf(".")+1);
					UUID uuid = UUID.randomUUID(); // 랜덤으로 reviewFileRename 명 설정하기
					reviewFileRename = uuid.toString() + "_" + reviewFileRename; 
					
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
				int result3 = rService.registerReviewImg(reviewImg);
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
		public ModelAndView reviewDetailView(ModelAndView mv,
				@RequestParam("reservationNo") String reservationNo, 
				@RequestParam("reviewNo") Integer reviewNo, 
				@RequestParam("page") Integer page, HttpSession session) {
		try {
			Review review = rService.printOneByNo(reviewNo);
			List<ReviewImg> rList = rService.printReviewImg(reviewNo);
			mv.addObject("reservationNo", reservationNo);
			mv.addObject("reviewNo", reviewNo);
			mv.addObject("rList", rList);
			mv.addObject("review", review);
			mv.addObject("page", page);
			mv.setViewName("review/detailView");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 리뷰 수정화면
	@RequestMapping(value="/review/modifyView.kh", method=RequestMethod.GET)
	public ModelAndView reviewModifyView(
			ModelAndView mv
		    ,@RequestParam("reviewNo") Integer reviewNo
		    ,@RequestParam("page") int page) {
		try {
			Review review = rService.printOneByNo(reviewNo);
			List<ReviewImg> reviewImg = rService.printImgByNo(reviewNo);
			mv.addObject("reviewNo", reviewNo);
			mv.addObject("reviewImg", reviewImg);
			mv.addObject("review", review);
			mv.addObject("page", page);
			mv.setViewName("review/reviewModify");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	
	}
	
	
	// 리뷰 수정
	@RequestMapping(value="/review/modify.kh", method=RequestMethod.POST)
	public ModelAndView reviewModify(
			@ModelAttribute Review review,
			ModelAndView mv, 
			@RequestParam(value="reloadFile") List<MultipartFile> reloadFile,
			@RequestParam("reviewImgNo") int[] reviewNoArr,
			@RequestParam("reviewFileRename") String[] reviewFileRenameArr,
			HttpServletRequest request) {
		int num = 0;
		ReviewImg reviewImg = null;
		int result = rService.reviewModify(review);
		
		try {
			for(MultipartFile mf : reloadFile ) {
				String reviewFileName = mf.getOriginalFilename();
				if(!reviewFileName.equals("")) {
					String root = request.getSession().getServletContext().getRealPath("resources");
					String savePath = root + "\\reviewFiles";
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					
					String rFileRename = reviewFileRenameArr[num];
					File file = new File(savePath + "\\" + rFileRename);
					if(file.exists()) {
						file.delete();
					}
					
					String reviewFileRename = sdf.format(new Date(System.currentTimeMillis()))+ num + "." + reviewFileName.substring(reviewFileName.lastIndexOf(".")+1);
					UUID uuid = UUID.randomUUID(); // 랜덤으로 reviewFileRename 명 설정하기
					reviewFileRename = uuid.toString() + "_" + reviewFileRename; 
					file = new File(savePath);
					mf.transferTo(new File(savePath+"\\"+reviewFileRename));
					String reviewFilePath = savePath+"\\"+reviewFileRename;
					reviewImg = new ReviewImg();
					reviewImg.setReviewFileName(reviewFileName);
					reviewImg.setReviewFileRename(reviewFileRename);
					reviewImg.setReviewFilePath(reviewFilePath);
					int imgNo = reviewNoArr[num];
					reviewImg.setReviewImgNo(imgNo);
					num += 1;
				}
					int result2 = rService.reviewImgModify(reviewImg);
					mv.setViewName("redirect:/payment/list.kh");
				}
			} catch (Exception e) {

			}
			return mv;
		}

	// 리뷰 삭제
	@RequestMapping(value="/review/remove.kh", method = RequestMethod.GET)
	public ModelAndView reviewRemove(ModelAndView mv, @RequestParam("reviewNo") Integer reviewNo,
			@RequestParam("reservationNo") String reservationNo, HttpServletRequest request, HttpSession session) { 
	try {
		int result = rService.removeReview(reviewNo);
		int result2 = rService.updateRevStatusN(reservationNo);
		mv.addObject("reservationNo", reservationNo);
		if(result > 0) {
			request.setAttribute("msg", "리뷰가 삭제되었습니다.");
			request.setAttribute("url", "/payment/list.kh");	
			mv.setViewName("common/alert");
			}
		return mv;
	} catch (Exception e) {
		mv.addObject("msg", e.toString());
		mv.setViewName("common/errorPage");
	}
	return mv;

}
	
}
