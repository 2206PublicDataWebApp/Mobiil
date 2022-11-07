package com.kh.mobiil.calendar.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.calendar.service.CalendarService;
import com.kh.mobiil.calendar.store.CalendarStore;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private CalendarStore cStore;

}
