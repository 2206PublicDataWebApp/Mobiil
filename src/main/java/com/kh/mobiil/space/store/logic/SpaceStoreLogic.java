package com.kh.mobiil.space.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.store.SpaceStore;

@Repository
public class SpaceStoreLogic implements SpaceStore{

	// 리스트 전체 게시물 개수
	@Override
	public int selectTotalCount(SqlSessionTemplate session, String searchCondition, String searchValue) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchCondition", searchCondition);
		map.put("searchValue", searchValue);
		int totalCount = session.selectOne("SpaceMapper.selectTotalCount", map);
		return totalCount;
	}
	
	// 날짜 및 시간 유효성 검사
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

	@Override
	public List<Space> selectSpace(SqlSessionTemplate session, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.selectAllSpace", null, rowBounds);
		return sList;
	}

	@Override
	public Space selectOneByNo(SqlSessionTemplate session, Integer spaceNo) {
		Space space = session.selectOne("SpaceMapper.selectOneByNo", spaceNo);
		return space;
	}

	

}
