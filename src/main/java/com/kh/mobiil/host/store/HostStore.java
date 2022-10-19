//package com.kh.mobiil.host.store;
//
//import java.util.List;
//
//import org.apache.ibatis.session.SqlSession;
//
//import com.kh.mobiil.host.domain.Host;
//
//import domain.space;
//import domain.spaceImg;
//import regervation.Reservation;
//
//
//public interface HostStore {
//
//	Host getHostInfo(SqlSession session, String hostId);
//	
//	int hostModify(SqlSession session, Host host);
//
//	int getRegervationTotalCount(SqlSession session);
//
//	List<Reservation> regervationList(SqlSession session, int currentPage, int limit);
//	
//	int insertSpace(SqlSession session, space space);
//
//	int insertSpaceImg(SqlSession session, spaceImg spaceImg);
//
//	int getSpaceTotalCount(SqlSession session);
//
//	List<space> spaceList(SqlSession session, int currentPage, int boardLimit);
//}
