package com.kh.mobiil.partner.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

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
	

}
