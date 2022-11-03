package com.kh.mobiil.host.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;



public interface HostService {

	Host getHostInfo(String hostEmail);
	
	int hostModify(Host host);

	int getRegervationTotalCount(String hostEmail);

	List<Reservation> regervationList(int currentPage, int imit, String hostEmail);
	
	int insertSpace(Space space);

	int insertSpaceImg(SpaceImg spaceImg);

	int getSpaceTotalCount(String hostEmail);

	Space spaceByNo(Integer spaceNo);

	List<SpaceImg> spaceImgByNo(int spaceNo);

	int spaceModify(Space space);

	int spaceImgModify(SpaceImg spaceImg);

	int spaceRemove(Integer spaceNo);

	List<Space> spaceList(int currentPage, int boardLimit);

	Reservation regervationByNo(String reservationNo);

	int reservationModify(Reservation reservation);

	int reservationRemove(String reservationNo);

	List<Reservation> rListByDate(int currentPage, int boardLimit, Date date1, Date date2, String hostEmail1);

	
	//////////어드민 대시보드 숫자뽑는 메소드들//////
	int getHostCount();

	int approveSpace(int spaceNo);

	int sendMail(int spaceNo);

	List<Space> spaceListByhostEmail(int currentPage, int boardLimit, String hostEmail1);

	List<Reservation> regervationListByHostemail(String hostEmail, int monthValue);

	int getSpaceTotalCount();

	int getRegervationTotalCountByDate(Date date1, Date date2, String hostEmail);

	int priceSumByHostemail(String hostEmail);

}
