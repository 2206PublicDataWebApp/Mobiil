package com.kh.mobiil.space.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.space.domain.Heart;
import com.kh.mobiil.space.domain.HostReply;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;
import com.kh.mobiil.space.store.SpaceStore;

@Repository
public class SpaceStoreLogic implements SpaceStore{

	// 리스트 전체 게시물 개수
	@Override
	public int selectTotalCount(SqlSessionTemplate session, String searchArea, String searchValue) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchArea", searchArea);
		paramMap.put("searchValue", searchValue);
		int totalCount = session.selectOne("SpaceMapper.selectTotalCount", paramMap);
		return totalCount;
	}
	
	@Override
	public int selectPriceCount(SqlSessionTemplate session, Integer minNum, Integer maxNum) {
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("minNum", minNum);
		paramMap.put("maxNum", maxNum);
		int totalCount = session.selectOne("SpaceMapper.selectPriceCount", paramMap);
		return totalCount;
	}
	
	// 날짜 및 시간 유효성 검사
	@Override
	public int checkTime(SqlSessionTemplate session, String start, String end, String reservDate) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("start", start);
		paramMap.put("end", end);
		paramMap.put("reservDate", reservDate);
		int result = session.selectOne("SpaceMapper.checkTime", paramMap);
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

	@Override
	public List<SpaceImg> selectImg(SqlSessionTemplate session, Integer spaceNo) {
		List<SpaceImg> iList = session.selectList("SpaceMapper.selectImg", spaceNo);
		return iList;
	}

	@Override
	public List<Space> selectAllByValue(SqlSessionTemplate session, String searchArea, String searchValue, RowBounds rowBounds) {
		HashMap<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchArea", searchArea);
		paramMap.put("searchValue", searchValue);
		List<Space> sList = session.selectList("SpaceMapper.selectAllByValue", paramMap, rowBounds);
		return sList;
	}

	@Override
	public List<Space> selectByArea(SqlSessionTemplate session, String searchArea, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.selectByArea", searchArea, rowBounds);
		return sList;
	}

	@Override
	public List<Space> selectByPrice(SqlSessionTemplate session, Integer minNum, Integer maxNum, RowBounds rowBounds) {
		HashMap<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("minNum", minNum);
		paramMap.put("maxNum", maxNum);
		List<Space> sList = session.selectList("SpaceMapper.selectByPrice", paramMap, rowBounds);
		return sList;
	}

	@Override
	public int insertReservation(SqlSessionTemplate session, Reservation rsv) {
		int result = session.insert("SpaceMapper.insertReservation", rsv);
		return result;
	}

	@Override
	public int selectAreaCount(String searchArea, SqlSessionTemplate session) {
		int result = session.selectOne("SpaceMapper.selectAreaCount", searchArea);
		return result;
	}

	//지도에 전부 출력할라고 만든 메소드
	@Override
	public List<Space> selectAllSpace(SqlSessionTemplate session) {
		List<Space> sList = session.selectList("SpaceMapper.selectAllSpaceForMap");
		return sList;
	}
	
	@Override
	public int checkHeart(SqlSessionTemplate session, Integer spaceNo, String memberEmail) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("spaceNo",spaceNo);
		paramMap.put("memberEmail",memberEmail);
		int result = session.selectOne("SpaceMapper.checkHeart", paramMap);
		return result;
	}

	@Override
	public int insertHeart(SqlSessionTemplate session, Heart heart) {
		int result = session.insert("SpaceMapper.insertHeart", heart);
		return result;
	}

	@Override
	public int deleteHeart(SqlSessionTemplate session, Heart heart) {
		int result = session.delete("SpaceMapper.deleteHeart", heart);
		return result;
	}

	@Override
	public Reservation selectRsv(SqlSessionTemplate session, String reservationNo) {
		Reservation rsv = session.selectOne("SpaceMapper.selectResevation", reservationNo);
		return rsv;
	}

	@Override
	public List<Review> selectReview(SqlSessionTemplate session, Integer spaceNo) {
		List<Review> rList = session.selectList("SpaceMapper.selectReview", spaceNo);
		return rList;
	}

	@Override
	public int insertReply(SqlSessionTemplate session, HostReply hostReply) {
		int result = session.insert("SpaceMapper.insertReply", hostReply);
		return result;
	}

	@Override
	public List<HostReply> selectReply(SqlSessionTemplate session, int reviewNo) {
		List<HostReply> hrList = session.selectList("SpaceMapper.selectReply", reviewNo);
		return hrList;
	}

	@Override
	public List<ReviewImg> selectReviewImg(SqlSessionTemplate session, Integer reviewNo) {
		List<ReviewImg> riList = session.selectList("SpaceMapper.selectReviewImg", reviewNo);
		return riList;
	}

	@Override
	public List<Space> selectHeartDesc(SqlSessionTemplate session, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.heartSortDesc", null, rowBounds);
		return sList;
	}

	@Override
	public List<Space> selectRivewDesc(SqlSessionTemplate session, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.ReviewSortDesc", null, rowBounds);
		return sList;
	}

	@Override
	public int updateReply(SqlSessionTemplate session, HostReply hostReply) {
		int result = session.update("SpaceMapper.updateReply", hostReply);
		return result;
	}

	

}
