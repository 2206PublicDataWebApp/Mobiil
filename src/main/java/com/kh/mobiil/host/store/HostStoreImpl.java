package com.kh.mobiil.host.store;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;
import com.kh.mobiil.space.domain.SpaceImg;


@Repository
public class HostStoreImpl implements HostStore{

	@Override
	public Host getHostInfo(SqlSession session, String hostEmail) {
		Host host = session.selectOne("HostMapper.selectHost", hostEmail);
		return host;
	}

	@Override
	public int hostModify(SqlSession session, Host host) {
		int result = session.update("HostMapper.hostModify", host);
		return result;
	}

	@Override
	public int getRegervationTotalCount(SqlSession session, String hostEmail) {
		int result = session.selectOne("HostMapper.getRegervationTotalCount", hostEmail);
		return result;
	}

	@Override
	public List<Reservation> regervationList(SqlSession session, int currentPage, int limit, String hostEmail) {
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Reservation> rList = session.selectList("HostMapper.regervationList", hostEmail, rowBounds);
		return rList;
	}
	
	@Override
	public int insertSpace(SqlSession session, Space space) {
		int result = session.insert("HostMapper.insertSpace", space);
		return result;
	}

	@Override
	public int insertSpaceImg(SqlSession session, SpaceImg spaceImg) {
		int result = session.insert("HostMapper.insertSpaceImg", spaceImg);
		return result;
	}

	@Override
	public int getSpaceTotalCount(SqlSession session, String hostEmail) {
		int result = session.selectOne("HostMapper.getSpaceTotalCount", hostEmail);
		return result;
	}

	@Override
	public List<Space> spaceList(SqlSession session,int currentPage, int boardLimit) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBound = new RowBounds(offset, boardLimit);
		List<Space> sList = session.selectList("HostMapper.spaceList", null, rowBound);
		return sList;
	}

	@Override
	public List<Space> spaceListByhostEmail(SqlSession session, int currentPage, int boardLimit, String hostEmail1) {
		int offset = (currentPage-1)*boardLimit;
		RowBounds rowBounds = new RowBounds(offset, boardLimit);
		List<Space> sList = session.selectList("HostMapper.spaceListByhostEmail", hostEmail1, rowBounds);
		return sList;
	}
	
	@Override
	public Space spaceByNo(SqlSession session, Integer spaceNo) {
		Space space = session.selectOne("HostMapper.spaceByNo", spaceNo);
		return space;
	}

	@Override
	public List<SpaceImg> spaceImgByNo(SqlSession session, int spaceNo) {
		List<SpaceImg> sImg = session.selectList("HostMapper.spaceImgByNo", spaceNo);
		return sImg;
	}

	@Override
	public int spaceModify(SqlSession session, Space space) {
		int result = session.update("HostMapper.spaceModify", space);
		return result;
	}

	@Override
	public int spaceImgModify(SqlSession session, SpaceImg spaceImg) {
		int result = session.update("HostMapper.spaceImgModify", spaceImg);
		return result;
	}

	@Override
	public int spaceRemove(SqlSession session, Integer spaceNo) {
		int result = session.delete("HostMapper.spaceRemove", spaceNo);
		return result;
	}

	@Override
	public Reservation regervationByNo(SqlSession session, String reservationNo) {
		Reservation result = session.selectOne("HostMapper.regervationByNo", reservationNo);
		return result;
	}

	@Override
	public int reservationModify(SqlSession session, Reservation reservation) {
		int result = session.update("HostMapper.reservationModify", reservation);
		return result;
	}

	@Override
	public int reservationRemove(SqlSession session, String reservationNo) {
		int result = session.update("HostMapper.reservationRemove", reservationNo);
		return result;
	}

	@Override
	public List<Reservation> rListByDate(SqlSession session, Date date1, Date date2, String hostEmail) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("hostEmail", hostEmail);
		List<Reservation> rList = session.selectList("HostMapper.rListByDate", map);
		return rList;
	}

	@Override
	public int selectHostCount(SqlSession session) {
		int result =session.selectOne("HostMapper.selectHostCount");
		return result;
	}	
	
	@Override
	public int approveSpace(SqlSession session, int spaceNo) {
		int result = session.update("HostMapper.approveSpace", spaceNo);
		return result;
	}

	@Override
	public int sendMail(SqlSession session, int spaceNo) {
		int result = session.update("HostMapper.sendMail", spaceNo);
		return result;
	}

	@Override
	public List<Reservation> regervationListByHostemail(SqlSession session, String hostEmail, int monthValue) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("hostEmail", hostEmail);
		map.put("monthValue", monthValue);
		List<Reservation> rList = session.selectList("HostMapper.regervationListByHostemail", map);
		return rList;
	}

	@Override
	public int getSpaceTotalCount(SqlSession session) {
		int result = session.selectOne("HostMapper.getSpaceTotalCount_Admin");
		return result;
	}

}
