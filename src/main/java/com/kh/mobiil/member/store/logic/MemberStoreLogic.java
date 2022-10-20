package com.kh.mobiil.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

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
	public Member selectOneByEmail(SqlSession session, String memberEmail) {
		Member member = session.selectOne("MemberMapper.selectOneByEmail", memberEmail);
		return member;
	}

}
