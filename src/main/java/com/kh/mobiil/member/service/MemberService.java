package com.kh.mobiil.member.service;

import java.util.List;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;

public interface MemberService {

	// 멤버(개인)
	public int registerMember(Member member); // 회원가입

	public int checkDupEmail(String memberEmail); // 회원가입 시 이메일 중복 체크(개인+기업)

	public int checkDupNick(String memberNick); // 닉네임 중복 체크

	public Member loginMember(Member member); // 로그인

	public int checkMemDupEmail(String memberEmail); // 비밀번호 변경 시 이메일 존재 체크(개인)

	public int modifyPwd(Member member); // 비밀번호 찾기 후 변경

	public Member printOneByEmail(String memberEmail); // 마이페이지(내 정보)

	public int modifyMember(Member member); // 정보 수정

	public int getTotalCount(String memberEmail); // 마이페이지 -> 결제 내역 조회 갯수

	public List<Reservation> printAllReserve(String memberEmail, int currentPage, int reserveLimit); // 마이페이지 -> 결제 내역 조회
																										
	public Reservation printOneByNo(String reservationNo); // 마이페이지 -> 결제 상세 내역

	public int getSpaceTotalCount(String memberEmail); // 찜한 공간 갯수

	public List<Space> printMySpace(String memberEmail, int currentPage, int spaceLimit); // 찜한 공간 목록

	// 카카오 회원
	public String getAccessToken(String authorize_code); // 토큰 값 받기

	public Member getLoginUser(String access_Token); // 정보 받기

	public Member printNickByKEmail(String memberEmail); // 닉네임 변경 화면에 정보 출력

	public int modifyNick(Member member); // 닉네임 변경

	public int modifyKakaoMember(Member member); // 정보 수정

	public Member printOneByKEmail(String memberEmail); // 카카오 마이 페이지에 정보 출력

	public int removeMember(String memberEmail); // 회원 탈퇴(일반)

	public int removeKakaoMember(String memberEmail); // 회원 탈퇴(카카오)

	public void kakaoRemove(String access_Token); // 회원 탈퇴(카카오) 토큰키 unlink

	// 호스트(기업)

	public int registerHost(Host host); // 회원가입

	public int checkDupHostEmail(String hostEmail); // 이메일 중복 체크
	
	public Host loginHost(Host host); // 로그인

	public int checkHostDupEmail(String hostEmail); // 비밀번호 변경 시 이메일 존재 체크(기업)

	public int modifyHostPwd(Host host); // 비밀번호 찾기 후 변경


	
	public int getCountHostNick(String memberNick); // 멤버닉으로 몇명인지 체크

	// 어드민 대시보드
	public int getMemberCount();

	public int getDailyNewMember(int dayBefore); // 일일 일반 가입자

	public int getDailyNewHost(int dayBefore); // 일일 호스트 가입자

}
