package com.kh.mobiil.calendar.store.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.calendar.domain.Event;
import com.kh.mobiil.calendar.store.CalendarStore;

@Repository
public class CalendarStoreLogic implements CalendarStore {

	@Override
	public int insertEvent(Event event, SqlSessionTemplate session) {
		int result = session.insert("eventMapper.insertEvent", event);
		return result;
	}

	@Override
	public List<Event> selectEvents(SqlSessionTemplate session) {
		List<Event> eList = session.selectList("eventMapper.selectEvents");
		return eList;
	}
	

}
