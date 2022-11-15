package com.kh.mobiil.partner.service.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mobiil.member.domain.Member;
import com.kh.mobiil.partner.domain.Partner;
import com.kh.mobiil.partner.domain.SearchPartner;
import com.kh.mobiil.partner.service.PartnerService;
import com.kh.mobiil.partner.store.PartnerStore;

@Service
public class PartnerServiceImpl implements PartnerService {

	@Autowired
	private PartnerStore pStore;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int registerPartner(Partner partner) {
		int result = pStore.insertPartner(partner, session);
		return result;
	}

	@Override
	public int updateImage(Partner partner) {
		int result = pStore.updatePartnerImage(partner, session);
		return result;
	}

	@Override
	public int updatePartnerContents(Partner partner) {
		int result = pStore.updatePartnerContents(partner, session);
		return result;
	}

	@Override
	public int approvePartner(int partnerNo) {
		int result = pStore.updateApproval(partnerNo, session);
		return result;
	}

	@Override
	public int deletePartner(int partnerNo) {
		int result = pStore.deletePartnerInfo(partnerNo, session);
		return result;
	}

	@Override
	public Partner findByEmail(String memberEmail) {
		Partner pOne = pStore.selectOnePartner(memberEmail, session);
		return pOne;
	}

	@Override
	public Partner findByPartnerNo(int partnerNo) {
		Partner partner = pStore.selectOnePartnerByNo(partnerNo, session);
		return partner;
	}

	@Override
	public Partner printOnePartner(String memberNick) {
		Partner pOne = pStore.selectOnePartnerByMemberNick(memberNick, session);
		return pOne;
	}

	@Override
	public List<Partner> printAllPartner(SearchPartner sp, RowBounds rowBounds) {
		List<Partner> pList = pStore.selectPartnerList(sp,rowBounds,session);
		return pList;
	}

	@Override
	public int getTotalCount(SearchPartner sp) {
		int result = pStore.selectTotalCount(sp, session);
		return result;
	}

	@Override
	public int getApprovedPartnerCount() {
		int result = pStore.selectApprovedPartnerCount(session);
		return result;
	}

	@Override
	public int getNotApprovedPartnerCount() {
		int result = pStore.selectNotApprovedPartnerCount(session);
		return result;
	}

	@Override
	public int sendMail(int partnerNo) {
		int result = pStore.updateRejectMail(partnerNo, session);
		return result;
	}

}
