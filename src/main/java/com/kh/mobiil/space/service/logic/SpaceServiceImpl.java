package com.kh.mobiil.space.service.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.space.domain.Heart;
import com.kh.mobiil.space.domain.HostReply;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;
import com.kh.mobiil.space.domain.Search;
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
	public int getTotalCount(Search search) {
		int totalCount = sStore.selectTotalCount(session, search);
		return totalCount;
	}

	@Override
	public int getTotalCountReviewDesc(Search search) {
		int totalCount = sStore.selectTotalCountReviewDesc(session, search);
		return totalCount;
	}

	@Override
	public int getPriceCount(Search search) {
		int totalCount = sStore.selectPriceCount(session, search);
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
	public List<Space> printAllByValue(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectAllByValue(session, search, rowBounds);
		return sList;
	}

	@Override
	public List<Space> printByArea(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectByArea(session, search, rowBounds);
		return sList;
	}

	@Override
	public List<Space> printByPrice(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectByPrice(session, search, rowBounds);
		return sList;
	}

	@Override
	public int registerReservation(Reservation rsv) {
		int result = sStore.insertReservation(session, rsv);
		return result;
	}

	@Override
	public int getAreaCount(String searchArea) {
		int result = sStore.selectAreaCount(searchArea, session);
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

	@Override
	public Reservation printRsv(String reservationNo) {
		Reservation rsv = sStore.selectRsv(session, reservationNo);
		return rsv;
	}

	@Override
	public List<Review> printReview(Integer spaceNo) {
		List<Review> rList = sStore.selectReview(session, spaceNo);
		return rList;
	}

	@Override
	public int insertReply(HostReply hostReply) {
		int result = sStore.insertReply(session, hostReply);
		return result;
	}

	@Override
	public List<HostReply> printReply(int reviewNo) {
		List<HostReply> hrList = sStore.selectReply(session, reviewNo);
		return hrList;
	}

	@Override
	public List<ReviewImg> printReviewImg(Integer reviewNo) {
		List<ReviewImg> riList = sStore.selectReviewImg(session, reviewNo);
		return riList;
	}

	@Override
	public List<Space> printHeartDesc(RowBounds rowBounds) {
		List<Space> sList = sStore.selectHeartDesc(session, rowBounds);
		return sList;
	}

	@Override
	public List<Space> printRivewDesc(RowBounds rowBounds) {
		List<Space> sList = sStore.selectRivewDesc(session, rowBounds);
		return sList;
	}

	@Override
	public List<Space> printRivewDescByArea(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectReviewDescByArea(session, search, rowBounds);
		return sList;
	}

	@Override
	public List<Space> printRivewDescByValue(Search search, RowBounds rowBounds) {
		List<Space> sList = sStore.selectRivewDescByValue(session, search, rowBounds);
		return sList;
	}

	@Override
	public int updateReply(HostReply hostReply) {
		int result = sStore.updateReply(session, hostReply);
		return result;
	}

	@Override
	public int deleteReply(Integer replyNo) {
		int result = sStore.deleteReply(session, replyNo);
		return result;
	}


	
}
