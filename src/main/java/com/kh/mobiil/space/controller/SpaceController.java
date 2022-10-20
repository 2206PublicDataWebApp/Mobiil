package com.kh.mobiil.space.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SpaceController {
	
	@RequestMapping(value="/spaceList", method=RequestMethod.GET)
	public String spaceListView() {
		return "space/spaceList";
	}
	
	@RequestMapping(value="/spaceDetail", method=RequestMethod.GET)
	public String spaceDetail() {
		return "space/spaceDetail";
	}
	
	@RequestMapping(value="/payment", method=RequestMethod.GET)
	public String payment() {
		return "space/payment";
	}
	
	@RequestMapping(value="/reservationInfo", method=RequestMethod.GET)
	public String reservationInfo() {
		return "space/reservationInfo";
	}
	
}
