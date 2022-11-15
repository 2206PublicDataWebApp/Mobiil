package com.kh.mobiil.calendar.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mobiil.calendar.domain.Event;

public interface CalendarStore {

	public int insertEvent(Event event, SqlSessionTemplate session);

	public int updateEvent(Event event, SqlSessionTemplate session);

	public int deleteEvent(int id, SqlSessionTemplate session);

	public List<Event> selectEvents(SqlSessionTemplate session);

}
