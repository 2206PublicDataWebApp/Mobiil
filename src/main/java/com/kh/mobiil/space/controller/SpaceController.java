package com.kh.mobiil.space.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.partner.domain.Page;
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
			,HttpServletRequest request
			,@RequestParam(value="page", required=false) Integer page) {
		// 페이징
		int currentPage = (page != null) ? page : 1;
		int totalCount = sService.getTotalCount();
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
			mv.addObject("space", space);
			mv.addObject("iList", iList);
			mv.addObject("page", page);
			mv.setViewName("space/spaceDetail");
		} catch (Exception e) {
			mv.addObject("msg", e.toString());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/space/payment.kh", method=RequestMethod.GET)
	public String payment() {
		return "space/payment";
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
