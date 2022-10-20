package com.kh.mobiil.member.service.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.member.service.MemberService;
import com.kh.mobiil.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private MemberStore mStore;

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
	
	
	
	
	
	
}
