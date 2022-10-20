package com.kh.mobiil.member.service;

import com.kh.mobiil.member.domain.Member;

public interface MemberService {

	public int registerMember(Member member); // 회원가입

	public Member loginMember(Member member); // 로그인

	public Member printOneByEmail(String memberEmail); // my page

}
