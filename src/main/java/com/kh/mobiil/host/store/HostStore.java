package com.kh.mobiil.host.store;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;



public interface HostStore {

	Host getHostInfo(SqlSession session, String hostEmail);
	
	int hostModify(SqlSession session, Host host);

	int getRegervationTotalCount(SqlSession session);

	List<Reservation> regervationList(SqlSession session, int currentPage, int limit);
	
	int insertSpace(SqlSession session, Space space);

	int insertSpaceImg(SqlSession session, SpaceImg spaceImg);

	int getSpaceTotalCount(SqlSession session);

	List<Space> spaceList(SqlSession session, RowBounds rowBounds);

	Space spaceByNo(SqlSession session, Integer spaceNo);

	List<SpaceImg> spaceImgByNo(SqlSession session, int spaceNo);

	int spaceModify(SqlSession session, Space space);

	int spaceImgModify(SqlSession session, SpaceImg spaceImg);

	int spaceRemove(SqlSession session, Integer spaceNo);

	Reservation regervationByNo(SqlSession session, String reservationNo);

	int reservationModify(SqlSession session, Reservation reservation);

	int reservationRemove(SqlSession session, String reservationNo);

	List<Reservation> rListByDate(SqlSession session, Date date1, Date date2);

	int selectHostCount(SqlSession session);
	
	List<Reservation> regervationList(SqlSession session);

	int approveSpace(SqlSession session, int spaceNo);

}
