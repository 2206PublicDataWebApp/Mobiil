package com.kh.mobiil.member.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.member.store.MemberStore;
import com.kh.mobiil.review.domain.Review;
import com.kh.mobiil.space.domain.Reservation;
import com.kh.mobiil.space.domain.Space;

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
	
	@Override
	public int checkDupEmail(SqlSession session, String memberEmail) { // 이메일 중복 체크
		int result = session.selectOne("MemberMapper.checkEmailDuplicate", memberEmail);
		return result;
	}
	
	
	@Override
	public int checkDupNick(SqlSession session, String memberNick) { // 닉네임 중복 체크
		int result = session.selectOne("MemberMapper.checkNickDuplicate", memberNick);
		return result;
	}
	
	@Override
	public int selectTotalCount(SqlSession session, String memberEmail) { // 결제 내역
		int result = session.selectOne("MemberMapper.selectTotalCount", memberEmail);
		return result;
	}

	@Override
	public List<Reservation> selectAllReserve(SqlSession session, String memberEmail, int currentPage, int reserveLimit) { // 결제 내역
		int offset = (currentPage-1) * reserveLimit;
		RowBounds rowBounds = new RowBounds(offset, reserveLimit);
		List<Reservation> rList = session.selectList("MemberMapper.selectAllReserve", memberEmail, rowBounds);
		return rList;
	}
	
	@Override
	public Reservation selectOneByNo(SqlSession session, String reservationNo) {
		Reservation reservation = session.selectOne("MemberMapper.selectOneByNo", reservationNo);
		return reservation;
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

	@Override
	public int checkDupHostEmail(SqlSession session, String hostEmail) { // 이메일 중복 체크
		int result = session.selectOne("MemberMapper.checkHostEmailDuplicate", hostEmail);
		return result;
	}
	
	// 비밀번호 찾기 후 변경
	@Override
	public int updatePwd(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updatePwd", member);
		return result;
	}

	@Override // 비밀번호 변경 시 이메일 존재 체크(개인)
	public int checkMemDupEmail(SqlSession session, String memberEmail) {
		int result = session.selectOne("MemberMapper.checkMemDupEmail", memberEmail); 
		return result;
	}

	@Override // 비밀번호 변경 시 이메일 존재 체크(기업)
	public int checkHostDupEmail(SqlSession session, String hostEmail) {
		int result = session.selectOne("MemberMapper.checkHostDupEmail", hostEmail);
		return result;
	}

	@Override
	public int updateHostPwd(SqlSession session, Host host) {
		int result = session.update("MemberMapper.updateHostPwd", host);
		return result;
	}

	
	////////어드민 대시보드

	@Override
	public int selectMemberCount(SqlSessionTemplate session) {
		int result = session.selectOne("MemberMapper.selectMemberCount");
		return result;
	}

	@Override
	public int selecMemberDaily(int dayBefore, SqlSessionTemplate session) {
		int result = session.selectOne("MemberMapper.selectMemberDailyCount", dayBefore);
		return result;
	}

	@Override
	public int selecHostDaily(int dayBefore, SqlSessionTemplate session) {
		int result = session.selectOne("MemberMapper.selectHostDailyCount", dayBefore);
		return result;
	}

	@Autowired
	private SqlSessionTemplate session;
	
	// 정보 저장
	@Override
	public void registKakao(HashMap<String, Object> loginUser) {
		session.insert("MemberMapper.registKakao", loginUser);
	}
	
	// 정보 확인
	@Override
	public Member findKakao(HashMap<String, Object> loginUser) {
		System.out.println("RN:"+loginUser.get("nickname"));
		System.out.println("RE:"+loginUser.get("email"));
		Member member = session.selectOne("MemberMapper.findKakao", loginUser);
		return member;
}

	@Override
	public Member selectOneByName(SqlSession session, String memberName) {
		Member member = session.selectOne("MemberMapper.selectOneByName", memberName);
		return member;
	}


	@Override
	public int updateKakaoMember(SqlSession session, Member member) {
		int result = session.update("MemberMapper.updateKakaoMember", member);
		return result;
	}

	@Override
	public int getSpaceTotalCount(SqlSession session, String memberEmail) {
		int result = session.selectOne("MemberMapper.getSpaceTotalCount", memberEmail);
		return result;
	}

	@Override
	public List<Space> selectMySpace(SqlSession session, String memberEmail, int currentPage, int spaceLimit) {
		int offset = (currentPage-1) * spaceLimit;
		RowBounds rowBounds = new RowBounds(offset, spaceLimit);
		List<Space> sList = session.selectList("MemberMapper.selectMySpace", memberEmail, rowBounds);
		return sList;
	}

}
