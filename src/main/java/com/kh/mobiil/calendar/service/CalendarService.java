package com.kh.mobiil.calendar.service;

import java.util.List;

import com.kh.mobiil.calendar.domain.Event;

public interface CalendarService {

	public int insertEvent(Event event);

	public List<Event> printEvents();

	public int deleteEvent(int id);

	public int modifyEvent(Event event);

}
