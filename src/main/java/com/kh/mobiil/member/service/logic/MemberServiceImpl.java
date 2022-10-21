package com.kh.mobiil.member.service.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.member.service.MemberService;
import com.kh.mobiil.member.store.MemberStore;

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

	
}
