package com.kh.mobiil.space.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.mobiil.space.service.SpaceService;

@Controller
public class SpaceController {
	
	@Autowired
	private SpaceService sService;
	
	
	@RequestMapping(value="/space/spaceList", method=RequestMethod.GET)
	public String spaceListView() {
		return "space/spaceList";
	}
	
	@RequestMapping(value="/space/spaceDetail", method=RequestMethod.GET)
	public String spaceDetail() {
		return "space/spaceDetail";
	}
	
	@RequestMapping(value="/space/payment", method=RequestMethod.GET)
	public String payment() {
		return "space/payment";
	}
	
	@RequestMapping(value="/space/reservationInfo", method=RequestMethod.GET)
	public String reservationInfo() {
		return "space/reservationInfo";
	}
	
	@ResponseBody
	@RequestMapping(value="/space/checkTime", method=RequestMethod.GET)
	public String checkTime(String start, String end, String reservDate) {
		System.out.println(start + end + reservDate);
		int result = sService.checkTime(start, end, reservDate);
		System.out.println(result);
		return String.valueOf(result);
	}
}
