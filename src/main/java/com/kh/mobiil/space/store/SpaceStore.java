package com.kh.mobiil.space.store;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.review.domain.ReviewImg;
import com.kh.mobiil.space.domain.Heart;
import com.kh.mobiil.space.domain.HostReply;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Search;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;

public interface SpaceStore {
	// 리스트 전체 게시물 개수
	int selectTotalCount(SqlSessionTemplate session, Search search);
	// 가격에 대한 게시물 개수
	int selectPriceCount(SqlSessionTemplate session, Search search);
	// 검색에 대한 게시물 개수
	int selectSearchCount(SqlSessionTemplate session, Search search);
	// 지역에 대한 게시물 개수
	int selectAreaCount(String area, SqlSessionTemplate session);
	// 조건X 공간 리스트 출력
	List<Space> selectSpace(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 가격+최신순 리스트 출력
	List<Space> selectDateDescByPrice(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 지역+최신순 리스트 출력
	List<Space> selectDateDescByArea(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 검색+최신순 리스트 출력
	List<Space> selectDateDescByValue(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 찜많은순 전체 리스트 출력
	List<Space> selectHeartDesc(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 가격+찜많은순 리스트 출력
	List<Space> selectHeartDescByPrice(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 지역+찜많은순 리스트 출력
	List<Space> selectHeartDescByArea(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 검색+찜많은순 리스트 출력
	List<Space> selectHeartDescByValue(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 리뷰많은순 전체 리스트 출력
	List<Space> selectRivewDesc(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 가격+리뷰많은순 리스트 출력
	List<Space> selectReviewDescByPrice(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 지역+리뷰많은순 리스트 출력
	List<Space> selectReviewDescByArea(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 검색+리뷰많은순 리스트 출력
	List<Space> selectRivewDescByValue(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 검색시 리스트 출력
	List<Space> selectAllByValue(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 지역 정렬시 게시물 개수
	int selectByAreaCount(Search search, SqlSessionTemplate session);
	// 지역 리스트 출력
	List<Space> selectByArea(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 가격 리스트 출력
	List<Space> selectByPrice(SqlSessionTemplate session, Search search, RowBounds rowBounds);
	// 공간 상세 조회
	Space selectOneByNo(SqlSessionTemplate session, Integer spaceNo);
	// 공간 이미지 조회
	List<SpaceImg> selectImg(SqlSessionTemplate session, Integer spaceNo);
	// 리뷰 조회
	List<Review> selectReview(SqlSessionTemplate session, Integer spaceNo);
	// 리뷰 이미지 조회
	List<ReviewImg> selectReviewImg(SqlSessionTemplate session, Integer reviewNo);
	// 호스트 댓글 조회
	List<HostReply> selectReply(SqlSessionTemplate session, int reviewNo);
	// 호스트 댓글 등록
	int insertReply(SqlSessionTemplate session, HostReply hostReply);
	// 호스트 댓글 수정
	int updateReply(SqlSessionTemplate session, HostReply hostReply);
	// 호스트 댓글 삭제
	int deleteReply(SqlSessionTemplate session, Integer replyNo);
	// 찜 여부 체크
	int checkHeart(SqlSessionTemplate session, Integer spaceNo, String memberEmail);
	// 찜 추가
	int insertHeart(SqlSessionTemplate session, Heart heart);
	// 찜 삭제
	int deleteHeart(SqlSessionTemplate session, Heart heart);
	// 날짜 및 시간 유효성 검사
	int checkTime(SqlSessionTemplate session, String start, String end, String reservDate);
	// 예약 정보 저장
	int insertReservation(SqlSessionTemplate session, Reservation rsv);
	// 예약 정보 조회
	Reservation selectRsv(SqlSessionTemplate session, String reservationNo);
	// 지도 모든 스페이스 리스트
	List<Space> selectAllSpace(SqlSessionTemplate session);
	
}
