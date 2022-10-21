package com.kh.mobiil.member.service;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;

public interface MemberService {

	// 멤버(개인)
	
	public int registerMember(Member member); // 회원가입

	public Member loginMember(Member member); // 로그인

	public Member printOneByEmail(String memberEmail); // my page(my info)

	public int modifyMember(Member member); // 정보 수정
	
	public int removeMember(String memberEmail); // 회원 탈퇴
	
	// 호스트
	
	public int registerHost(Host host); // 회원가입

	public Host loginHost(Host host); // 로그인

	

	

}
