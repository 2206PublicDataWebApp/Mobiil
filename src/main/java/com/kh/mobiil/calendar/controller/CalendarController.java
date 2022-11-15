package com.kh.mobiil.calendar.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.mobiil.calendar.domain.Event;
import com.kh.mobiil.calendar.service.CalendarService;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService cService;
	
	/**
	 * 일정 등록
	 * @param event
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin/calendar/registerEvent.kh", method = RequestMethod.GET)
	public String registerEvent(@ModelAttribute Event event) {
		int result = cService.insertEvent(event);
		if(result > 0) {
			return "success";
		}else {
			return  "fail";
		}
	}

	/**
	 * 일정 삭제
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin/calendar/deleteEvent.kh", method = RequestMethod.GET)
	public String deleteEvent(@RequestParam("id") int id) {
		int result = cService.deleteEvent(id);
		if(result > 0) {
			return "success";
		}else {
			return  "fail";
		}
	}

	/**
	 * 일정 수정
	 * @param event
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/admin/calendar/modify.kh", method = RequestMethod.GET)
	public String modifyEvent(@ModelAttribute Event event) {
		int result = cService.modifyEvent(event);
		if(result > 0) {
			return "success";
		}else {
			return  "fail";
		}
	}

	/**
	 * 일정 출력(관리자)
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/admin/calendar/printEvents.kh", method = RequestMethod.GET , produces = "application/json;charset=utf-8")
	public String printEvents() {
		List<Event> eList = cService.printEvents();
		Gson gson = new Gson();
		return gson.toJson(eList);
	}

	/**
	 * 일정 출력(서비스)
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/calendar/printEventsService.kh", method = RequestMethod.GET , produces = "application/json;charset=utf-8")
	public String printEventsForService() {
		List<Event> eList = cService.printEvents();
		Gson gson = new Gson();
		return gson.toJson(eList);
	}

	/**
	 * 캘린더 띄우기
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/admin/calendar.kh")
	public ModelAndView showCalendar(ModelAndView mv) {
		mv.setViewName("/admin/eventCalendar");
		return mv;
	}
	
	/**
	 * 캘린더 띄우기(서비스)
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/calendar.kh")
	public ModelAndView showServiceCalendar(ModelAndView mv) {
		mv.setViewName("/calendar");
		return mv;
	}

	/**
	 * 일정 등록 뷰
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="/admin/calendar/register.kh")
	public ModelAndView showCalendarRegister(ModelAndView mv) {
		mv.setViewName("/admin/eventRegister");
		return mv;
	}
}
