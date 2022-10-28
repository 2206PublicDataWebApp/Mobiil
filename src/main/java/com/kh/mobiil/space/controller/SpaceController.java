package com.kh.mobiil.space.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.partner.domain.Page;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;
import com.kh.mobiil.space.service.SpaceService;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService sService;
	
	// 공간 리스트 조회
	@RequestMapping(value="/space/spaceList.kh", method=RequestMethod.GET)
	public ModelAndView spaceListView(
			ModelAndView mv
			,@RequestParam(value="page", required=false) Integer page) {
		// 페이징
		int currentPage = (page != null) ? page : 1;
		int totalCount = sService.getTotalCount("","");
		int naviLimit = 5;
		int boardLimit = 9;
		Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
		RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
		
		List<Space> sList = sService.printSpace(rowBounds);
		if(!sList.isEmpty()) {
			mv.addObject("urlVal", "spaceList");
			mv.addObject("paging", paging);
			mv.addObject("sList", sList);
		}
		mv.setViewName("space/spaceList");
		return mv;
	}
	
	// 공간 상세 조회
	@RequestMapping(value="/space/spaceDetail.kh", method=RequestMethod.GET)
	public ModelAndView spaceDetail(
			ModelAndView mv
			, @RequestParam(value="spaceNo") Integer spaceNo
			, @RequestParam(value="page", required=false) Integer page
			, HttpSession session) { // 세션 사용 안하면 나중에 삭제하기
		try {
			Space space = sService.printOneByNo(spaceNo);
			List<SpaceImg> iList = sService.printImg(spaceNo);
			session.setAttribute("spaceNo", space.getSpaceNo());
			session.setAttribute("spaceName", space.getSpaceName());
			mv.addObject("space", space);
			mv.addObject("iList", iList);
			mv.addObject("page", page);
			mv.setViewName("space/spaceDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 공간 검색
	@RequestMapping(value="/space/spaceSearch.kh", method=RequestMethod.GET)
	public ModelAndView spaceSearchList(
			ModelAndView mv
			, @RequestParam("searchValue") String searchValue
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			// 페이징
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getTotalCount("",searchValue);
			int naviLimit = 5;
			int boardLimit = 9;
			Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
			RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			
			List<Space> sList = sService.printAllByValue(searchValue, rowBounds);
			if(!sList.isEmpty()) {
				mv.addObject("sList", sList);
			}else {
				mv.addObject("sList", null);
			}
			mv.addObject("urlVal", "spaceSearch");
			mv.addObject("searchValue", searchValue);
			mv.addObject("paging", paging);
			mv.setViewName("space/spaceList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 지역 검색
	@RequestMapping(value="/space/spaceArea.kh", method=RequestMethod.GET)
	public ModelAndView spaceAreaList(
			ModelAndView mv
			, @RequestParam("area") String area
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			// 페이징
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getTotalCount(area,"");
			int naviLimit = 5;
			int boardLimit = 9;
			Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
			RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			
			List<Space> sList = sService.printByArea(area, rowBounds);
			if(!sList.isEmpty()) {
				mv.addObject("sList", sList);
			}else {
				mv.addObject("sList", null);
			}
			mv.addObject("urlVal", "spaceArea");
			mv.addObject("area", area);
			mv.addObject("paging", paging);
			mv.setViewName("space/spaceList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 가격 검색
	@RequestMapping(value="/space/spacePrice.kh", method=RequestMethod.GET)
	public ModelAndView spacePriceList(
			ModelAndView mv
			, @RequestParam("minNum") Integer minNum
			, @RequestParam("maxNum") Integer maxNum
			, @RequestParam(value="page", required=false) Integer page) {
		try {
			// 페이징
			int currentPage = (page != null) ? page : 1;
			int totalCount = sService.getPriceCount(minNum,maxNum);
			int naviLimit = 5;
			int boardLimit = 9;
			Page paging = new Page(currentPage, totalCount, naviLimit, boardLimit);
			RowBounds rowBounds = new RowBounds(paging.getOffset(), boardLimit);
			
			List<Space> sList = sService.printByPrice(minNum, maxNum, rowBounds);
			if(!sList.isEmpty()) {
				mv.addObject("sList", sList);
			}else {
				mv.addObject("sList", null);
			}
			mv.addObject("urlVal", "spacePrice");
			mv.addObject("minNum", minNum);
			mv.addObject("maxNum", maxNum);
			mv.addObject("paging", paging);
			mv.setViewName("space/spaceList");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	@RequestMapping(value="/space/payment.kh", method=RequestMethod.GET)
	public ModelAndView payment( ModelAndView mv
			, @RequestParam(value="sDate") Date sDate
			, @RequestParam(value="start") int start
			, @RequestParam(value="end") int end
			, @RequestParam(value="price") int price
			, HttpSession session) {
		try {
			mv.addObject("sDate",sDate);
			mv.addObject("start",start);
			mv.addObject("end",end);
			mv.addObject("price",price);
			mv.setViewName("space/payment");
		} catch (Exception e) {
			mv.addObject("msg", e.toString()).setViewName("common/errorPage");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/space/paymentResult.kh", method=RequestMethod.GET)
	public ModelAndView registerReservation(ModelAndView mv
			, Reservation rsv
			, @RequestParam(value="reservNo") String reservNo
			, @RequestParam(value="price") Integer price
			, @RequestParam(value="paymentDate") String paymentDate
			, @RequestParam(value="memberName") String memberName
			, @RequestParam(value="memberPhone") String memberPhone
			, @RequestParam(value="memberEmail") String memberEmail
			, @RequestParam(value="spaceNo") Integer spaceNo
			, @RequestParam(value="reservDate") String reservDate
			, @RequestParam(value="revStart") Integer revStart
			, @RequestParam(value="revEnd") Integer revEnd) {
			try {
					SimpleDateFormat format = new SimpleDateFormat("yyyy. MM. dd.");
					SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
					java.util.Date rDate = format.parse(reservDate);
					java.util.Date pDate = format2.parse(paymentDate);
					String rsvD = format2.format(rDate);
					String pmD = format2.format(pDate);
					Date rsvDate = Date.valueOf(rsvD);
					Date pmDate = Date.valueOf(pmD);
					Space space = sService.printOneByNo(spaceNo);
					rsv.setReservationNo(reservNo);
					rsv.setMemberEmail(memberEmail);
					rsv.setHostEmail(space.getHostEmail());
					rsv.setSpaceNo(spaceNo);
					rsv.setSpaceName(space.getSpaceName());
					rsv.setSpaceAddress(space.getAddress());
					rsv.setPrice(price);
					rsv.setReservationDate(rsvDate);
					rsv.setMemberName(memberName);
					rsv.setMemberPhone(memberPhone);
					rsv.setPaymentDate(pmDate);
					rsv.setRevStart(revStart);
					rsv.setRevEnd(revEnd);
					
					int result = sService.registerReservation(rsv);
					if(result > 0) {
						mv.setViewName("redirect:/space/reservationInfo.kh");
					}else {
					}
//				System.out.println(pmDate+" "+rsvDate);
			} catch (Exception e) {
				// TODO: handle exception
				mv.addObject("msg", e.toString()).setViewName("common/errorPage");
			}
		return mv;
	}
	@RequestMapping(value="/space/reservationInfo.kh", method=RequestMethod.GET)
	public String reservationInfo() {
		return "space/reservationInfo";
	}
	
	// 예약날짜 및 시간 유효성 체크
	@ResponseBody
	@RequestMapping(value="/space/checkTime.kh", method=RequestMethod.GET)
	public String checkTime(String start, String end, String reservDate) {
		System.out.println(start + end + reservDate);
		int result = sService.checkTime(start, end, reservDate);
		System.out.println(result);
		return String.valueOf(result);
	}
}
