package com.kh.mobiil.space.store;

import org.mybatis.spring.SqlSessionTemplate;

public interface SpaceStore {

	int checkTime(SqlSessionTemplate session, String start, String end, String reservDate);

}
