package com.kh.mobiil.space.service.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.space.domain.Heart;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;
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

	@Override
	public int getTotalCount(String area, String searchValue) {
		int totalCount = sStore.selectTotalCount(session, area, searchValue);
		return totalCount;
	}

	@Override
	public int getPriceCount(Integer minNum, Integer maxNum) {
		int totalCount = sStore.selectPriceCount(session, minNum, maxNum);
		return totalCount;
	}
	
	@Override
	public List<Space> printSpace(RowBounds rowBounds) {
		List<Space> sList = sStore.selectSpace(session, rowBounds);
		return sList;
	}

	@Override
	public Space printOneByNo(Integer spaceNo) {
		Space space = sStore.selectOneByNo(session, spaceNo);
		return space;
	}

	@Override
	public List<SpaceImg> printImg(Integer spaceNo) {
		List<SpaceImg> iList = sStore.selectImg(session, spaceNo);
		return iList;
	}

	@Override
	public List<Space> printAllByValue(String searchValue, RowBounds rowBounds) {
		List<Space> sList = sStore.selectAllByValue(session, searchValue, rowBounds);
		return sList;
	}

	@Override
	public List<Space> printByArea(String area, RowBounds rowBounds) {
		List<Space> sList = sStore.selectByArea(session, area, rowBounds);
		return sList;
	}

	@Override
	public List<Space> printByPrice(Integer minNum, Integer maxNum, RowBounds rowBounds) {
		List<Space> sList = sStore.selectByPrice(session, minNum, maxNum, rowBounds);
		return sList;
	}

	@Override
	public int registerReservation(Reservation rsv) {
		int result = sStore.insertReservation(session, rsv);
		return result;
	}

	@Override
	public int getAreaCount(String area) {
		int result = sStore.selectAreaCount(area, session);
		return result;
	}

	@Override
	public List<Space> printAllSpace() {
		List<Space> sList = sStore.selectAllSpace(session);
		return sList;
	}
		
	@Override
	public int checkHeart(Integer spaceNo, String memberEmail) {
		int result = sStore.checkHeart(session, spaceNo, memberEmail);
		return result;
	}

	@Override
	public int insertHeart(Heart heart) {
		int result = sStore.insertHeart(session, heart);
		return result;
	}

	@Override
	public int deleteHeart(Heart heart) {
		int result = sStore.deleteHeart(session, heart);
		return result;
	}



	
	
}
