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

	int getRegervationTotalCount(SqlSession session, String hostEmail);

	List<Reservation> regervationList(SqlSession session, int currentPage, int limit, String hostEmail);
	
	int insertSpace(SqlSession session, Space space);

	int insertSpaceImg(SqlSession session, SpaceImg spaceImg);

	int getSpaceTotalCount(SqlSession session, String hostEmail);

	List<Space> spaceList(SqlSession session, int currentPage, int boardLimit);

	Space spaceByNo(SqlSession session, Integer spaceNo);

	List<SpaceImg> spaceImgByNo(SqlSession session, int spaceNo);

	int spaceModify(SqlSession session, Space space);

	int spaceImgModify(SqlSession session, SpaceImg spaceImg);

	int spaceRemove(SqlSession session, Integer spaceNo);

	Reservation regervationByNo(SqlSession session, String reservationNo);

	int reservationModify(SqlSession session, Reservation reservation);

	int reservationRemove(SqlSession session, String reservationNo);

	List<Reservation> rListByDate(SqlSession session, int currentPage, int boardLimit, Date date1, Date date2, String hostEmail);

	int selectHostCount(SqlSession session);
	
	int approveSpace(SqlSession session, int spaceNo);

	int sendMail(SqlSession session, int spaceNo);

	List<Space> spaceListByhostEmail(SqlSession session, int currentPage, int boardLimit, String hostEmail1);

	List<Reservation> regervationListByHostemail(SqlSession session, String hostEmail, int monthValue);

	int getSpaceTotalCount(SqlSession session);

	int getRegervationTotalCountByDate(SqlSession session, Date date1, Date date2, String hostEmail);

	int priceSumByHostemail(SqlSession session, String hostEmail);

	int removeHost(SqlSession session, String hostEmail);

	List<Reservation> getRegervationCountByMonth(SqlSession session, String hostEmail);

	List<Space> getSpaceCountByMonth(SqlSession session, String hostEmail);

	List<Reservation> getProfitByMonth(SqlSession session, String hostEmail);

}
