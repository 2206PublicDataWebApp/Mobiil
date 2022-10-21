package com.kh.mobiil.space.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.mobiil.space.domain.Space;

public interface SpaceService {
	
	// 시간 유효성 체크 
	int checkTime(String start, String end, String reservDate);

	// 리스트 게시물 전체 개수
	int getTotalCount(String searchCondition, String searchValue);
	
	List<Space> printSpace(RowBounds rowBounds);

	Space printOneByNo(Integer spaceNo);

}
