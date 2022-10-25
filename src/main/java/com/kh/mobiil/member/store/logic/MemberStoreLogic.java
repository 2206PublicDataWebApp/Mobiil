package com.kh.mobiil.member.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.mobiil.host.domain.Host;
import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.member.store.MemberStore;
import com.kh.mobiil.space.domain.Reservation;

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
	public int selectTotalCount(SqlSession session) { // 결제 내역
		int result = session.selectOne("MemberMapper.selectTotalCount");
		return result;
	}

	@Override
	public List<Reservation> selectAllReserve(SqlSession session, int currentPage, int limit) { // 결제 내역
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Reservation> rList = session.selectList("MemberMapper.selectAllReserve", null, rowBounds);
		return rList;
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

}
