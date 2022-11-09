package com.kh.mobiil.calendar.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.calendar.domain.Event;
import com.kh.mobiil.calendar.service.CalendarService;
import com.kh.mobiil.calendar.store.CalendarStore;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private CalendarStore cStore;
	
	@Autowired
	private SqlSessionTemplate session;
	

	@Override
	public int insertEvent(Event event) {
		int result = cStore.insertEvent(event, session);
		return result;
	}


	@Override
	public List<Event> printEvents() {
		List<Event> eList = cStore.selectEvents(session); 
		return eList;
	}

}
