package com.kh.mobiil.host.store;

import java.util.List;

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

	List<Space> spaceList(SqlSession session, int currentPage, int boardLimit);

	Space spaceByNo(SqlSession session, Integer spaceNo);

	List<SpaceImg> spaceImgByNo(SqlSession session, int spaceNo);

	int spaceModify(SqlSession session, Space space);

	int spaceImgModify(SqlSession session, SpaceImg spaceImg);

	int spaceRemove(SqlSession session, Integer spaceNo);
}
