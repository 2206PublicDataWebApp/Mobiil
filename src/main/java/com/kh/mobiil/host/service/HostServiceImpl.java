package com.kh.mobiil.host.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.host.store.HostStore;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;

@Service
public class HostServiceImpl implements HostService{

	@Autowired
	private HostStore hStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public Host getHostInfo(String hostEmail) {
		Host host = hStore.getHostInfo(session, hostEmail);
		return host;
	}

	@Override
	public int hostModify(Host host) {
		int result = hStore.hostModify(session, host);
		return result;
	}

	@Override
	public int getRegervationTotalCount() {
		int result = hStore.getRegervationTotalCount(session);
		return result;
	}

	@Override
	public List<Reservation> regervationList(int currentPage, int limit) {
		List<Reservation> rList = hStore.regervationList(session, currentPage, limit);
		return rList;
	}
	
	@Override
	public int insertSpace(Space space) {
		int result = hStore.insertSpace(session, space);
		return result;
	}

	@Override
	public int insertSpaceImg(SpaceImg spaceImg) {
		int result = hStore.insertSpaceImg(session, spaceImg);
		return result;
	}

	@Override
	public int getSpaceTotalCount() {
		int result = hStore.getSpaceTotalCount(session);
		return result;
	}

	@Override
	public List<Space> spaceList(RowBounds rowBounds) {
		List<Space> sList = hStore.spaceList(session, rowBounds );
		return sList;
	}
	
	@Override
	public List<Space> spaceListByhostEmail(RowBounds rowBounds, String hostEmail) {
		List<Space> sList = hStore.spaceListByhostEmail(session, rowBounds, hostEmail );
		return sList;
	}
	
	@Override
	public Space spaceByNo(Integer spaceNo) {
		Space space = hStore.spaceByNo(session, spaceNo);
		return space;
	}

	@Override
	public List<SpaceImg> spaceImgByNo(int spaceNo) {
		List<SpaceImg> sImg = hStore.spaceImgByNo(session, spaceNo);
		return sImg;
	}

	@Override
	public int spaceModify(Space space) {
		int result = hStore.spaceModify(session, space);
		return result;
	}

	@Override
	public int spaceImgModify(SpaceImg spaceImg) {
		int result = hStore.spaceImgModify(session, spaceImg);
		return result;
	}

	@Override
	public int spaceRemove(Integer spaceNo) {
		int result = hStore.spaceRemove(session, spaceNo);
		return result;
	}

	@Override
	public Reservation regervationByNo(String reservationNo) {
		Reservation regervation = hStore.regervationByNo(session, reservationNo);
		return regervation;
	}

	@Override
	public int reservationModify(Reservation reservation) {
		int result = hStore.reservationModify(session, reservation);
		return result;
	}

	@Override
	public int reservationRemove(String reservationNo) {
		int result = hStore.reservationRemove(session, reservationNo);
		return result;
	}

	@Override
	public List<Reservation> rListByDate(Date date1, Date date2, String hostEmail1) {
		List<Reservation> rList = hStore.rListByDate(session, date1, date2, hostEmail1);
		return rList;
	}

	@Override
	public int getHostCount() {
		int result = hStore.selectHostCount(session);
		return result;
	}
	@Override	
	public List<Reservation> regervationList() {
		List<Reservation> rList = hStore.regervationList(session);
		return rList;
	}

	@Override
	public int approveSpace(int spaceNo) {
		int result = hStore.approveSpace(session, spaceNo);
		return result;
	}

	@Override
	public int sendMail(int spaceNo) {
		int result = hStore.sendMail(session, spaceNo);
		return result;
	}

}
