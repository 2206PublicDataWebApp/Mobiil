package com.kh.mobiil.member.service.logic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.member.service.MemberService;
import com.kh.mobiil.member.store.MemberStore;
import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.space.domain.Reservation;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MemberStore mStore;

	// 멤버(개인)
	
	@Override
	public int registerMember(Member member) { // 회원가입
		int result = mStore.insertMember(session, member);
		return result;
	}

	@Override
	public Member loginMember(Member member) { // 로그인
		Member mOne = mStore.selectLoginMember(session, member);
		return mOne;
	}

	@Override
	public Member printOneByEmail(String memberEmail) { // my page
		Member member = mStore.selectOneByEmail(session, memberEmail);
		return member;
	}
	
	@Override
	public int modifyMember(Member member) { // 정보 수정
		int result = mStore.updateMember(session, member);
		return result;
	}
	
	@Override
	public int removeMember(String memberEmail) { // 회원 탈퇴
		int result = mStore.deleteMember(session, memberEmail);
		return result;
	}
	
	@Override
	public int checkDupEmail(String memberEmail) { // 이메일 중복 체크
		int result = mStore.checkDupEmail(session, memberEmail);
		return result;
	}


	@Override
	public int checkDupNick(String memberNick) { // 닉네임 중복 체크
		int result = mStore.checkDupNick(session, memberNick);
		return result;
	}

	@Override
	public int getTotalCount() {
		int totalCount = mStore.selectTotalCount(session);
		return totalCount;
	}

	@Override
	public List<Reservation> printAllReserve(String memberEmail, int currentPage, int reserveLimit) {
		List<Reservation> rList = mStore.selectAllReserve(session, memberEmail, currentPage, reserveLimit);
		return rList;
	}
	
	@Override
	public Reservation printOneByNo(Integer reservationNo) {
		Reservation reservation = mStore.selectOneByNo(session, reservationNo);
		return reservation;
	}
	
	// 호스트
	
	@Override
	public int registerHost(Host host) { // 회원가입
		int result = mStore.insertHost(session, host);
		return result;
	}

	@Override
	public Host loginHost(Host host) { // 로그인
		Host hOne = mStore.selectLoginHost(session, host);
		return hOne;
	}

	@Override
	public int checkDupHostEmail(String hostEmail) {  // 이메일 중복 체크
		int result = mStore.checkDupHostEmail(session, hostEmail);
		return result;
	}

	/////////////어드민 대시보드
	@Override
	public int getMemberCount() {
		int result = mStore.selectMemberCount(session);
		return result;
	}

	@Override
	public int getDailyNewMember(int dayBefore) {
		int result = mStore.selecMemberDaily(dayBefore, session);
		return result;
	}

	@Override
	public int getDailyNewHost(int dayBefore) {
		int result = mStore.selecHostDaily(dayBefore, session);
		return result;
	}


	
}
