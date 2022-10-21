package com.kh.mobiil.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	// 멤버(개인)
	
	@Override
	public int insertMember(SqlSession session, Member member) { // 회원가입
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

	@Override
	public Member selectLoginMember(SqlSession session, Member member) { // 로그인
		Member mOne = session.selectOne("MemberMapper.selectLoginOne", member);
		return mOne;
	}

	@Override
	public Member selectOneByEmail(SqlSession session, String memberEmail) { // my page
		Member member = session.selectOne("MemberMapper.selectOneByEmail", memberEmail);
		return member;
	}

	@Override
	public int updateMember(SqlSession session, Member member) { // 정보수정
		int result = session.update("MemberMapper.updateMember", member);
		return result;
	}
	
	@Override
	public int deleteMember(SqlSession session, String memberEmail) { // 회원탈퇴
		int result = session.update("MemberMapper.deleteMember", memberEmail);
		return result;
	}
	
	// 호스트
	
	@Override
	public int insertHost(SqlSession session, Host host) { // 가입
		int result = session.insert("MemberMapper.insertHost", host);
		return result;
	}

	@Override
	public Host selectLoginHost(SqlSession session, Host host) { // 로그인
		Host hOne = session.selectOne("MemberMapper.selectLoginhOne", host);
		return hOne;
	}



}
