package com.kh.mobiil.member.service;

import java.util.List;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.space.domain.Reservation;

public interface MemberService {

	// 멤버(개인)
	
	public int registerMember(Member member); // 회원가입


	public Member loginMember(Member member); // 로그인

	public Member printOneByEmail(String memberEmail); // my page(my info)

	public int modifyMember(Member member); // 정보 수정
	
	public int removeMember(String memberEmail); // 회원 탈퇴
	
	public int checkDupEmail(String memberEmail); // 이메일 중복 체크

	public int checkDupNick(String memberNick); // 닉네임 중복 체크
	
	public int getTotalCount(); // 마이페이지 -> 결제 내역 조회
	
	public List<Reservation> printAllReserve(String memberEmail, int currentPage, int reserveLimit); // 마이페이지 -> 결제 내역 조회
	
	public Reservation printOneByNo(Integer reservationNo); // 마이페이지 -> 결제 상세 내역

	// 호스트
	
	public int registerHost(Host host); // 회원가입

	public Host loginHost(Host host); // 로그인

	public int checkDupHostEmail(String hostEmail); // 이메일 중복 체크








	

	

}
