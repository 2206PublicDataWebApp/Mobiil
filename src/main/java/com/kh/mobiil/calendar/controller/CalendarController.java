package com.kh.mobiil.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mobiil.calendar.service.CalendarService;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService cService;
	
	@RequestMapping(value="/admin/calendar.kh")
	public ModelAndView showCalendar(ModelAndView mv) {
		mv.setViewName("/admin/eventCalendar");
		return mv;
	}
	
	
	@RequestMapping(value="/admin/calendar/register.kh")
	public ModelAndView showCalendarRegister(ModelAndView mv) {
		mv.setViewName("/admin/eventRegister");
		return mv;
	}
	
	

}
