package com.kh.mobiil.member.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;

public interface MemberStore {
	
	// 멤버(개인)
	
	public int insertMember(SqlSession session, Member member); // 회원가입

	public Member selectLoginMember(SqlSession session, Member member); // 로그인

	public Member selectOneByEmail(SqlSession session, String memberEmail); // my page

	public int updateMember(SqlSession session, Member member); // 정보 수정
	
	public int deleteMember(SqlSession session, String memberEmail); // 회원 탈퇴
	
	// 호스트
	
	public int insertHost(SqlSession session, Host host); // 가입

	public Host selectLoginHost(SqlSession session, Host host); // 로그인



}
