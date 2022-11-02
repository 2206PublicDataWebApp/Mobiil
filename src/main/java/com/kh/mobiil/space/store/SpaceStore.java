package com.kh.mobiil.space.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.space.domain.Heart;
import com.kh.mobiil.space.domain.HostReply;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;

public interface SpaceStore {
	// 날짜 및 시간 유효성 검사
	int checkTime(SqlSessionTemplate session, String start, String end, String reservDate);
	// 리스트 전체 게시물 개수
	int selectTotalCount(SqlSessionTemplate session, String area, String searchValue);
	int selectPriceCount(SqlSessionTemplate session, Integer minNum, Integer maxNum);
	List<Space> selectSpace(SqlSessionTemplate session, RowBounds rowBounds);
	Space selectOneByNo(SqlSessionTemplate session, Integer spaceNo);
	List<SpaceImg> selectImg(SqlSessionTemplate session, Integer spaceNo);
	List<Space> selectAllByValue(SqlSessionTemplate session, String searchValue, RowBounds rowBounds);
	List<Space> selectByArea(SqlSessionTemplate session, String area, RowBounds rowBounds);
	List<Space> selectByPrice(SqlSessionTemplate session, Integer minNum, Integer maxNum, RowBounds rowBounds);
	int insertReservation(SqlSessionTemplate session, Reservation rsv);
	int selectAreaCount(String area, SqlSessionTemplate session);
	// 모든 스페이스 리스트
	List<Space> selectAllSpace(SqlSessionTemplate session);
	int checkHeart(SqlSessionTemplate session, Integer spaceNo, String memberEmail);
	int insertHeart(SqlSessionTemplate session, Heart heart);
	int deleteHeart(SqlSessionTemplate session, Heart heart);
	Reservation selectRsv(SqlSessionTemplate session, String reservationNo);
	List<Review> selectReview(SqlSessionTemplate session, Integer spaceNo);
	int insertReply(SqlSessionTemplate session, HostReply hostReply);
	List<HostReply> selectReply(SqlSessionTemplate session, int reviewNo);
	
}
