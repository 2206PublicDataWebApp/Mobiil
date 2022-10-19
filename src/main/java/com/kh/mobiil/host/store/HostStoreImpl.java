//package com.kh.mobiil.host.store;
//
//import java.util.List;
//
//import org.apache.ibatis.session.RowBounds;
//import org.apache.ibatis.session.SqlSession;
//import org.springframework.stereotype.Repository;
//
//import com.kh.mobiil.host.domain.Host;
//
//import domain.space;
//import domain.spaceImg;
//import regervation.Reservation;
//
//@Repository
//public class HostStoreImpl implements HostStore{
//
//	@Override
//	public Host getHostInfo(SqlSession session, String hostId) {
//		Host host = session.selectOne("HostMapper.selectHost", hostId);
//		return host;
//	}
//
//	@Override
//	public int hostModify(SqlSession session, Host host) {
//		int result = session.update("HostMapper.hostModify", host);
//		return result;
//	}
//
//	@Override
//	public int getRegervationTotalCount(SqlSession session) {
//		int result = session.selectOne("HostMapper.getRegervationTotalCount");
//		return result;
//	}
//
//	@Override
//	public List<Reservation> regervationList(SqlSession session, int currentPage, int limit) {
//		int offset = (currentPage-1)*limit;
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		List<Reservation> rList = session.selectList("HostMapper.regervationList", null, rowBounds);
//		return rList;
//	}
//	
//	@Override
//	public int insertSpace(SqlSession session, space space) {
//		int result = session.insert("HostMapper.insertSpace",space);
//		return result;
//	}
//
//	@Override
//	public int insertSpaceImg(SqlSession session, spaceImg spaceImg) {
//		int result = session.insert("HostMapper.insertSpaceImg", spaceImg);
//		return result;
//	}
//
//	@Override
//	public int getSpaceTotalCount(SqlSession session) {
//		int result = session.selectOne("HostMapper.getSpaceTotalCount");
//		return result;
//	}
//
//	@Override
//	public List<space> spaceList(SqlSession session, int currentPage, int boardLimit) {
//		int offset = (currentPage-1)*boardLimit;
//		RowBounds rowBounds = new RowBounds(offset, boardLimit);
//		List<space> sList = session.selectList("HostMapper.spaceList",null, rowBounds);
//		return sList;
//	}
//
//}
