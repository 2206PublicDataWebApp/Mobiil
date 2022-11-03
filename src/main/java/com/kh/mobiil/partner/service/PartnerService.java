package com.kh.mobiil.partner.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.partner.domain.Partner;
import com.kh.mobiil.partner.domain.SearchPartner;

public interface PartnerService {
	
	//파트너로 등록하기
	public int registerPartner(Partner partner);

	//이메일로 파트너 정보 찾기
	public Partner findByEmail(String memberEmail);

	// 검색조건에 맞는 파트너 갯수 구하기
	public int getTotalCount(SearchPartner sp);

	// 검색조건에 맞는 파트너 리스트 출력
	public List<Partner> printAllPartner(SearchPartner sp, RowBounds rowBounds);

	//파트너 넘버로 파트너 정보 찾기
	public Partner findByPartnerNo(int partnerNo);

	//파트너 넘버로 파트너 승인하기
	public int approvePartner(int partnerNo);

	//파트너 정보 내용 수정
	public int updatePartnerContents(Partner partner);

	//파트너 정보 삭제
	public int deletePartner(int partnerNo);

	// 메일 보내고 메일 발송 여부 업데이트
	public int sendMail(int partnerNo);

	//승인 파트너 수 추출
	public int getApprovedPartnerCount();

	//미승인 파트너 수 추출
	public int getNotApprovedPartnerCount();

	// 파트너 1명 추출
	public Partner printOnePartner(String memberNick);

	// 파트너 프사 수정
	public int updateImage(Partner partner);
	

}
