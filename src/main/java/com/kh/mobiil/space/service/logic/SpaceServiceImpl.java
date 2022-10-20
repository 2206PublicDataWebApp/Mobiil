package com.kh.mobiil.space.service.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.space.service.SpaceService;
import com.kh.mobiil.space.store.SpaceStore;

@Service
public class SpaceServiceImpl implements SpaceService{

	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private SpaceStore sStore;

	@Override
	public int checkTime(String start, String end, String reservDate) {
		int result = sStore.checkTime(session, start, end, reservDate);
		return result;
	}
	
	
}
