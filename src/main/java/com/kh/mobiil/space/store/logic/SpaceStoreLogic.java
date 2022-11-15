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
import com.kh.mobiil.space.domain.Search;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;
import com.kh.mobiil.space.store.SpaceStore;

@Repository
public class SpaceStoreLogic implements SpaceStore{

	// 리스트 전체 게시물 개수
	@Override
	public int selectTotalCount(SqlSessionTemplate session, Search search) {
		int totalCount = session.selectOne("SpaceMapper.selectTotalCount", search);
		return totalCount;
	}
	
	// 가격에 대한 게시물 개수
	@Override
	public int selectPriceCount(SqlSessionTemplate session, Search search) {
		int totalCount = session.selectOne("SpaceMapper.selectPriceCount", search);
		return totalCount;
	}

	// 검색에 대한 게시물 개수
	@Override
	public int selectSearchCount(SqlSessionTemplate session, Search search) {
		int totalCount = session.selectOne("SpaceMapper.selectSearchCount", search);
		return totalCount;
	}

	// 지역에 대한 게시물 개수
	@Override
	public int selectAreaCount(String area, SqlSessionTemplate session) {
		int result = session.selectOne("SpaceMapper.selectAreaCount", area);
		return result;
	}

	// 조건X 공간 리스트 출력
	@Override
	public List<Space> selectSpace(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.selectAllSpace", search, rowBounds);
		return sList;
	}

	// 가격+최신순 리스트 출력
	@Override
	public List<Space> selectDateDescByPrice(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.dateDescByPrice", search, rowBounds);
		return sList;
	}

	// 지역+최신순 리스트 출력
	@Override
	public List<Space> selectDateDescByArea(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.dateDescByArea", search, rowBounds);
		return sList;
	}

	// 검색+최신순 리스트 출력
	@Override
	public List<Space> selectDateDescByValue(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.dateDescByValue", search, rowBounds);
		return sList;
	}

	// 찜많은순 전체 리스트 출력
	@Override
	public List<Space> selectHeartDesc(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.heartSortDesc", search, rowBounds);
		return sList;
	}

	// 가격+찜많은순 리스트 출력
	@Override
	public List<Space> selectHeartDescByPrice(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.heartDescByPrice", search, rowBounds);
		return sList;
	}

	// 지역+찜많은순 리스트 출력
	@Override
	public List<Space> selectHeartDescByArea(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.heartDescByArea", search, rowBounds);
		return sList;
	}

	// 검색+찜많은순 리스트 출력
	@Override
	public List<Space> selectHeartDescByValue(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.heartDescByValue", search, rowBounds);
		return sList;
	}

	// 리뷰많은순 전체 리스트 출력
	@Override
	public List<Space> selectRivewDesc(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.reviewSortDesc", search, rowBounds);
		return sList;
	}

	// 가격+리뷰많은순 리스트 출력
	@Override
	public List<Space> selectReviewDescByPrice(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.reviewDescByPrice", search, rowBounds);
		return sList;
	}

	// 지역+리뷰많은순 리스트 출력
	@Override
	public List<Space> selectReviewDescByArea(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.reviewDescByArea", search, rowBounds);
		return sList;
	}

	// 검색+리뷰많은순 리스트 출력
	@Override
	public List<Space> selectRivewDescByValue(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.reviewDescByValue", search, rowBounds);
		return sList;
	}

	// 검색시 리스트 출력
	@Override
	public List<Space> selectAllByValue(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.selectAllByValue", search, rowBounds);
		return sList;
	}

	// 지역 정렬시 게시물 개수
	@Override
	public int selectByAreaCount(Search search, SqlSessionTemplate session) {
		int result = session.selectOne("SpaceMapper.selectByAreaCount", search);
		return result;
	}

	// 지역 리스트 출력
	@Override
	public List<Space> selectByArea(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.selectByArea", search, rowBounds);
		return sList;
	}

	// 가격 리스트 출력
	@Override
	public List<Space> selectByPrice(SqlSessionTemplate session, Search search, RowBounds rowBounds) {
		List<Space> sList = session.selectList("SpaceMapper.selectByPrice", search, rowBounds);
		return sList;
	}

	// 공간 상세 조회
	@Override
	public Space selectOneByNo(SqlSessionTemplate session, Integer spaceNo) {
		Space space = session.selectOne("SpaceMapper.selectOneByNo", spaceNo);
		return space;
	}

	// 공간 이미지 조회
	@Override
	public List<SpaceImg> selectImg(SqlSessionTemplate session, Integer spaceNo) {
		List<SpaceImg> iList = session.selectList("SpaceMapper.selectImg", spaceNo);
		return iList;
	}

	// 리뷰 조회
	@Override
	public List<Review> selectReview(SqlSessionTemplate session, Integer spaceNo) {
		List<Review> rList = session.selectList("SpaceMapper.selectReview", spaceNo);
		return rList;
	}

	// 리뷰 이미지 조회
	@Override
	public List<ReviewImg> selectReviewImg(SqlSessionTemplate session, Integer reviewNo) {
		List<ReviewImg> riList = session.selectList("SpaceMapper.selectReviewImg", reviewNo);
		return riList;
	}

	// 호스트 댓글 조회
	@Override
	public List<HostReply> selectReply(SqlSessionTemplate session, int reviewNo) {
		List<HostReply> hrList = session.selectList("SpaceMapper.selectReply", reviewNo);
		return hrList;
	}

	// 호스트 댓글 등록
	@Override
	public int insertReply(SqlSessionTemplate session, HostReply hostReply) {
		int result = session.insert("SpaceMapper.insertReply", hostReply);
		return result;
	}

	// 호스트 댓글 수정
	@Override
	public int updateReply(SqlSessionTemplate session, HostReply hostReply) {
		int result = session.update("SpaceMapper.updateReply", hostReply);
		return result;
	}

	// 호스트 댓글 삭제
	@Override
	public int deleteHeart(SqlSessionTemplate session, Heart heart) {
		int result = session.delete("SpaceMapper.deleteHeart", heart);
		return result;
	}

	// 찜 여부 체크
	@Override
	public int checkHeart(SqlSessionTemplate session, Integer spaceNo, String memberEmail) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("spaceNo",spaceNo);
		paramMap.put("memberEmail",memberEmail);
		int result = session.selectOne("SpaceMapper.checkHeart", paramMap);
		return result;
	}

	// 찜 추가
	@Override
	public int insertHeart(SqlSessionTemplate session, Heart heart) {
		int result = session.insert("SpaceMapper.insertHeart", heart);
		return result;
	}

	// 찜 삭제
	@Override
	public int deleteReply(SqlSessionTemplate session, Integer replyNo) {
		int result = session.delete("SpaceMapper.deleteReply", replyNo);
		return result;
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

	// 예약 정보 저장
	@Override
	public int insertReservation(SqlSessionTemplate session, Reservation rsv) {
		int result = session.insert("SpaceMapper.insertReservation", rsv);
		return result;
	}

	// 예약 정보 조회
	@Override
	public Reservation selectRsv(SqlSessionTemplate session, String reservationNo) {
		Reservation rsv = session.selectOne("SpaceMapper.selectResevation", reservationNo);
		return rsv;
	}

	//지도에 전부 출력할라고 만든 메소드
	@Override
	public List<Space> selectAllSpace(SqlSessionTemplate session) {
		List<Space> sList = session.selectList("SpaceMapper.selectAllSpaceForMap");
		return sList;
	}

}
