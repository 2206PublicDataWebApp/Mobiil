package com.kh.mobiil.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mobiil.calendar.domain.Event;
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
	
	
	@RequestMapping(value="/admin/calendar/registerEvent.kh", method = RequestMethod.GET)
	public ModelAndView registerEvent(ModelAndView mv, @ModelAttribute Event event) {
		System.out.println(event.getStart());
		int result = cService.insertEvent(event);
		return mv;
	}
	@ResponseBody
	@RequestMapping(value = "/admin/calendar/printEvents.kh", method = RequestMethod.GET , produces = "application/json;charset=utf-8")
	public String printEvents() {
		
		List<Event> eList = cService.printEvents();
		System.out.println(eList.toString());
		
		Gson gson = new Gson();
		return gson.toJson(eList);
	}

}
