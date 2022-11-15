package com.kh.mobiil.member.store;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;

public interface MemberStore {
	
	// 멤버(개인)
	
	public int insertMember(SqlSession session, Member member); // 회원가입

	public int checkDupEmail(SqlSession session, String memberEmail); // 이메일 중복 체크

	public int checkDupNick(SqlSession session, String memberNick); // 닉네임 중복 체크

	public Member selectLoginMember(SqlSession session, Member member); // 로그인

	public int checkMemDupEmail(SqlSession session, String memberEmail); // 비밀번호 변경 시 이메일 존재 체크(개인)

	public int updatePwd(SqlSession session, Member member); // 비밀번호 찾기 후 변경

	public Member selectOneByEmail(SqlSession session, String memberEmail); // my page

	public int updateMember(SqlSession session, Member member); // 정보 수정
	
	public int selectTotalCount(SqlSession session, String memberEmail); // 결제 내역

	public List<Reservation> selectAllReserve(SqlSession session, String memberEmail, int currentPage, int reserveLimit); // 결제 내역

	public Reservation selectOneByNo(SqlSession session, String reservationNo); // 결제 상세 내역

	public int getSpaceTotalCount(SqlSession session, String memberEmail);

	public List<Space> selectMySpace(SqlSession session, String memberEmail, int currentPage, int spaceLimit);

	public Member findKakao(HashMap<String, Object> loginUser);

	public void registKakao(HashMap<String, Object> loginUser);

	public Member selectNickByKEmail(SqlSession session, String memberEmail);

	public int updateNick(SqlSession session, Member member);

	public int updateKakaoMember(SqlSession session, Member member);

	public Member selectOneByKEmail(SqlSession session, String memberEmail);

	public int deleteMember(SqlSession session, String memberEmail); // 회원 탈퇴(일반)
	
	public int deleteKakaoMember(SqlSession session, String memberEmail); // 회원 탈퇴(카카오)
	
	// 호스트
	
	public int insertHost(SqlSession session, Host host); // 가입

	public int checkDupHostEmail(SqlSession session, String hostEmail); // 이메일 중복 체크

	public Host selectLoginHost(SqlSession session, Host host); // 로그인

	public int checkHostDupEmail(SqlSession session, String hostEmail); // 비밀번호 변경 시 이메일 존재 체크(기업)

	public int updateHostPwd(SqlSession session, Host host);


	public int selectCountHostNick(String memberNick, SqlSessionTemplate session);

	////어드민 대시보드
	public int selectMemberCount(SqlSessionTemplate session);

	public int selecMemberDaily(int dayBefore, SqlSessionTemplate session);

	public int selecHostDaily(int dayBefore, SqlSessionTemplate session);

}
