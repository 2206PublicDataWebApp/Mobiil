package com.kh.mobiil.space.store.logic;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.space.store.SpaceStore;

@Repository
public class SpaceStoreLogic implements SpaceStore{

	@Override
	public int checkTime(SqlSessionTemplate session, String start, String end, String reservDate) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		map.put("reservDate", reservDate);
		System.out.println(map);
		int result = session.selectOne("SpaceMapper.checkTime", map);
		return result;
	}
	

}
