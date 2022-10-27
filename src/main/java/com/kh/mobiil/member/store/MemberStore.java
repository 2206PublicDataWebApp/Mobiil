package com.kh.mobiil.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.space.domain.Reservation;

public interface MemberStore {
	
	// 멤버(개인)
	
	public int insertMember(SqlSession session, Member member); // 회원가입


	public Member selectLoginMember(SqlSession session, Member member); // 로그인

	public Member selectOneByEmail(SqlSession session, String memberEmail); // my page

	public int updateMember(SqlSession session, Member member); // 정보 수정
	
	public int deleteMember(SqlSession session, String memberEmail); // 회원 탈퇴
	
	public int checkDupEmail(SqlSession session, String memberEmail); // 이메일 중복 체크

	public int checkDupNick(SqlSession session, String memberNick); // 닉네임 중복 체크

	public int selectTotalCount(SqlSession session); // 결제 내역
	
	public List<Reservation> selectAllReserve(SqlSession session, int currentPage, int limit); // 결제 내역
	
	
	// 호스트
	
	public int insertHost(SqlSession session, Host host); // 가입

	public Host selectLoginHost(SqlSession session, Host host); // 로그인

	public int checkDupHostEmail(SqlSession session, String hostEmail); // 이메일 중복 체크


	////어드민 대시보드
	public int selectMemberCount(SqlSessionTemplate session);


	public int selecMemberDaily(int dayBefore, SqlSessionTemplate session);


	public int selecHostDaily(int dayBefore, SqlSessionTemplate session);












}
