package com.kh.mobiil.space.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;

public interface SpaceStore {
	// 날짜 및 시간 유효성 검사
	int checkTime(SqlSessionTemplate session, String start, String end, String reservDate);
	// 리스트 전체 게시물 개수
	int selectTotalCount(SqlSessionTemplate session);
	List<Space> selectSpace(SqlSessionTemplate session, RowBounds rowBounds);
	Space selectOneByNo(SqlSessionTemplate session, Integer spaceNo);
	List<SpaceImg> selectImg(SqlSessionTemplate session, Integer spaceNo);
	
}
