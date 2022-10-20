package com.kh.mobiil.member.store;

import org.apache.ibatis.session.SqlSession;

import com.kh.mobiil.member.domain.Member;

public interface MemberStore {

	public int insertMember(SqlSession session, Member member); // 회원가입

	public Member selectLoginMember(SqlSession session, Member member); // 로그인

	public Member selectOneByEmail(SqlSession session, String memberEmail); // my page

}
